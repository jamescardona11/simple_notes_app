import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/repository/db_core/db_core.dart';

@module
abstract class CoreModule {
  @preResolve
  @singleton
  Future<ICarbonAdapter> get dbApp async {
    return await IsarAdapterImp.initAdapter(name: 'simple_notes.db');
  }
}
