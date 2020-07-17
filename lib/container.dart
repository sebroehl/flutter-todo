import 'package:get_it/get_it.dart';
import 'package:todo/services/todos_repository.dart';

GetIt container = GetIt.instance;

configureService() {
  container.registerSingleton<TodosRepository>(TodosRepository());
}
