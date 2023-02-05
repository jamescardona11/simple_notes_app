abstract class CarbonQuery {}

class LimitCarbonQuery extends CarbonQuery {
  final int limit;

  LimitCarbonQuery([this.limit = -1]); // -1 = infinite
}

class SortCarbonQuery extends CarbonQuery {
  final bool ascending;
  final String property;

  SortCarbonQuery({
    this.ascending = true,
    required this.property,
  });
}

class FilteringCarbonQuery extends CarbonQuery {
  final FilteringType comparator;
  final String property;
  final dynamic value;

  FilteringCarbonQuery({
    required this.comparator,
    required this.property,
    this.value,
  });
}

/// Enum that represent `sort` clause.
enum SortType {
  asc,
  desc,
}

/// Enum that represent diferentes `where` clauses.
enum FilteringType {
  equalTo,
  greaterThan,
  lessThan,
  contains,
  isNull,
  isNotNull,
}
