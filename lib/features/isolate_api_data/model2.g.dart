// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model2.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarMapData2Collection on Isar {
  IsarCollection<IsarMapData2> get isarMapData2s => this.collection();
}

const IsarMapData2Schema = CollectionSchema(
  name: r'IsarMapData2',
  id: -1143592861592187144,
  properties: {
    r'clusterPlace': PropertySchema(
      id: 0,
      name: r'clusterPlace',
      type: IsarType.object,
      target: r'ClusterPlace2',
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _isarMapData2EstimateSize,
  serialize: _isarMapData2Serialize,
  deserialize: _isarMapData2Deserialize,
  deserializeProp: _isarMapData2DeserializeProp,
  idName: r'id2',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ClusterPlace2': ClusterPlace2Schema,
    r'MapDataModel2': MapDataModel2Schema
  },
  getId: _isarMapData2GetId,
  getLinks: _isarMapData2GetLinks,
  attach: _isarMapData2Attach,
  version: '3.0.5',
);

int _isarMapData2EstimateSize(
  IsarMapData2 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clusterPlace;
    if (value != null) {
      bytesCount += 3 +
          ClusterPlace2Schema.estimateSize(
              value, allOffsets[ClusterPlace2]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarMapData2Serialize(
  IsarMapData2 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<ClusterPlace2>(
    offsets[0],
    allOffsets,
    ClusterPlace2Schema.serialize,
    object.clusterPlace,
  );
  writer.writeLong(offsets[1], object.id);
  writer.writeString(offsets[2], object.name);
}

IsarMapData2 _isarMapData2Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarMapData2(
    clusterPlace: reader.readObjectOrNull<ClusterPlace2>(
      offsets[0],
      ClusterPlace2Schema.deserialize,
      allOffsets,
    ),
    id: reader.readLongOrNull(offsets[1]),
    name: reader.readStringOrNull(offsets[2]),
  );
  object.id2 = id;
  return object;
}

P _isarMapData2DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<ClusterPlace2>(
        offset,
        ClusterPlace2Schema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarMapData2GetId(IsarMapData2 object) {
  return object.id2 ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarMapData2GetLinks(IsarMapData2 object) {
  return [];
}

void _isarMapData2Attach(
    IsarCollection<dynamic> col, Id id, IsarMapData2 object) {
  object.id2 = id;
}

extension IsarMapData2QueryWhereSort
    on QueryBuilder<IsarMapData2, IsarMapData2, QWhere> {
  QueryBuilder<IsarMapData2, IsarMapData2, QAfterWhere> anyId2() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarMapData2QueryWhere
    on QueryBuilder<IsarMapData2, IsarMapData2, QWhereClause> {
  QueryBuilder<IsarMapData2, IsarMapData2, QAfterWhereClause> id2EqualTo(
      Id id2) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id2,
        upper: id2,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterWhereClause> id2NotEqualTo(
      Id id2) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id2, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id2, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id2, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id2, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterWhereClause> id2GreaterThan(
      Id id2,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id2, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterWhereClause> id2LessThan(
      Id id2,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id2, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterWhereClause> id2Between(
    Id lowerId2,
    Id upperId2, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId2,
        includeLower: includeLower,
        upper: upperId2,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarMapData2QueryFilter
    on QueryBuilder<IsarMapData2, IsarMapData2, QFilterCondition> {
  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      clusterPlaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clusterPlace',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      clusterPlaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clusterPlace',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> id2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id2',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      id2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id2',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> id2EqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id2',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      id2GreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id2',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> id2LessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id2',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> id2Between(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameEqualTo(
    String? value, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameLessThan(
    String? value, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension IsarMapData2QueryObject
    on QueryBuilder<IsarMapData2, IsarMapData2, QFilterCondition> {
  QueryBuilder<IsarMapData2, IsarMapData2, QAfterFilterCondition> clusterPlace(
      FilterQuery<ClusterPlace2> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'clusterPlace');
    });
  }
}

extension IsarMapData2QueryLinks
    on QueryBuilder<IsarMapData2, IsarMapData2, QFilterCondition> {}

extension IsarMapData2QuerySortBy
    on QueryBuilder<IsarMapData2, IsarMapData2, QSortBy> {
  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension IsarMapData2QuerySortThenBy
    on QueryBuilder<IsarMapData2, IsarMapData2, QSortThenBy> {
  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> thenById2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id2', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> thenById2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id2', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension IsarMapData2QueryWhereDistinct
    on QueryBuilder<IsarMapData2, IsarMapData2, QDistinct> {
  QueryBuilder<IsarMapData2, IsarMapData2, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<IsarMapData2, IsarMapData2, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension IsarMapData2QueryProperty
    on QueryBuilder<IsarMapData2, IsarMapData2, QQueryProperty> {
  QueryBuilder<IsarMapData2, int, QQueryOperations> id2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id2');
    });
  }

  QueryBuilder<IsarMapData2, ClusterPlace2?, QQueryOperations>
      clusterPlaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clusterPlace');
    });
  }

  QueryBuilder<IsarMapData2, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarMapData2, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ClusterPlace2Schema = Schema(
  name: r'ClusterPlace2',
  id: 8135275609734800756,
  properties: {
    r'geohash': PropertySchema(
      id: 0,
      name: r'geohash',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'isClosed': PropertySchema(
      id: 2,
      name: r'isClosed',
      type: IsarType.bool,
    ),
    r'mapDataModel': PropertySchema(
      id: 3,
      name: r'mapDataModel',
      type: IsarType.object,
      target: r'MapDataModel2',
    )
  },
  estimateSize: _clusterPlace2EstimateSize,
  serialize: _clusterPlace2Serialize,
  deserialize: _clusterPlace2Deserialize,
  deserializeProp: _clusterPlace2DeserializeProp,
);

int _clusterPlace2EstimateSize(
  ClusterPlace2 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.geohash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mapDataModel;
    if (value != null) {
      bytesCount += 3 +
          MapDataModel2Schema.estimateSize(
              value, allOffsets[MapDataModel2]!, allOffsets);
    }
  }
  return bytesCount;
}

void _clusterPlace2Serialize(
  ClusterPlace2 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.geohash);
  writer.writeLong(offsets[1], object.id);
  writer.writeBool(offsets[2], object.isClosed);
  writer.writeObject<MapDataModel2>(
    offsets[3],
    allOffsets,
    MapDataModel2Schema.serialize,
    object.mapDataModel,
  );
}

ClusterPlace2 _clusterPlace2Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClusterPlace2(
    geohash: reader.readStringOrNull(offsets[0]),
    id: reader.readLongOrNull(offsets[1]),
    isClosed: reader.readBoolOrNull(offsets[2]),
    mapDataModel: reader.readObjectOrNull<MapDataModel2>(
      offsets[3],
      MapDataModel2Schema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _clusterPlace2DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<MapDataModel2>(
        offset,
        MapDataModel2Schema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ClusterPlace2QueryFilter
    on QueryBuilder<ClusterPlace2, ClusterPlace2, QFilterCondition> {
  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geohash',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geohash',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geohash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geohash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geohash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      geohashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geohash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
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

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      isClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isClosed',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      isClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isClosed',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      isClosedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      mapDataModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mapDataModel',
      ));
    });
  }

  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      mapDataModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mapDataModel',
      ));
    });
  }
}

extension ClusterPlace2QueryObject
    on QueryBuilder<ClusterPlace2, ClusterPlace2, QFilterCondition> {
  QueryBuilder<ClusterPlace2, ClusterPlace2, QAfterFilterCondition>
      mapDataModel(FilterQuery<MapDataModel2> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mapDataModel');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const MapDataModel2Schema = Schema(
  name: r'MapDataModel2',
  id: 7164235444202606381,
  properties: {
    r'lat': PropertySchema(
      id: 0,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lng': PropertySchema(
      id: 1,
      name: r'lng',
      type: IsarType.double,
    ),
    r'reason': PropertySchema(
      id: 2,
      name: r'reason',
      type: IsarType.string,
    )
  },
  estimateSize: _mapDataModel2EstimateSize,
  serialize: _mapDataModel2Serialize,
  deserialize: _mapDataModel2Deserialize,
  deserializeProp: _mapDataModel2DeserializeProp,
);

int _mapDataModel2EstimateSize(
  MapDataModel2 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.reason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mapDataModel2Serialize(
  MapDataModel2 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.lat);
  writer.writeDouble(offsets[1], object.lng);
  writer.writeString(offsets[2], object.reason);
}

MapDataModel2 _mapDataModel2Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MapDataModel2(
    lat: reader.readDoubleOrNull(offsets[0]),
    lng: reader.readDoubleOrNull(offsets[1]),
    reason: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _mapDataModel2DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MapDataModel2QueryFilter
    on QueryBuilder<MapDataModel2, MapDataModel2, QFilterCondition> {
  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition> latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      lngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      lngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition> lngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      lngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition> lngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition> lngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reason',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reason',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<MapDataModel2, MapDataModel2, QAfterFilterCondition>
      reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reason',
        value: '',
      ));
    });
  }
}

extension MapDataModel2QueryObject
    on QueryBuilder<MapDataModel2, MapDataModel2, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopLevelResponse2 _$$_TopLevelResponse2FromJson(Map<String, dynamic> json) =>
    _$_TopLevelResponse2(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MapDataModel2.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_TopLevelResponse2ToJson(
        _$_TopLevelResponse2 instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
