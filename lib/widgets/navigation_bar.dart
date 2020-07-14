import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class NavigationBar extends StatefulWidget {
  final Function setSelectedOfParent;

  const NavigationBar({Key key, this.setSelectedOfParent}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState(
        setSelectedOfParent: setSelectedOfParent,
      );
}

class _NavigationBarState extends State<NavigationBar> {
  final Function setSelectedOfParent;
  int _selectedIndex = 0;

  _NavigationBarState({@required this.setSelectedOfParent});

  isSelected(int index) => index == _selectedIndex;

  setSelected(int index) {
    setState(() => _selectedIndex = index);
    setSelectedOfParent(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 50.0),
            NavigationBarItem(
              index: 0,
              text: 'Tasks',
              icon: Icons.radio_button_checked,
              selected: isSelected(0),
              setSelected: setSelected,
            ),
            NavigationBarItem(
              index: 1,
              text: 'Today',
              icon: Icons.star,
              selected: isSelected(1),
              setSelected: setSelected,
            ),
            NavigationBarItem(
                index: 2,
                text: 'Upcoming',
                icon: Icons.calendar_today,
                selected: isSelected(2),
                setSelected: setSelected),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 0.3,
                color: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 20.0),
            NavigationBarItem(
              index: 3,
              text: 'Activity',
              icon: Icons.timeline,
              selected: isSelected(3),
              setSelected: setSelected,
            ),
            NavigationBarItem(
              index: 4,
              text: 'Trash',
              icon: Icons.delete,
              selected: isSelected(4),
              setSelected: setSelected,
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 0.3,
                color: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 20.0),
            NavigationBarItem(index: 5, text: 'New List', icon: Icons.add, selected: isSelected(5)),
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final int index;
  final String text;
  final IconData icon;
  final bool selected;
  final Function setSelected;

  NavigationBarItem({
    @required this.index,
    @required this.text,
    @required this.icon,
    @required this.selected,
    this.setSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setSelected(index),
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
