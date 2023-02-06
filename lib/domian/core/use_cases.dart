import 'package:rxdart/rxdart.dart';
import 'package:simple_notes_app/domian/domian.dart';

abstract class UseCaseParam {
  const UseCaseParam();
}

abstract class BaseUseCase<UCC extends UseCaseParam, R extends dynamic> {
  R call(UCC param);
}

abstract class CommandUseCase<UCC extends UseCaseParam, R extends dynamic> implements BaseUseCase<UCC, Future<R>> {}

abstract class QueryUseCase<UCC extends UseCaseParam, R extends dynamic> extends BaseUseCase<UCC, R> {}

// Examples:

class ClearTaskDbUseCaseParam extends UseCaseParam {}

class ExampleClearTaskDbUseCase extends CommandUseCase<ClearTaskDbUseCaseParam, void> {
  final ILocalTaskRepository repository;

  ExampleClearTaskDbUseCase(this.repository);

  @override
  Future<void> call(ClearTaskDbUseCaseParam param) => repository.clearDB();
}

class ReadAllTaskUseCaseParam extends UseCaseParam {}

class ReadAllTaskUseCase extends QueryUseCase<ReadAllTaskUseCaseParam, Stream<List<Task>>> {
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

  @override
  Stream<List<Task>> call(ReadAllTaskUseCaseParam param) => _streamForTask;
}
