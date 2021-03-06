import 'package:equatable/equatable.dart';
import 'package:todo/database/database.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoad extends TodosEvent {
  final List<Todo> todos;

  const TodosLoad([this.todos]);
}

class TodoAdded extends TodosEvent {
  final TodosCompanion todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoUpdated extends TodosEvent {
  final Todo todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];
}
