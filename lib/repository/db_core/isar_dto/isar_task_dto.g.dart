// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_task_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarTaskDTOCollection on Isar {
  IsarCollection<IsarTaskDTO> get isarTaskDTOs => this.collection();
}

const IsarTaskDTOSchema = CollectionSchema(
  name: r'IsarTaskDTO',
  id: 4903510597696418195,
  properties: {
    r'dbID': PropertySchema(
      id: 0,
      name: r'dbID',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'randomNumber': PropertySchema(
      id: 2,
      name: r'randomNumber',
      type: IsarType.long,
    ),
    r'text': PropertySchema(
      id: 3,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _isarTaskDTOEstimateSize,
  serialize: _isarTaskDTOSerialize,
  deserialize: _isarTaskDTODeserialize,
  deserializeProp: _isarTaskDTODeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarTaskDTOGetId,
  getLinks: _isarTaskDTOGetLinks,
  attach: _isarTaskDTOAttach,
  version: '3.0.5',
);

int _isarTaskDTOEstimateSize(
  IsarTaskDTO object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dbID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _isarTaskDTOSerialize(
  IsarTaskDTO object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dbID);
  writer.writeString(offsets[1], object.id);
  writer.writeLong(offsets[2], object.randomNumber);
  writer.writeString(offsets[3], object.text);
}

IsarTaskDTO _isarTaskDTODeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTaskDTO(
    id: reader.readString(offsets[1]),
    randomNumber: reader.readLongOrNull(offsets[2]) ?? -1,
    text: reader.readStringOrNull(offsets[3]) ?? '',
  );
  object.isarId = id;
  return object;
}

P _isarTaskDTODeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? -1) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarTaskDTOGetId(IsarTaskDTO object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarTaskDTOGetLinks(IsarTaskDTO object) {
  return [];
}

void _isarTaskDTOAttach(
    IsarCollection<dynamic> col, Id id, IsarTaskDTO object) {
  object.isarId = id;
}

extension IsarTaskDTOQueryWhereSort
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QWhere> {
  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarTaskDTOQueryWhere
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QWhereClause> {
  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTaskDTOQueryFilter
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QFilterCondition> {
  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dbID',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      dbIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dbID',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dbID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dbID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dbID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dbID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> dbIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbID',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      dbIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dbID',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      randomNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'randomNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      randomNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'randomNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      randomNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'randomNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      randomNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'randomNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension IsarTaskDTOQueryObject
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QFilterCondition> {}

extension IsarTaskDTOQueryLinks
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QFilterCondition> {}

extension IsarTaskDTOQuerySortBy
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QSortBy> {
  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortByDbID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbID', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortByDbIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbID', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortByRandomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy>
      sortByRandomNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension IsarTaskDTOQuerySortThenBy
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QSortThenBy> {
  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByDbID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbID', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByDbIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbID', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByRandomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy>
      thenByRandomNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QAfterSortBy> thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension IsarTaskDTOQueryWhereDistinct
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QDistinct> {
  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QDistinct> distinctByDbID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QDistinct> distinctByRandomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'randomNumber');
    });
  }

  QueryBuilder<IsarTaskDTO, IsarTaskDTO, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension IsarTaskDTOQueryProperty
    on QueryBuilder<IsarTaskDTO, IsarTaskDTO, QQueryProperty> {
  QueryBuilder<IsarTaskDTO, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarTaskDTO, String?, QQueryOperations> dbIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbID');
    });
  }

  QueryBuilder<IsarTaskDTO, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarTaskDTO, int, QQueryOperations> randomNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'randomNumber');
    });
  }

  QueryBuilder<IsarTaskDTO, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsarTaskDTO _$IsarTaskDTOFromJson(Map<String, dynamic> json) => IsarTaskDTO(
      id: json['id'] as String,
      text: json['text'] as String? ?? '',
      randomNumber: json['randomNumber'] as int? ?? -1,
    )..isarId = json['isarId'] as int;

Map<String, dynamic> _$IsarTaskDTOToJson(IsarTaskDTO instance) =>
    <String, dynamic>{
      'isarId': instance.isarId,
      'id': instance.id,
      'text': instance.text,
      'randomNumber': instance.randomNumber,
    };
