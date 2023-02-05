import 'package:simple_notes_app/domian/models/stats_model.dart';
import 'package:simple_notes_app/domian/models/tasks_model.dart';

abstract class ILocalTaskRepository {
  Future<void> saveTaskInDB(Task task);

  Future<void> updateTaskInDB(Task task);

  /// change state to deleted
  Future<void> deleteTaskInDB(String id);

  Future<void> removeTaskFromDB(String id);

  Stream<List<Task>> readTask();

  Stream<StatsModel> readStats();
}
