import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_notes_app/repository/db_core/isar_dto/isar_task_dto.dart';

import '../db_core.dart';

class IsarAdapterImp implements ICarbonAdapter {
  IsarAdapterImp._(this._db);

  final Isar _db;

  static Completer<IsarAdapterImp>? _completer;

  static Future<IsarAdapterImp> initAdapter({
    String name = 'isar_default_name.db',
    required List<CollectionSchema<dynamic>> schemas,
  }) async {
    if (_completer == null) {
      final Completer<IsarAdapterImp> completer = Completer<IsarAdapterImp>();

      try {
        late Isar? dbInstance;
        var dir = await getApplicationDocumentsDirectory();
        if (Isar.instanceNames.isEmpty) {
          dbInstance = await Isar.open(
            name: name,
            schemas,
            inspector: true,
            directory: dir.path,
          );

          // completer.complete(IsarAdapterImp._(dbInstance));
        }

        dbInstance = Isar.getInstance(name);
        if (dbInstance == null) throw Exception('Random error init ISAR');

        completer.complete(IsarAdapterImp._(dbInstance));
      } on Exception catch (e) {
        // If there's an error, explicitly return the future with an error.
        // then set the completer to null so we can retry.
        completer.completeError(e);

        final Future<IsarAdapterImp> initFuture = completer.future;
        _completer == null;

        return initFuture;
      }

      _completer = completer;
    }

    return _completer!.future;
  }

  // how to improve this identifier for objects
  // can I do with the DTO
  final _isarObjects = {
    'task_table': IsarTaskDTO.fromJson,
    // 'other': IsarProjectDTO.fromJson,
  };

  IsarCollection? _getTableByString(String table) {
    if (table == 'task_table') {
      return _db.isarTaskDTOs;
    }

    throw Exception('The type is not supported');
  }

  @override
  Future<void> create({
    required String table,
    required AdapterDAO dao,
  }) async {
    // table
    final collection = _getTableByString(table);
    final isarObj = _isarObjects[table]?.call(dao.data);
    if (isarObj == null) return;

    return _db.writeTxn(
      () => collection!.put(isarObj),
    );
  }

  @override
  Future<void> createMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  }) async {
    if (daoList.isEmpty) return;

    final isarObj = daoList.map((dao) => _isarObjects[table]?.call(dao.data)).where((element) => element != null).map((e) => e!).toList();

    final collection = _getTableByString(table);
    return _db.writeTxn(() => collection!.putAll(isarObj));
  }

  @override
  Future<void> delete({
    required String table,
    required String id,
  }) async {
    final recordId = int.tryParse(id);
    if (recordId == null) return;

    final collection = _getTableByString(table);
    return _db.writeTxn(() => collection!.delete(recordId));
  }

  @override
  Stream<AdapterDAO?> watchOne({
    required String table,
    required String id,
  }) async* {
    final recordId = int.tryParse(id);
    if (recordId == null) return;

    final collection = _getTableByString(table);

    final element = await collection!.get(recordId);
    if (element == null) {
      yield null;
    } else {
      yield AdapterDAO(
        data: element,
      );
    }
  }

  // using buildQuery ref and resources:
  // https://github.com/isar/isar/blob/eb170c6244fa52667fc610b1db4464123f7b2663/packages/isar/lib/src/web/isar_collection_impl.dart
  // https://github.com/isar/isar/blob/eb170c6244fa52667fc610b1db4464123f7b2663/packages/isar/lib/src/web/query_build.dart
  @override
  Stream<Iterable<AdapterDAO>> watch({
    required String table,
    Iterable<CarbonQuery> carbonQueries = const [],
  }) async* {
    final collection = _getTableByString(table);

    FilterCondition? filter;
    int? limit;
    List<SortProperty> sort = [];
    for (CarbonQuery query in carbonQueries) {
      if (query is LimitCarbonQuery) {
        limit = query.limit;
      } else if (query is SortCarbonQuery) {
        sort.add(SortProperty(
          property: query.property,
          sort: query.ascending ? Sort.asc : Sort.desc,
        ));
      } else if (query is FilteringCarbonQuery) {
        // only take the last
        filter = _getFilterFromClause(query);
      }
    }

    final query = collection!
        .buildQuery(
          filter: filter,
          limit: limit,
          sortBy: sort,
        )
        .watch(fireImmediately: true)
        .map((event) => event.map(
              (element) => AdapterDAO(
                data: (element as BaseCarbonDTO).toJson(),
              ),
            ));

    yield* query;
  }

  @override
  Future<void> update({
    required String table,
    required AdapterDAO dao,
  }) =>
      create(table: table, dao: dao);

  @override
  Future<void> updateMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  }) =>
      createMany(table: table, daoList: daoList);

  @override
  Future<void> dropTable({required String table}) async {
    final collection = _getTableByString(table);

    return _db.writeTxn(() => collection!.clear());
  }

  FilterCondition _getFilterFromClause(FilteringCarbonQuery filtering) {
    switch (filtering.comparator) {
      case FilteringType.equalTo:
        return FilterCondition.equalTo(
          property: filtering.property,
          value: filtering.value,
        );

      case FilteringType.greaterThan:
        return FilterCondition.greaterThan(
          property: filtering.property,
          value: filtering.value,
        );

      case FilteringType.lessThan:
        return FilterCondition.lessThan(
          property: filtering.property,
          value: filtering.value,
        );

      case FilteringType.contains:
        return FilterCondition.contains(
          property: filtering.property,
          value: filtering.value,
        );

      case FilteringType.isNull:
        return FilterCondition.isNull(
          property: filtering.property,
        );

      case FilteringType.isNotNull:
        return FilterCondition.isNotNull(
          property: filtering.property,
        );
    }
  }
}
