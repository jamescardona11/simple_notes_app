// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:simple_notes_app/config/di/di_cubit.dart' as _i6;
import 'package:simple_notes_app/config/di/di_repository.dart' as _i8;
import 'package:simple_notes_app/config/di/di_use_cases.dart' as _i7;
import 'package:simple_notes_app/cubit/cubit_exports.dart' as _i5;
import 'package:simple_notes_app/domian/domian.dart' as _i4;
import 'package:simple_notes_app/repository/db_core/db_core.dart' as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final repositoryModule = _$RepositoryModule();
  final useCasesModule = _$UseCasesModule(getIt);
  final cubitModule = _$CubitModule(getIt);
  await gh.singletonAsync<_i3.ICarbonAdapter<dynamic>>(
    () => repositoryModule.isarDBApp,
    instanceName: 'Isar',
    preResolve: true,
  );
  await gh.singletonAsync<_i3.ICarbonAdapter<dynamic>>(
    () => repositoryModule.sembastDBApp,
    instanceName: 'Sembast',
    preResolve: true,
  );
  gh.lazySingleton<_i4.ILocalTaskRepository>(() =>
      repositoryModule.taskRepository(
          gh<_i3.ICarbonAdapter<dynamic>>(instanceName: 'Sembast')));
  gh.singleton<_i4.ReadAllTaskUseCase>(useCasesModule.readAllTask);
  gh.singleton<_i4.ReadDeletedTaskUseCase>(
      useCasesModule.readDeletedTaskUseCase);
  gh.singleton<_i4.ReadLastCompletedTaskUseCase>(
      useCasesModule.readLastCompletedTaskUseCase);
  gh.singleton<_i4.ReadStatsUseCase>(useCasesModule.readStats);
  gh.singleton<_i4.RemoveTaskUseCase>(useCasesModule.removeTask);
  gh.singleton<_i4.UpdateTaskUseCase>(useCasesModule.updateTask);
  gh.singleton<_i4.BulkCreationTaskUseCase>(
      useCasesModule.bulkCreationTaskUseCase);
  gh.singleton<_i4.ClearTaskDbUseCase>(useCasesModule.clearTaskDbUseCase);
  gh.singleton<_i4.CreateTaskUseCase>(useCasesModule.createTask);
  gh.factory<_i5.TasksCubit>(() => cubitModule.tasksCubit);
  return getIt;
}

class _$CubitModule extends _i6.CubitModule {
  _$CubitModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.TasksCubit get tasksCubit => _i5.TasksCubit(
        _getIt<_i4.CreateTaskUseCase>(),
        _getIt<_i4.UpdateTaskUseCase>(),
        _getIt<_i4.RemoveTaskUseCase>(),
        _getIt<_i4.ReadAllTaskUseCase>(),
        _getIt<_i4.ReadStatsUseCase>(),
        _getIt<_i4.ReadDeletedTaskUseCase>(),
        _getIt<_i4.ReadLastCompletedTaskUseCase>(),
        _getIt<_i4.BulkCreationTaskUseCase>(),
        _getIt<_i4.ClearTaskDbUseCase>(),
      );
}

class _$UseCasesModule extends _i7.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.ReadAllTaskUseCase get readAllTask =>
      _i4.ReadAllTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.ReadStatsUseCase get readStats => _i4.ReadStatsUseCase(
        _getIt<_i4.ILocalTaskRepository>(),
        _getIt<_i4.ReadAllTaskUseCase>(),
      );
  @override
  _i4.CreateTaskUseCase get createTask =>
      _i4.CreateTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.UpdateTaskUseCase get updateTask =>
      _i4.UpdateTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.RemoveTaskUseCase get removeTask =>
      _i4.RemoveTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.ReadDeletedTaskUseCase get readDeletedTaskUseCase =>
      _i4.ReadDeletedTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.ReadLastCompletedTaskUseCase get readLastCompletedTaskUseCase =>
      _i4.ReadLastCompletedTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.BulkCreationTaskUseCase get bulkCreationTaskUseCase =>
      _i4.BulkCreationTaskUseCase(_getIt<_i4.ILocalTaskRepository>());
  @override
  _i4.ClearTaskDbUseCase get clearTaskDbUseCase =>
      _i4.ClearTaskDbUseCase(_getIt<_i4.ILocalTaskRepository>());
}

class _$RepositoryModule extends _i8.RepositoryModule {}
