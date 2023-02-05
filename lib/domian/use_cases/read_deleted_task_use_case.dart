import 'package:rxdart/subjects.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/db_core/db_adapter/query_filter.dart';

class ReadDeletedTaskUseCase {
  final ILocalTaskRepository repository;

  final BehaviorSubject<List<Task>> _streamForTask = BehaviorSubject<List<Task>>.seeded([]);

  ReadDeletedTaskUseCase(this.repository) {
    _listenStreams();
  }

  void _listenStreams() {
    repository.readAllTask([
      FilteringCarbonQuery(
        comparator: FilteringType.equalTo,
        property: 'isDeleted',
        value: true,
      )
    ]).listen((tasks) {
      _streamForTask.add(tasks);
    });
  }

  Stream<List<Task>> call() => _streamForTask;
}
