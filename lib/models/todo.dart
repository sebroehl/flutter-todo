import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String task;
  final bool complete;

  Todo(this.task, this.complete);

  @override
  List<Object> get props => [task, complete];
}
