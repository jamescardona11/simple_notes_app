import 'package:simple_notes_app/domian/domian.dart';

class BulkCreationTaskUseCase {
  final ILocalTaskRepository repository;

  BulkCreationTaskUseCase(this.repository);

  Future<void> call(List<Task> task) => repository.bulkCreationTaskInDB(task);
}
