import 'db_core.dart';

mixin CarbonSingleDataSourceMixin<A extends ICarbonAdapter, T extends BaseCarbonDTO> implements ICarbonDataSource<T> {
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
  Future<void> createMany(Iterable<T> dtos) => adapterDb.createMany(
        table: tableName,
        daoList: dtos.map((dao) => AdapterDAO(
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
  Future<void> updateMany(Iterable<T> dtos) => adapterDb.updateMany(
        table: tableName,
        daoList: dtos.map((dao) => AdapterDAO(
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
  Stream<List<T>> readWhere({
    List<CarbonQuery> carbonQueries = const [],
  }) {
    return adapterDb
        .readWhere(
          table: tableName,
          carbonQueries: carbonQueries,
        )
        .map(
          (event) => event.map((dto) => fromJson(dto.data)).toList(),
        );
  }

  @override
  Future<void> dropTable() async {
    await adapterDb.dropTable(table: tableName);
  }
}
