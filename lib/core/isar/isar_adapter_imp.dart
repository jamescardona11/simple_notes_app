import 'dart:async';

import 'package:db_adapter_flutter/core/db_core.dart';
import 'package:isar/isar.dart';

import 'isar_dao/isar_collaborator_dao_ex.dart';
import 'isar_dao/reactions_dao.dart';

class IsarAdapterImp implements ICarbonAdapter<int> {
  IsarAdapterImp._(this._db);

  final Isar _db;

  static Completer<IsarAdapterImp>? _completer;

  static Future<IsarAdapterImp> initAdapter(String name) async {
    if (_completer == null) {
      final Completer<IsarAdapterImp> completer = Completer<IsarAdapterImp>();
      try {
        if (Isar.instanceNames.isEmpty) {
          final dbInstance = await Isar.open(
            name: name,
            [
              IsarCollaboratorDAOSchema,
              ISarReactionsDAOSchema,
            ],
            inspector: true,
          );

          completer.complete(IsarAdapterImp._(dbInstance));
        }

        final dbInstance = Isar.getInstance(name);
        completer.complete(IsarAdapterImp._(dbInstance!));
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
    'collaborator': IsarCollaboratorDAO.fromMap,
    'reaction': ISarReactionsDAO.fromMap,
  };

  IsarCollection? getTableByString(String table) {
    if (table == (IsarCollaboratorDAO).toString()) {
      return _db.isarCollaboratorDAOs;
    }

    throw Exception('The type is not supported');
  }

  @override
  Future<void> create({
    required String table,
    required AdapterDAO dao,
  }) async {
    // table
    final collection = getTableByString(table);
    final isarObj = _isarObjects[table]?.call(dao.data);
    if (isarObj == null) return;

    return _db.writeTxn(() => collection!.put(isarObj));
  }

  @override
  Future<void> createMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  }) async {
    if (daoList.isEmpty) return;

    // _db.isarCollaboratorDTOs.filter().ima

    final collection = getTableByString(table);
    return _db.writeTxn(() => collection!.putAll(daoList.map((dato) => dato.data).toList()));
  }

  @override
  Future<void> delete({
    required String table,
    required int id,
  }) async {
    final collection = getTableByString(table);
    return _db.writeTxn(() => collection!.delete(id));
  }

  @override
  Stream<AdapterDAO?> read({
    required String table,
    required int id,
  }) async* {
    final collection = getTableByString(table);

    final element = await collection!.get(id);
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
  Stream<Iterable<AdapterDAO>> readWhere({
    required String table,
    Iterable<CarbonQuery> carbonQueries = const [],
    bool andFilters = true,
  }) async* {
    final collection = getTableByString(table);

    FilterCondition? filter;
    for (CarbonQuery query in carbonQueries) {
      if (query is LimitCarbonQuery) {
        // TODO
      } else if (query is SortCarbonQuery) {
        // TODO
      } else if (query is FilteringCarbonQuery) {
        // only take the last
        filter = _getFilterFromClause(query);
      }
    }

    yield* collection!
        .buildQuery(
          filter: filter,
        )
        .watch()
        .map((event) => event.map((element) => AdapterDAO(data: element)));
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