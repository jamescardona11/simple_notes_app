import 'i_carbon_dto.dart';
import 'query_filter.dart';

/// adapter to convert inner class request to external request
/// Represents the `client interface` in Adapter Pattern diagram
/// https://refactoring.guru/es/design-patterns/adapter

// typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class ICarbonDataSource<T extends BaseCarbonDTO> {
  String get tableName;

  Future<void> create(T dto);

  Future<void> createMany(List<T> dtos);

  Stream<T?> read(String id);

  Stream<List<T>> readWhere({
    List<CarbonQuery> carbonQueries = const [],
  });

  Future<void> update(T dto);

  Future<void> updateMany(List<T> dtos);

  Future<void> delete(String id);

  Future<void> dropTable();

  T fromJson(Map<String, dynamic> json);
}
