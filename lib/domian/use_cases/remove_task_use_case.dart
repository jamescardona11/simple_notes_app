import 'package:simple_notes_app/domian/repository/i_local_task_repository.dart';

class RemoveTaskUseCase {
  final ILocalTaskRepository repository;

  RemoveTaskUseCase(this.repository);

  Future<void> call(String id) => repository.removeTaskFromDB(id);
}
