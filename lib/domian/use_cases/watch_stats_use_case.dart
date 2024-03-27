import 'package:simple_notes_app/domian/domian.dart';

class WatchStatsUseCase {
  final ILocalTaskRepository repository;
  final WatchAllTaskUseCase readAllTask;

  WatchStatsUseCase(
    this.repository,
    this.readAllTask,
  );

  Stream<StatsModel> call() => readAllTask.call().map((tasks) {
        int completed = 0;
        int pending = 0;

        for (var task in tasks) {
          if (task.isDeleted) continue;
          completed += task.isDone ? 1 : 0;
          pending += !task.isDone ? 1 : 0;
        }

        return StatsModel(
          completedTask: completed,
          pendingTask: pending,
        );
      });
}
