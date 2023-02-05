import 'package:simple_notes_app/domian/domian.dart';

class ReadAllTaskUseCase {
  final ILocalTaskRepository repository;

  ReadAllTaskUseCase(this.repository);

  Stream<List<Task>> call() async* {}
}
