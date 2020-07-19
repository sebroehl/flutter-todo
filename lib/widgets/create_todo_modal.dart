import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor/moor.dart';
import 'package:todo/bloc/todos_bloc.dart';
import 'package:todo/bloc/todos_event.dart';
import 'package:todo/constants.dart';
import 'package:todo/database/database.dart';

class CreateTodoModal extends StatefulWidget {
  @override
  _CreateTodoModalState createState() => _CreateTodoModalState();
}

class _CreateTodoModalState extends State<CreateTodoModal> {
  String title = '';

  createTodo() {
    BlocProvider.of<TodosBloc>(context).add(
      TodoAdded(
        TodosCompanion(title: Value(title), completed: Value(false)),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (text) => setState(() => title = text),
                style: TextStyle(color: Colors.white),
                autofocus: true,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Add a new todo',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: IconButton(
                iconSize: 18.0,
                icon: Icon(Icons.send),
                color: Colors.white,
                disabledColor: Colors.grey,
                onPressed: title.length > 0 ? createTodo : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
