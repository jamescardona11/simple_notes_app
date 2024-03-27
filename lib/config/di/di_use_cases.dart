import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/domian/domian.dart';

@module
abstract class UseCasesModule {
  // Task use cases
  @Singleton(dispose: disposeProvider)
  WatchAllTaskUseCase get watchAllTask;

  @singleton
  WatchStatsUseCase get watchStats;

  @singleton
  CreateTaskUseCase get createTask;

  @singleton
  UpdateTaskUseCase get updateTask;

  @singleton
  RemoveTaskUseCase get removeTask;

  @singleton
  WatchDeletedTaskUseCase get watchDeletedTaskUseCase;

  @singleton
  ReadLastCompletedTaskUseCase get readLastCompletedTaskUseCase;

  @singleton
  BulkCreationTaskUseCase get bulkCreationTaskUseCase;

  @singleton
  ClearTaskDbUseCase get clearTaskDbUseCase;
}

FutureOr<void> disposeProvider(WatchAllTaskUseCase provider) {
  provider.dispose();
}
