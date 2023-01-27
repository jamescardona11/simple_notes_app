import 'package:db_adapter_flutter/core/sembast/sembast_adapter_imp.dart';
import 'package:db_adapter_flutter/data_layer/core_db/mixin_single_data_source.dart';

import '../dto/collaborator_dto.dart';

class CollectionLocalRepositoryExampleIsar with CarbonSingleDataSourceMixin<SembastAdapterImp, CollaboratorDTO> {
  /// default constructor
  const CollectionLocalRepositoryExampleIsar(this.adapterDb);

  @override
  final SembastAdapterImp adapterDb;

  @override
  String get tableName => 'collaborator';

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
