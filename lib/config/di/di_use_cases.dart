import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/domian/domian.dart';

@module
abstract class UseCasesModule {
  // Task use cases
  @singleton
  ReadAllTaskUseCase get readAllTask;

  @singleton
  ReadStatsUseCase get readStats;

  @singleton
  CreateTaskUseCase get createTask;

  @singleton
  UpdateTaskUseCase get updateTask;

  @singleton
  RemoveTaskUseCase get removeTask;

  // - use cases
}