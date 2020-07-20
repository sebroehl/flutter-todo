import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants.dart';
import 'package:todo/models/app_tab.dart';
import 'package:todo/tabs/tasks_tab.dart';
import 'package:todo/widgets/custom_app_bar.dart';
import 'package:todo/widgets/navigation_bar.dart';

import 'bloc/tabs/tabs_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Map<AppTab, Widget> contentItems = {
    AppTab.tasks: TasksTab(),
    AppTab.today: Text('Today'),
    AppTab.upcoming: Text('Upcoming'),
    AppTab.activity: Text('Activity'),
    AppTab.trash: Text('Trash'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabsBloc, AppTab>(
        builder: (context, tab) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: NavigationBar(),
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
                        child: contentItems[tab],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
