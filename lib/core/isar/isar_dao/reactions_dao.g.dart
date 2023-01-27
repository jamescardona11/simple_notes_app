// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions_dao.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetISarReactionsDAOCollection on Isar {
  IsarCollection<ISarReactionsDAO> get iSarReactionsDAOs => this.collection();
}

const ISarReactionsDAOSchema = CollectionSchema(
  name: r'ISarReactionsDAO',
  id: 6926528767701372627,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 2,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'reactionTts': PropertySchema(
      id: 4,
      name: r'reactionTts',
      type: IsarType.string,
    )
  },
  estimateSize: _iSarReactionsDAOEstimateSize,
  serialize: _iSarReactionsDAOSerialize,
  deserialize: _iSarReactionsDAODeserialize,
  deserializeProp: _iSarReactionsDAODeserializeProp,
  idName: r'myObjectId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _iSarReactionsDAOGetId,
  getLinks: _iSarReactionsDAOGetLinks,
  attach: _iSarReactionsDAOAttach,
  version: '3.0.5',
);

int _iSarReactionsDAOEstimateSize(
  ISarReactionsDAO object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.imageUrl.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.reactionTts.length * 3;
  return bytesCount;
}

void _iSarReactionsDAOSerialize(
  ISarReactionsDAO object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.imageUrl);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.reactionTts);
}

ISarReactionsDAO _iSarReactionsDAODeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ISarReactionsDAO(
    code: reader.readString(offsets[0]),
    id: reader.readString(offsets[1]),
    imageUrl: reader.readString(offsets[2]),
    name: reader.readString(offsets[3]),
    reactionTts: reader.readString(offsets[4]),
  );
  object.myObjectId = id;
  return object;
}

P _iSarReactionsDAODeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _iSarReactionsDAOGetId(ISarReactionsDAO object) {
  return object.myObjectId;
}

List<IsarLinkBase<dynamic>> _iSarReactionsDAOGetLinks(ISarReactionsDAO object) {
  return [];
}

void _iSarReactionsDAOAttach(
    IsarCollection<dynamic> col, Id id, ISarReactionsDAO object) {
  object.myObjectId = id;
}

extension ISarReactionsDAOQueryWhereSort
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QWhere> {
  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterWhere>
      anyMyObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ISarReactionsDAOQueryWhere
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QWhereClause> {
  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterWhereClause>
      myObjectIdEqualTo(Id myObjectId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: myObjectId,
        upper: myObjectId,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterWhereClause>
      myObjectIdNotEqualTo(Id myObjectId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: myObjectId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: myObjectId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: myObjectId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: myObjectId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterWhereClause>
      myObjectIdGreaterThan(Id myObjectId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: myObjectId, includeLower: include),
      );
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterWhereClause>
      myObjectIdLessThan(Id myObjectId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: myObjectId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterWhereClause>
      myObjectIdBetween(
    Id lowerMyObjectId,
    Id upperMyObjectId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerMyObjectId,
        includeLower: includeLower,
        upper: upperMyObjectId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ISarReactionsDAOQueryFilter
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QFilterCondition> {
  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idEqualTo(
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

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idStartsWith(
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

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idEndsWith(
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

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      myObjectIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myObjectId',
        value: value,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      myObjectIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'myObjectId',
        value: value,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      myObjectIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'myObjectId',
        value: value,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      myObjectIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'myObjectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reactionTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reactionTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reactionTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reactionTts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reactionTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reactionTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reactionTts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reactionTts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reactionTts',
        value: '',
      ));
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterFilterCondition>
      reactionTtsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reactionTts',
        value: '',
      ));
    });
  }
}

extension ISarReactionsDAOQueryObject
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QFilterCondition> {}

extension ISarReactionsDAOQueryLinks
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QFilterCondition> {}

extension ISarReactionsDAOQuerySortBy
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QSortBy> {
  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByReactionTts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionTts', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      sortByReactionTtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionTts', Sort.desc);
    });
  }
}

extension ISarReactionsDAOQuerySortThenBy
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QSortThenBy> {
  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByMyObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myObjectId', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByMyObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myObjectId', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByReactionTts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionTts', Sort.asc);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QAfterSortBy>
      thenByReactionTtsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionTts', Sort.desc);
    });
  }
}

extension ISarReactionsDAOQueryWhereDistinct
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QDistinct> {
  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QDistinct>
      distinctByReactionTts({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reactionTts', caseSensitive: caseSensitive);
    });
  }
}

extension ISarReactionsDAOQueryProperty
    on QueryBuilder<ISarReactionsDAO, ISarReactionsDAO, QQueryProperty> {
  QueryBuilder<ISarReactionsDAO, int, QQueryOperations> myObjectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myObjectId');
    });
  }

  QueryBuilder<ISarReactionsDAO, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<ISarReactionsDAO, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ISarReactionsDAO, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<ISarReactionsDAO, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ISarReactionsDAO, String, QQueryOperations>
      reactionTtsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reactionTts');
    });
  }
}
