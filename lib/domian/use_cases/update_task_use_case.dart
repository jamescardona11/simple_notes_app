import 'package:simple_notes_app/domian/domian.dart';

class UpdateTaskUseCase {
  final ILocalTaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<void> call(Task task) async {}
}
