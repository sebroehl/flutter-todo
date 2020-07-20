import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/tabs/tabs_bloc.dart';
import 'package:todo/bloc/tabs/tabs_event.dart';
import 'package:todo/constants.dart';
import 'package:todo/models/app_tab.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/gradient.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Material(
        elevation: 2,
        // color: kLightGray,
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 70.0),
              NavigationBarItem(
                index: 0,
                text: 'Tasks',
                icon: Icons.radio_button_checked,
                appTab: AppTab.tasks,
              ),
              NavigationBarItem(
                index: 1,
                text: 'Today',
                icon: Icons.star,
                appTab: AppTab.today,
              ),
              NavigationBarItem(
                index: 2,
                text: 'Upcoming',
                icon: Icons.calendar_today,
                appTab: AppTab.upcoming,
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
              NavigationBarItem(
                index: 3,
                text: 'Activity',
                icon: Icons.timeline,
                appTab: AppTab.activity,
              ),
              NavigationBarItem(
                index: 4,
                text: 'Trash',
                icon: Icons.delete,
                appTab: AppTab.trash,
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
              NavigationBarItem(
                index: 5,
                text: 'New List',
                icon: Icons.add,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final int index;
  final String text;
  final IconData icon;
  final AppTab appTab;

  NavigationBarItem({
    @required this.index,
    @required this.text,
    @required this.icon,
    this.appTab,
  });

  @override
  Widget build(BuildContext context) {
    final _state = BlocProvider.of<TabsBloc>(context).state;
    return InkWell(
      onTap: () {
        BlocProvider.of<TabsBloc>(context).add(TabsUpdated(appTab));
      },
      child: Container(
        decoration: BoxDecoration(
          color: _state == appTab ? kSelectedGray : Colors.transparent,
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
