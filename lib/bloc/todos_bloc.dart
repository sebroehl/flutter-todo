import 'package:bloc/bloc.dart';
import 'package:todo/bloc/todos_event.dart';
import 'package:todo/bloc/todos_state.dart';
import 'package:todo/container.dart';
import 'package:todo/database/database.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final Database db = container<Database>();

  TodosBloc() : super(TodosLoadInProgress()) {
    db.watchTodos.listen((data) {
      add(TodosLoad(data));
    });
  }

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoad) {
      yield* _mapTodosLoadToState(event);
    } else if (event is TodoAdded) {
      yield* _mapTodoAddedToState(event);
    } else if (event is TodoUpdated) {
      yield* _mapTodoUpdatedToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadToState(TodosLoad event) async* {
    try {
      var todos = <Todo>[];
      if (event.todos == null) {
        todos = await db.allTodos;
      } else {
        todos = event.todos;
      }
      yield TodosLoadSuccess(
        todos,
      );
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

  Stream<TodosState> _mapTodoAddedToState(TodoAdded event) async* {
    if (state is TodosLoadSuccess) {
      await db.addTodo(event.todo);
      yield TodosLoadSuccess();
    }
  }

  Stream<TodosState> _mapTodoUpdatedToState(TodoUpdated event) async* {
    if (state is TodosLoadSuccess) {
      await db.updateTodo(event.todo);
      yield TodosLoadSuccess();
    }
  }
}
