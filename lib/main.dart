import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/tabs/tabs_bloc.dart';
import 'package:todo/bloc/todos/todos_bloc.dart';
import 'package:todo/bloc/todos/todos_event.dart';
import 'package:todo/container.dart';
import 'package:todo/main_screen.dart';

void main() {
  configureService();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) {
            return TodosBloc()..add(TodosLoad());
          },
        ),
        BlocProvider<TabsBloc>(
          create: (context) {
            return TabsBloc();
          },
        ),
      ],
      child: TodosApp(),
    ),
  );
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
