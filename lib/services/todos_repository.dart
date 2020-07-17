import 'package:todo/models/todo.dart';

class TodosRepository {
  final todos = [
    Todo('Here´s to the crazy ones', false),
    Todo('the misfits, the rebels, the troublemakers', true),
    Todo('The round peg in the square holes', false),
    Todo('they put the human race forward', false),
    Todo('You can´t disqualify them or ignore them, it is just how it is', false),
    Todo('we see genius', true),
    Todo('Another day of sun', false),
    Todo('Ignore them', false),
    Todo('The last but not the least', true),
  ];

  List<Todo> getTodos() {
    return todos;
  }

  Future<void> saveTodos(List<Todo> todos) async {}
}
