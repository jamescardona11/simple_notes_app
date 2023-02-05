import 'package:rxdart/subjects.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/dto/tasks_dto.dart';

import 'db_core/db_core.dart';

class LocalTaskRepository extends ILocalTaskRepository with CarbonSingleDataSourceMixin<ICarbonAdapter, TaskDto> {
  LocalTaskRepository(this.adapterDb);

  @override
  final ICarbonAdapter adapterDb;

  final BehaviorSubject<List<Task>> _streamForTask = BehaviorSubject<List<Task>>.seeded([]);

  @override
  String get tableName => 'task_table';

  @override
  Future<void> saveTaskInDB(Task task) async {}

  @override
  Future<void> updateTaskInDB(Task task) async {}

  @override
  Future<void> deleteTaskInDB(String id) async {}

  @override
  Future<void> removeTaskFromDB(String id) async {}

  @override
  Stream<List<Task>> readTask() => _streamForTask;

  @override
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

  @override
  TaskDto fromJson(Map<String, dynamic> json) => TaskDto.fromJson(json);
}
