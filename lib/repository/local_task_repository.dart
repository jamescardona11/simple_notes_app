import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/dto/tasks_dto.dart';

import 'db_core/db_core.dart';

class LocalTaskRepository extends ILocalTaskRepository with CarbonSingleDataSourceMixin<ICarbonAdapter, TaskDto> {
  LocalTaskRepository(this.adapterDb) {
    _init();
  }

  final _taskController = BehaviorSubject<List<Task>>.seeded([]);
  StreamSubscription<List<Task>>? _streamTasksSubscription;

  void _init() {
    _streamTasksSubscription = watch().listen((tasks) {
      _taskController.add(tasks);
    });
  }

  @override
  final ICarbonAdapter adapterDb;

  @override
  String get tableName => 'task_table';

  @override
  Future<void> saveTaskInDB(Task task) => create(TaskDto.fromEntity(task));

  @override
  Future<void> updateTaskInDB(Task task) => update(TaskDto.fromEntity(task));

  @override
  Future<void> removeTaskFromDB(String id) => delete(id);

  @override
  Stream<List<Task>> watch([List<CarbonQuery> queries = const []]) => watchAll(carbonQueries: queries).map(
        (dtoList) => dtoList.map((dto) => dto.toEntity()).toList(),
      );

  @override
  TaskDto fromJson(Map<String, dynamic> json) => TaskDto.fromJson(json);

  @override
  Future<void> bulkCreationTaskInDB(List<Task> tasks) async {
    await createMany(tasks.map((e) => TaskDto.fromEntity(e)));
  }

  @override
  Future<void> clearDB() => dropTable();

  @override
  Future<void> dispose() async {
    _taskController.close();
    _streamTasksSubscription?.cancel();
  }
}
