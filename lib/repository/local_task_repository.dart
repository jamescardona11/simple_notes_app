import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/dto/tasks_dto.dart';

import 'db_core/db_core.dart';

class LocalTaskRepository extends ILocalTaskRepository with CarbonSingleDataSourceMixin<ICarbonAdapter, TaskDto> {
  LocalTaskRepository(this.adapterDb);

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
  Stream<List<Task>> readAllTask([List<CarbonQuery> queries = const []]) => readWhere(carbonQueries: queries).map(
        (dtoList) => dtoList.map((dto) => dto.toEntity()).toList(),
      );

  @override
  TaskDto fromJson(Map<String, dynamic> json) => TaskDto.fromJson(json);

  @override
  Future<void> bulkCreationTaskInDB(List<Task> tasks) async {
    // for (var t in tasks) {
    //   create(TaskDto.fromEntity(t));
    // }
    await createMany(tasks.map((e) => TaskDto.fromEntity(e)));
  }

  @override
  Future<void> clearDB() => dropTable();
}
