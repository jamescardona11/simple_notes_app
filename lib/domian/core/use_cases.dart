import 'package:rxdart/rxdart.dart';
import 'package:simple_notes_app/config/di/di.dart';
import 'package:simple_notes_app/domian/domian.dart';

abstract class UseCaseParam {
  const UseCaseParam();
}

abstract class BaseUseCase<UCC extends UseCaseParam, R extends dynamic> {
  R call([UCC param]);

  void dispose();
}

abstract class CommandUseCase<UCC extends UseCaseParam, R extends dynamic> implements BaseUseCase<UCC, Future<R>> {
  @override
  void dispose() {}
}

abstract class QueryUseCase<UCC extends UseCaseParam, R extends dynamic> extends BaseUseCase<UCC, R> {
  @override
  void dispose() {}
}

class NoParam extends UseCaseParam {}

// Examples:

class ClearTaskDbUseCaseParam extends UseCaseParam {}

class ExampleClearTaskDbUseCase implements CommandUseCase<ClearTaskDbUseCaseParam, void> {
  final ILocalTaskRepository repository;

  ExampleClearTaskDbUseCase(this.repository);

  @override
  Future<void> call([ClearTaskDbUseCaseParam? param]) => repository.clearDB();

  @override
  void dispose() {}
}

class ReadAllTaskUseCaseParam extends UseCaseParam {}

class ReadAllTaskUseCase extends QueryUseCase<ReadAllTaskUseCaseParam, Stream<List<Task>>> {
  final ILocalTaskRepository repository;
  final BehaviorSubject<List<Task>> _streamForTask = BehaviorSubject<List<Task>>.seeded([]);

  ReadAllTaskUseCase(this.repository) {
    _listenStreams();
  }

  void _listenStreams() {
    repository.watch().listen((tasks) {
      _streamForTask.add(tasks);
    });
  }

  @override
  Stream<List<Task>> call([ReadAllTaskUseCaseParam? param]) => _streamForTask;
}

void main() {
  final clearTaskDbUseCase = getIt<CommandUseCase<ClearTaskDbUseCaseParam, void>>();

  clearTaskDbUseCase.call();
}
