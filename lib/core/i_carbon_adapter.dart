import 'adapter_dao.dart';
import 'query_filter.dart';

/// adapter to convert methods from outside package to inside package
/// Represents the `Adapter` in Adapter Pattern diagram
/// https://refactoring.guru/es/design-patterns/adapter
///
///

abstract class ICarbonAdapter<ID> {
  Future<void> create({
    required String table,
    required AdapterDAO dao,
  });

  Future<void> createMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  });

  Stream<AdapterDAO?> read({
    required String table,
    required ID id,
  });

  Stream<Iterable<AdapterDAO>> readWhere({
    required String table,
    Iterable<CarbonQuery> carbonQueries = const [],
  });

  Future<void> update({
    required String table,
    required AdapterDAO dao,
  });

  Future<void> updateMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  });

  Future<void> delete({
    required String table,
    required ID id,
  });
}
