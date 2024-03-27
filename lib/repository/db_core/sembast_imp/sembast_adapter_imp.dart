import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

import '../db_core.dart';

class SembastAdapterImp implements ICarbonAdapter {
  SembastAdapterImp._(this._db);

  final Database _db;

  static Completer<SembastAdapterImp>? _completer;
  static SembastAdapterImp? _sembast;

  /// only call this if you called `initAdapter` first
  static SembastAdapterImp instance() {
    if (_completer == null) {
      throw Exception('Call initAdapter before instance');
    }

    return _sembast!;
  }

  static bool get wasInitCalled => _sembast != null;

  static Future<SembastAdapterImp> initAdapter({
    String name = 'sembast_default_name.db',
    int version = 1,
  }) async {
    if (_completer == null) {
      final Completer<SembastAdapterImp> completer = Completer<SembastAdapterImp>();
      try {
        late Database db;
        if (kIsWeb) {
          final factory = databaseFactoryWeb;
          db = await factory.openDatabase(name);
        } else {
          final pathName = await _getDBPathWithName(name);

          DatabaseFactory dbFactory = databaseFactoryIo;
          db = await dbFactory.openDatabase(pathName, version: 1);
        }

        _sembast = SembastAdapterImp._(db);
        completer.complete(_sembast!);
      } on Exception catch (e) {
        // If there's an error, explicitly return the future with an error.
        // then set the completer to null so we can retry.
        completer.completeError(e);

        final Future<SembastAdapterImp> sembastFuture = completer.future;
        _completer == null;

        return sembastFuture;
      }

      _completer = completer;
    }

    return _completer!.future;
  }

  static Future<String> _getDBPathWithName(String name) async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    return '${dir.path}/$name';
  }

  Future<void> closeDatabase() => _db.close();

  @override
  Future<void> create({
    required String table,
    required AdapterDAO dao,
  }) async {
    final store = _sembastStore(table);

    final formatData = dao.formatData();
    await store.record(formatData.id!).add(
          _db,
          formatData.data,
        );
  }

  @override
  Future<void> createMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  }) async {
    final store = _sembastStore(table);
    final formatData = daoList.map((e) => e.formatData()).toList();

    await _db.transaction((transaction) async {
      final ids = formatData.map((item) => item.id!).toList();
      final keys = formatData.map((item) => item.data).toList();

      await store.records(ids).add(transaction, keys);
    });
  }

  @override
  Future<void> update({
    required String table,
    required AdapterDAO dao,
  }) async {
    final store = _sembastStore(table);
    final formatData = dao.formatData();
    await store.record(formatData.id!).put(
          _db,
          formatData.data,
          merge: true,
        );
  }

  @override
  Future<void> updateMany({
    required String table,
    required Iterable<AdapterDAO> daoList,
  }) async {
    final store = _sembastStore(table);
    final formatData = daoList.map((e) => e.formatData());
    await _db.transaction((transaction) async {
      final ids = formatData.map((item) => item.id!).toList();
      final keys = formatData.map((item) => item.data).toList();
      await store.records(ids).put(
            _db,
            keys,
            merge: true,
          );
    });
  }

  @override
  Future<void> delete({
    required String table,
    required String id,
  }) async {
    final store = _sembastStore(table);
    await store.record(id).delete(_db);
  }

  @override
  Stream<AdapterDAO?> watchOne({
    required String table,
    required String id,
  }) async* {
    final store = _sembastStore(table);
    yield* store.record(id).onSnapshot(_db).map(
          (snapshot) => snapshot == null
              ? null
              : AdapterDAO(
                  id: id,
                  data: snapshot.value,
                ),
        );
  }

  @override
  Stream<Iterable<AdapterDAO>> watch({
    required String table,
    Iterable<CarbonQuery> carbonQueries = const [],
    bool andFilters = true,
  }) {
    final store = _sembastStore(table);
    Finder finder = _getFinder(carbonQueries, andFilters);

    return store.query(finder: finder).onSnapshots(_db).map((snapshots) => snapshots.map((e) => AdapterDAO(
          id: e.key,
          data: e.value,
        )));
  }

  StoreRef<String, Map<String, Object?>> _sembastStore(String table) =>
      (table.isEmpty) ? StoreRef<String, Map<String, Object>>.main() : stringMapStoreFactory.store(table);

  Finder _getFinder(Iterable<CarbonQuery> carbonQueries, bool andFilters) {
    final finder = Finder();
    List<Filter> filters = [];

    for (CarbonQuery query in carbonQueries) {
      if (query is LimitCarbonQuery) {
        finder.limit = query.limit;
      } else if (query is SortCarbonQuery) {
        finder.sortOrder = SortOrder(
          query.property,
          query.ascending,
        );
      } else if (query is FilteringCarbonQuery) {
        filters.add(_getFilterFromClause(query));
      }
    }

    if (andFilters) {
      finder.filter = Filter.and(filters);
    } else {
      finder.filter = Filter.or(filters);
    }

    return finder;
  }

  Filter _getFilterFromClause(FilteringCarbonQuery filtering) {
    switch (filtering.comparator) {
      case FilteringType.equalTo:
        return Filter.equals(
          filtering.property,
          filtering.value,
        );

      case FilteringType.greaterThan:
        return Filter.greaterThan(
          filtering.property,
          filtering.value,
        );

      case FilteringType.lessThan:
        return Filter.lessThan(
          filtering.property,
          filtering.value,
        );

      case FilteringType.contains:
        return Filter.matches(
          filtering.property,
          filtering.value as String,
        );

      case FilteringType.isNull:
        return Filter.isNull(filtering.property);

      case FilteringType.isNotNull:
        return Filter.notNull(filtering.property);
    }
  }

  @override
  Future<void> dropTable({required String table}) => _sembastStore(table).drop(_db);
}
