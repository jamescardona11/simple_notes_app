import 'adapter_dao.dart';
import 'query_filter.dart';

/// adapter to convert methods from outside package to inside package
/// Represents the `Adapter` in Adapter Pattern diagram
/// https://refactoring.guru/es/design-patterns/adapter
///
///

abstract class ICarbonAdapter {
  Future<void> create({
    required String table,
    required AdapterDAO dao,
  });

  Future<void> createMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  });

  Stream<AdapterDAO?> watchOne({
    required String table,
    required String id,
  });

  Stream<Iterable<AdapterDAO>> watch({
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
    required String id,
  });

  Future<void> dropTable({
    required String table,
  });
}
