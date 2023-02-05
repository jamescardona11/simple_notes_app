import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/domian/use_cases/bulk_creation_task_use_case.dart';

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

  @singleton
  ReadDeletedTaskUseCase get readDeletedTaskUseCase;

  @singleton
  ReadLastCompletedTaskUseCase get readLastCompletedTaskUseCase;

  @singleton
  BulkCreationTaskUseCase get bulkCreationTaskUseCase;

  // - use cases
}
