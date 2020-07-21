import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todos/todos_bloc.dart';
import 'package:todo/bloc/todos/todos_event.dart';
import 'package:todo/bloc/todos/todos_state.dart';
import 'package:todo/database/database.dart';
import 'package:todo/widgets/delete_todo_snackbar.dart';

class TasksList extends StatelessWidget {
  final String title;
  final Function(Todo) filterStatement;

  TasksList({this.title, this.filterStatement});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoadInProgress || state is TodosLoadFailure) {
          return Center(child: CircularProgressIndicator());
        } else {
          var todos = <Todo>[];
          if (this.filterStatement == null) {
            todos = (state as TodosLoaded).todos;
          } else {
            todos = (state as TodosLoaded).todos.where(filterStatement).toList();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ...todos.map(
                      (t) => TodoWidget(
                        key: UniqueKey(),
                        todo: t,
                        onComplete: () {
                          BlocProvider.of<TodosBloc>(context).add(
                            TodoUpdated(t.copyWith(completed: !t.completed)),
                          );
                        },
                        onDelete: (_) {
                          BlocProvider.of<TodosBloc>(context).add(
                            TodoUpdated(t.copyWith(isDeleted: true)),
                          );
                          Scaffold.of(context).showSnackBar(
                            DeleteTodoSnackbar(
                              key: UniqueKey(),
                              todo: t,
                              onUndo: () {
                                BlocProvider.of<TodosBloc>(context).add(
                                  TodoUpdated(t.copyWith(isDeleted: false)),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final VoidCallback onComplete;
  final Function(DismissDirection) onDelete;

  const TodoWidget({
    this.todo,
    this.onComplete,
    this.onDelete,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      direction: DismissDirection.startToEnd,
      onDismissed: onDelete,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                todo.completed ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: Colors.grey.shade500,
                size: 17.0,
              ),
              onPressed: onComplete,
            ),
            SizedBox(width: 5.0),
            Text(
              todo.title,
              style: TextStyle(
                decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none,
                fontWeight: FontWeight.w300,
                color: todo.completed ? Colors.grey.shade500 : Colors.grey.shade200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
