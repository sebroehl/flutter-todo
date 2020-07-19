import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo/constants.dart';
import 'package:todo/widgets/create_todo_modal.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: kLightGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Todo',
              style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
            IconButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  context: context,
                  expand: false,
                  builder: (context, scrollController) => CreateTodoModal(),
                );
              },
              color: Colors.white,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
