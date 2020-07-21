import 'package:flutter/material.dart';
import 'package:todo/database/database.dart';

class DeleteTodoSnackbar extends SnackBar {
  DeleteTodoSnackbar({
    Key key,
    @required Todo todo,
    @required VoidCallback onUndo,
  }) : super(
          key: key,
          content: Text('The todo "${todo.title}" was deleted.'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: onUndo,
            textColor: Colors.amberAccent,
          ),
        );
}
