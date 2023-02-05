import 'package:simple_notes_app/domian/domian.dart';

class CreateTaskUseCase {
  final ILocalTaskRepository repository;

  CreateTaskUseCase(this.repository);

  Future<void> call(Task task) => repository.saveTaskInDB(task);
}
