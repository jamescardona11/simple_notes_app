import 'package:db_adapter_flutter/core/db_core.dart';

import 'i_carbon_id_model.dart';

mixin CarbonSingleDataSourceMixin<A extends ICarbonAdapter, T extends BaseCarbonIdModel> implements ICarbonDataSource<T> {
  A get adapterDb;

  @override
  Future<void> create(T dto) => adapterDb.create(
        table: tableName,
        dao: AdapterDAO(
          id: dto.dbID,
          data: dto.toJson(),
        ),
      );

  @override
  Future<void> createMany(Iterable<T> dto) => adapterDb.createMany(
        table: tableName,
        daoList: dto.map((dao) => AdapterDAO(
              id: dao.dbID,
              data: dao.toJson(),
            )),
      );

  @override
  Future<void> update(T data) => adapterDb.update(
        table: tableName,
        dao: AdapterDAO(
          id: data.dbID,
          data: data.toJson(),
        ),
      );

  @override
  Future<void> updateMany(Iterable<T> dto) => adapterDb.updateMany(
        table: tableName,
        daoList: dto.map((dao) => AdapterDAO(
              id: dao.dbID,
              data: dao.toJson(),
            )),
      );

  @override
  Future<void> delete(String id) => adapterDb.delete(
        table: tableName,
        id: id,
      );

  @override
  Stream<T?> read(String id) => adapterDb.read(table: tableName, id: id).map((dto) {
        if (dto != null) {
          try {
            return fromJson(dto.data);
          } catch (e) {
            return null;
          }
        }
        return null;
      });

  @override
  Stream<Iterable<T>> readWhere({
    Iterable<CarbonQuery> carbonQueries = const [],
  }) {
    return adapterDb.readWhere(table: tableName, carbonQueries: carbonQueries).map((event) => event.map((dto) => fromJson(dto.data)));
  }
}
