import 'package:simple_notes_app/domian/models/tasks_model.dart';
import 'package:simple_notes_app/repository/db_core/db_adapter/query_filter.dart';

abstract class ILocalTaskRepository {
  Future<void> saveTaskInDB(Task task);

  Future<void> bulkCreationTaskInDB(List<Task> tasks);

  Future<void> updateTaskInDB(Task task);

  Future<void> removeTaskFromDB(String id);

  Stream<List<Task>> watch([List<CarbonQuery> queries = const []]);

  Future<void> clearDB();

  Future<void> dispose();
}
