import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todos_bloc.dart';
import 'package:todo/bloc/todos_event.dart';
import 'package:todo/bloc/todos_state.dart';
import 'package:todo/models/todo.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        } else {
          final todos = (state as TodosLoadSuccess).todos;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              ...todos.map((t) => TodoWidget(t.task, t.complete))
            ],
          );
        }
      },
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool completed;

  const TodoWidget(this.text, this.completed, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                completed ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: Colors.grey.shade500,
                size: 17.0,
              ),
              onPressed: () {
                BlocProvider.of<TodosBloc>(context).add(
                  TodoUpdated(
                    Todo(text, !completed),
                  ),
                );
              },
            ),
            SizedBox(width: 5.0),
            Text(
              text,
              style: TextStyle(
                decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                fontWeight: FontWeight.w300,
                color: completed ? Colors.grey.shade500 : Colors.grey.shade200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
