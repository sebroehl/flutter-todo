import 'package:get_it/get_it.dart';
import 'package:todo/database/database.dart';

GetIt container = GetIt.instance;

configureService() {
  container.registerSingleton<Database>(Database());
}
