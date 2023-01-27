import 'package:db_adapter_flutter/core/isar/isar_adapter_imp.dart';
import 'package:db_adapter_flutter/data_layer/core_db/mixin_single_data_source.dart';

import '../dto/collaborator_dto.dart';

class CollectionLocalRepositoryExampleIsar with CarbonSingleDataSourceMixin<IsarAdapterImp, CollaboratorDTO> {
  /// default constructor
  const CollectionLocalRepositoryExampleIsar(this.adapterDb);

  @override
  final IsarAdapterImp adapterDb;

  @override
  String get tableName => 'collaborator';

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
