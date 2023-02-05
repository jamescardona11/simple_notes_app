import 'package:simple_notes_app/domian/domian.dart';

class ReadStatsUseCase {
  final ILocalTaskRepository repository;
  final ReadAllTaskUseCase readAllTask;

  ReadStatsUseCase(
    this.repository,
    this.readAllTask,
  );

  Stream<StatsModel> call() async* {}
}
