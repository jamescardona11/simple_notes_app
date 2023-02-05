import 'package:rxdart/subjects.dart';
import 'package:simple_notes_app/models/stats_model.dart';
import 'package:simple_notes_app/models/tasks_model.dart';

class LocalTaskRepository {
  final BehaviorSubject<List<Task>> _streamForTask = BehaviorSubject<List<Task>>.seeded([]);

  LocalTaskRepository() {}

  Future<void> saveTaskInDB(Task task) async {}

  Future<void> updateTaskInDB(Task task) async {}

  // change state to deleted
  Future<void> deleteTaskInDB(String id) async {}

  Future<void> removeTaskFromDB(String id) async {}

  Stream<List<Task>> readTask() => _streamForTask;

  Stream<StatsModel> readStats() => _streamForTask.map((tasks) {
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
