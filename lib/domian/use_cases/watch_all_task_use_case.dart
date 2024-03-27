import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:simple_notes_app/domian/domian.dart';

class WatchAllTaskUseCase {
  final ILocalTaskRepository repository;

  WatchAllTaskUseCase(this.repository) {
    _listenStreams();
  }

  final BehaviorSubject<List<Task>> _streamForTask = BehaviorSubject<List<Task>>.seeded([]);
  StreamSubscription<List<Task>>? _streamTasksSubscription;

  void _listenStreams() {
    _streamTasksSubscription = repository.watch().listen((tasks) {
      _streamForTask.add(tasks);
    });
  }

  Stream<List<Task>> call() => _streamForTask;

  void dispose() {
    _streamForTask.close();
    _streamTasksSubscription?.cancel();
  }
}
