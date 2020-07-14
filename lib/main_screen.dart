import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/widgets/navigation_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Map<int, Widget> contentItems = {
    0: Text('Tasks'),
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
                children: [CustomAppBar(), contentItems[_selectedIndex]],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: kLightGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Todo',
            style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
