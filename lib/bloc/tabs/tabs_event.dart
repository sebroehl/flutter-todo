import 'package:equatable/equatable.dart';
import 'package:todo/models/app_tab.dart';

abstract class TabsEvent extends Equatable {
  const TabsEvent();
}

class TabsUpdated extends TabsEvent {
  final AppTab tab;

  const TabsUpdated(this.tab);

  @override
  List<Object> get props => [tab];
}
