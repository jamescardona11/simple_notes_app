import 'package:simple_notes_app/domian/domian.dart';

class ReadStatsUseCase {
  final ILocalTaskRepository repository;
  final ReadAllTaskUseCase readAllTask;

  ReadStatsUseCase(
    this.repository,
    this.readAllTask,
  );

  Stream<StatsModel> call() => readAllTask.call().map((tasks) {
        int completed = 0;

        for (var task in tasks) {
          completed += task.isDone ? 1 : 0;
        }

        return StatsModel(
          completedTask: completed,
          pendingTask: tasks.length - completed,
        );
      });
}
