import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: NavigationBar(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: kDarkGray,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 50.0),
            NavigationBarItem(text: 'Tasks', icon: Icons.radio_button_checked, selected: false),
            NavigationBarItem(text: 'Today', icon: Icons.star, selected: false),
            NavigationBarItem(text: 'Upcoming', icon: Icons.calendar_today, selected: false),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 0.3,
                color: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 20.0),
            NavigationBarItem(text: 'Activity', icon: Icons.timeline, selected: false),
            NavigationBarItem(text: 'Trash', icon: Icons.delete, selected: false),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 0.3,
                color: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 20.0),
            NavigationBarItem(text: 'New List', icon: Icons.add, selected: false),
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;

  NavigationBarItem({@required this.text, @required this.icon, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: selected ? kSelectedGray : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.grey.shade100,
              size: 18.0,
            ),
            SizedBox(width: 10.0),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade100,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
