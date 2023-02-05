import 'package:simple_notes_app/old/data_layer/core_db/i_carbon_id_model.dart';

import 'query_filter.dart';

/// adapter to convert inner class request to external request
/// Represents the `client interface` in Adapter Pattern diagram
/// https://refactoring.guru/es/design-patterns/adapter

typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class ICarbonDataSource<T extends BaseCarbonIdModel> {
  String get tableName;

  Future<void> create(T dto);

  Future<void> createMany(Iterable<T> dto);

  Stream<T?> read(String id);

  Stream<Iterable<T>> readWhere({
    Iterable<CarbonQuery> carbonQueries = const [],
  });

  Future<void> update(T dto);

  Future<void> updateMany(Iterable<T> dto);

  Future<void> delete(String id);

  T fromJson(Map<String, dynamic> json);
}
