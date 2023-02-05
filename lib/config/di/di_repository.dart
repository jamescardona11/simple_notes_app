import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/repository.dart';

@module
abstract class ModelModule {
  @LazySingleton(as: ILocalTaskRepository)
  LocalTaskRepository get taskRepository;
}
