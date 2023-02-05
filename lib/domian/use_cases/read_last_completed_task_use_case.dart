import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/db_core/db_core.dart';

class ReadLastCompletedTaskUseCase {
  final ILocalTaskRepository repository;

  ReadLastCompletedTaskUseCase(this.repository);

  Future<List<Task>> call([int take = 10]) async {
    final items = await repository.readAllTask([
      LimitCarbonQuery(take),
      FilteringCarbonQuery(
        comparator: FilteringType.equalTo,
        property: 'isDone',
        value: true,
      )
    ]).first;

    return items;
  }
}
