import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/domian/domian.dart';
import 'package:simple_notes_app/repository/db_core/db_core.dart';
import 'package:simple_notes_app/repository/db_core/isar_dto/isar_task_dto.dart';
import 'package:simple_notes_app/repository/repository.dart';

@module
abstract class RepositoryModule {
  @Named('Isar')
  @preResolve
  @singleton
  Future<ICarbonAdapter> get isarDBApp async {
    return await IsarAdapterImp.initAdapter(
      name: 'simple_notes.db',
      schemas: [
        IsarTaskDTOSchema,
      ],
    );
  }

  @Named('Sembast')
  @preResolve
  @singleton
  Future<ICarbonAdapter> get sembastDBApp async {
    return await SembastAdapterImp.initAdapter(
      name: 'simple_notes.db',
    );
  }

  @LazySingleton(as: ILocalTaskRepository)
  LocalTaskRepository taskRepository(@Named('Isar') ICarbonAdapter adapterDb) => LocalTaskRepository(adapterDb);
}
