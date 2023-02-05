import 'package:simple_notes_app/domian/domian.dart';

class ClearTaskDbUseCase {
  final ILocalTaskRepository repository;

  ClearTaskDbUseCase(this.repository);

  Future<void> call() => repository.clearDB();
}
