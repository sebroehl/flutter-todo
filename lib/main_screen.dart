import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/tabs/tasks_tab.dart';
import 'package:todo/widgets/custom_app_bar.dart';
import 'package:todo/widgets/navigation_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Map<int, Widget> contentItems = {
    0: TasksTab(),
    1: Text('Today'),
    2: Text('Upcoming'),
    3: Text('Activity'),
    4: Text('Trash'),
  };

  setSelected(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: NavigationBar(setSelectedOfParent: setSelected),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: kDarkGray,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    child: contentItems[_selectedIndex],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
