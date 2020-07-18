import 'package:bloc/bloc.dart';
import 'package:todo/bloc/todos_event.dart';
import 'package:todo/bloc/todos_state.dart';
import 'package:todo/database/database.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoadInProgress());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoad) {
      yield* _mapTodosLoadToState();
    } else if (event is TodoAdded) {
      yield* _mapTodoAddedToState(event);
    } else if (event is TodoUpdated) {
      yield* _mapTodoUpdatedToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadToState() async* {
    try {
      // TODO
      final todos = <Todo>[];
      yield TodosLoadSuccess(
        todos,
      );
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

  Stream<TodosState> _mapTodoAddedToState(TodoAdded event) async* {
    if (state is TodosLoadSuccess) {
      final List<Todo> updatedTodos = List.from((state as TodosLoadSuccess).todos)..add(event.todo);
      yield TodosLoadSuccess(updatedTodos);
    }
  }

  Stream<TodosState> _mapTodoUpdatedToState(TodoUpdated event) async* {
    if (state is TodosLoadSuccess) {
      final List<Todo> updatedTodos = (state as TodosLoadSuccess).todos.map((todo) {
        return todo.title == event.todo.title ? event.todo : todo;
      }).toList();
      yield TodosLoadSuccess(updatedTodos);
    }
  }
}
