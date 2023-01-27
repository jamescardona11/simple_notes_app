// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_collaborator_dao_ex.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarCollaboratorDAOCollection on Isar {
  IsarCollection<IsarCollaboratorDAO> get isarCollaboratorDAOs =>
      this.collection();
}

const IsarCollaboratorDAOSchema = CollectionSchema(
  name: r'IsarCollaboratorDAO',
  id: 8083296202864888016,
  properties: {
    r'firstName': PropertySchema(
      id: 0,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'forUnheard': PropertySchema(
      id: 1,
      name: r'forUnheard',
      type: IsarType.bool,
    ),
    r'imageUrl': PropertySchema(
      id: 2,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'lastName': PropertySchema(
      id: 3,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'roleCd': PropertySchema(
      id: 4,
      name: r'roleCd',
      type: IsarType.string,
    ),
    r'userGuid': PropertySchema(
      id: 5,
      name: r'userGuid',
      type: IsarType.string,
    )
  },
  estimateSize: _isarCollaboratorDAOEstimateSize,
  serialize: _isarCollaboratorDAOSerialize,
  deserialize: _isarCollaboratorDAODeserialize,
  deserializeProp: _isarCollaboratorDAODeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarCollaboratorDAOGetId,
  getLinks: _isarCollaboratorDAOGetLinks,
  attach: _isarCollaboratorDAOAttach,
  version: '3.0.5',
);

int _isarCollaboratorDAOEstimateSize(
  IsarCollaboratorDAO object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.firstName.length * 3;
  bytesCount += 3 + object.imageUrl.length * 3;
  bytesCount += 3 + object.lastName.length * 3;
  bytesCount += 3 + object.roleCd.length * 3;
  bytesCount += 3 + object.userGuid.length * 3;
  return bytesCount;
}

void _isarCollaboratorDAOSerialize(
  IsarCollaboratorDAO object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.firstName);
  writer.writeBool(offsets[1], object.forUnheard);
  writer.writeString(offsets[2], object.imageUrl);
  writer.writeString(offsets[3], object.lastName);
  writer.writeString(offsets[4], object.roleCd);
  writer.writeString(offsets[5], object.userGuid);
}

IsarCollaboratorDAO _isarCollaboratorDAODeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarCollaboratorDAO(
    reader.readString(offsets[0]),
    reader.readString(offsets[3]),
    reader.readString(offsets[5]),
    reader.readString(offsets[2]),
    reader.readString(offsets[4]),
    forUnheard: reader.readBoolOrNull(offsets[1]) ?? false,
  );
  object.id = id;
  return object;
}

P _isarCollaboratorDAODeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarCollaboratorDAOGetId(IsarCollaboratorDAO object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarCollaboratorDAOGetLinks(
    IsarCollaboratorDAO object) {
  return [];
}

void _isarCollaboratorDAOAttach(
    IsarCollection<dynamic> col, Id id, IsarCollaboratorDAO object) {
  object.id = id;
}

extension IsarCollaboratorDAOQueryWhereSort
    on QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QWhere> {
  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarCollaboratorDAOQueryWhere
    on QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QWhereClause> {
  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarCollaboratorDAOQueryFilter on QueryBuilder<IsarCollaboratorDAO,
    IsarCollaboratorDAO, QFilterCondition> {
  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      forUnheardEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'forUnheard',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
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

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
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

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
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

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
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

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
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

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
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

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleCd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roleCd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roleCd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roleCd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roleCd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roleCd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleCd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roleCd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleCd',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      roleCdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleCd',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userGuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userGuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userGuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userGuid',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterFilterCondition>
      userGuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userGuid',
        value: '',
      ));
    });
  }
}

extension IsarCollaboratorDAOQueryObject on QueryBuilder<IsarCollaboratorDAO,
    IsarCollaboratorDAO, QFilterCondition> {}

extension IsarCollaboratorDAOQueryLinks on QueryBuilder<IsarCollaboratorDAO,
    IsarCollaboratorDAO, QFilterCondition> {}

extension IsarCollaboratorDAOQuerySortBy
    on QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QSortBy> {
  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByForUnheard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forUnheard', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByForUnheardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forUnheard', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByRoleCd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleCd', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByRoleCdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleCd', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByUserGuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGuid', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      sortByUserGuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGuid', Sort.desc);
    });
  }
}

extension IsarCollaboratorDAOQuerySortThenBy
    on QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QSortThenBy> {
  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByForUnheard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forUnheard', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByForUnheardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forUnheard', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByRoleCd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleCd', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByRoleCdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleCd', Sort.desc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByUserGuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGuid', Sort.asc);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QAfterSortBy>
      thenByUserGuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userGuid', Sort.desc);
    });
  }
}

extension IsarCollaboratorDAOQueryWhereDistinct
    on QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct> {
  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct>
      distinctByFirstName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct>
      distinctByForUnheard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forUnheard');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct>
      distinctByLastName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct>
      distinctByRoleCd({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleCd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QDistinct>
      distinctByUserGuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userGuid', caseSensitive: caseSensitive);
    });
  }
}

extension IsarCollaboratorDAOQueryProperty
    on QueryBuilder<IsarCollaboratorDAO, IsarCollaboratorDAO, QQueryProperty> {
  QueryBuilder<IsarCollaboratorDAO, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, String, QQueryOperations>
      firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, bool, QQueryOperations>
      forUnheardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forUnheard');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, String, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, String, QQueryOperations>
      lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, String, QQueryOperations> roleCdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleCd');
    });
  }

  QueryBuilder<IsarCollaboratorDAO, String, QQueryOperations>
      userGuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userGuid');
    });
  }
}
