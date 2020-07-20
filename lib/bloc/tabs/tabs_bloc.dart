import 'package:bloc/bloc.dart';
import 'package:todo/bloc/tabs/tabs_event.dart';
import 'package:todo/models/app_tab.dart';

class TabsBloc extends Bloc<TabsEvent, AppTab> {
  TabsBloc() : super(AppTab.tasks);
  @override
  Stream<AppTab> mapEventToState(TabsEvent event) async* {
    if (event is TabsUpdated) {
      yield event.tab;
    }
  }
}
