import 'package:rxdart/subjects.dart';
import 'package:simple_notes_app/domian/domian.dart';

class ReadAllTaskUseCase {
  final ILocalTaskRepository repository;
  final BehaviorSubject<List<Task>> _streamForTask = BehaviorSubject<List<Task>>.seeded([]);

  ReadAllTaskUseCase(this.repository) {
    _listenStreams();
  }

  void _listenStreams() {
    repository.readAllTask().listen((tasks) {
      _streamForTask.add(tasks);
    });
  }

  Stream<List<Task>> call() => _streamForTask;
}
