// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLastFetchedCollection on Isar {
  IsarCollection<LastFetched> get lastFetcheds => this.collection();
}

const LastFetchedSchema = CollectionSchema(
  name: r'LastFetched',
  id: -2493406244529580436,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'snapshot': PropertySchema(
      id: 1,
      name: r'snapshot',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _lastFetchedEstimateSize,
  serialize: _lastFetchedSerialize,
  deserialize: _lastFetchedDeserialize,
  deserializeProp: _lastFetchedDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _lastFetchedGetId,
  getLinks: _lastFetchedGetLinks,
  attach: _lastFetchedAttach,
  version: '3.0.5',
);

int _lastFetchedEstimateSize(
  LastFetched object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _lastFetchedSerialize(
  LastFetched object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeDateTime(offsets[1], object.snapshot);
}

LastFetched _lastFetchedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LastFetched();
  object.id = id;
  object.name = reader.readStringOrNull(offsets[0]);
  object.snapshot = reader.readDateTimeOrNull(offsets[1]);
  return object;
}

P _lastFetchedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lastFetchedGetId(LastFetched object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _lastFetchedGetLinks(LastFetched object) {
  return [];
}

void _lastFetchedAttach(
    IsarCollection<dynamic> col, Id id, LastFetched object) {
  object.id = id;
}

extension LastFetchedQueryWhereSort
    on QueryBuilder<LastFetched, LastFetched, QWhere> {
  QueryBuilder<LastFetched, LastFetched, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LastFetchedQueryWhere
    on QueryBuilder<LastFetched, LastFetched, QWhereClause> {
  QueryBuilder<LastFetched, LastFetched, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<LastFetched, LastFetched, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterWhereClause> idBetween(
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

extension LastFetchedQueryFilter
    on QueryBuilder<LastFetched, LastFetched, QFilterCondition> {
  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameContains(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition>
      snapshotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'snapshot',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition>
      snapshotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'snapshot',
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> snapshotEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snapshot',
        value: value,
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition>
      snapshotGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snapshot',
        value: value,
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition>
      snapshotLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snapshot',
        value: value,
      ));
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterFilterCondition> snapshotBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snapshot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LastFetchedQueryObject
    on QueryBuilder<LastFetched, LastFetched, QFilterCondition> {}

extension LastFetchedQueryLinks
    on QueryBuilder<LastFetched, LastFetched, QFilterCondition> {}

extension LastFetchedQuerySortBy
    on QueryBuilder<LastFetched, LastFetched, QSortBy> {
  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> sortBySnapshot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshot', Sort.asc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> sortBySnapshotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshot', Sort.desc);
    });
  }
}

extension LastFetchedQuerySortThenBy
    on QueryBuilder<LastFetched, LastFetched, QSortThenBy> {
  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> thenBySnapshot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshot', Sort.asc);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QAfterSortBy> thenBySnapshotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshot', Sort.desc);
    });
  }
}

extension LastFetchedQueryWhereDistinct
    on QueryBuilder<LastFetched, LastFetched, QDistinct> {
  QueryBuilder<LastFetched, LastFetched, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastFetched, LastFetched, QDistinct> distinctBySnapshot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snapshot');
    });
  }
}

extension LastFetchedQueryProperty
    on QueryBuilder<LastFetched, LastFetched, QQueryProperty> {
  QueryBuilder<LastFetched, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LastFetched, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LastFetched, DateTime?, QQueryOperations> snapshotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snapshot');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarMapDataCollection on Isar {
  IsarCollection<IsarMapData> get isarMapDatas => this.collection();
}

const IsarMapDataSchema = CollectionSchema(
  name: r'IsarMapData',
  id: 1730913657875577014,
  properties: {
    r'channel': PropertySchema(
      id: 0,
      name: r'channel',
      type: IsarType.string,
    ),
    r'clusterPlace': PropertySchema(
      id: 1,
      name: r'clusterPlace',
      type: IsarType.object,
      target: r'ClusterPlace',
    ),
    r'geoHash': PropertySchema(
      id: 2,
      name: r'geoHash',
      type: IsarType.string,
    ),
    r'loc': PropertySchema(
      id: 3,
      name: r'loc',
      type: IsarType.doubleList,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'needs': PropertySchema(
      id: 5,
      name: r'needs',
      type: IsarType.string,
    )
  },
  estimateSize: _isarMapDataEstimateSize,
  serialize: _isarMapDataSerialize,
  deserialize: _isarMapDataDeserialize,
  deserializeProp: _isarMapDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ClusterPlace': ClusterPlaceSchema,
    r'MapDataModel': MapDataModelSchema
  },
  getId: _isarMapDataGetId,
  getLinks: _isarMapDataGetLinks,
  attach: _isarMapDataAttach,
  version: '3.0.5',
);

int _isarMapDataEstimateSize(
  IsarMapData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.channel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.clusterPlace;
    if (value != null) {
      bytesCount += 3 +
          ClusterPlaceSchema.estimateSize(
              value, allOffsets[ClusterPlace]!, allOffsets);
    }
  }
  {
    final value = object.geoHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.loc;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.needs;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarMapDataSerialize(
  IsarMapData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.channel);
  writer.writeObject<ClusterPlace>(
    offsets[1],
    allOffsets,
    ClusterPlaceSchema.serialize,
    object.clusterPlace,
  );
  writer.writeString(offsets[2], object.geoHash);
  writer.writeDoubleList(offsets[3], object.loc);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.needs);
}

IsarMapData _isarMapDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarMapData();
  object.channel = reader.readStringOrNull(offsets[0]);
  object.clusterPlace = reader.readObjectOrNull<ClusterPlace>(
    offsets[1],
    ClusterPlaceSchema.deserialize,
    allOffsets,
  );
  object.geoHash = reader.readStringOrNull(offsets[2]);
  object.loc = reader.readDoubleList(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.needs = reader.readStringOrNull(offsets[5]);
  return object;
}

P _isarMapDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<ClusterPlace>(
        offset,
        ClusterPlaceSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleList(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarMapDataGetId(IsarMapData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarMapDataGetLinks(IsarMapData object) {
  return [];
}

void _isarMapDataAttach(
    IsarCollection<dynamic> col, Id id, IsarMapData object) {}

extension IsarMapDataQueryWhereSort
    on QueryBuilder<IsarMapData, IsarMapData, QWhere> {
  QueryBuilder<IsarMapData, IsarMapData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarMapDataQueryWhere
    on QueryBuilder<IsarMapData, IsarMapData, QWhereClause> {
  QueryBuilder<IsarMapData, IsarMapData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterWhereClause> idBetween(
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

extension IsarMapDataQueryFilter
    on QueryBuilder<IsarMapData, IsarMapData, QFilterCondition> {
  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      channelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'channel',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      channelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'channel',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> channelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      channelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> channelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> channelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'channel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      channelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> channelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> channelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> channelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'channel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      channelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      channelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'channel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      clusterPlaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clusterPlace',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      clusterPlaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clusterPlace',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      geoHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoHash',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      geoHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoHash',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> geoHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      geoHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> geoHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> geoHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      geoHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geoHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> geoHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geoHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> geoHashContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> geoHashMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      geoHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoHash',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      geoHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoHash',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> locIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'loc',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> locIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'loc',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loc',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> locIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loc',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loc',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loc',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loc',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      locLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loc',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameContains(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'needs',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      needsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'needs',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      needsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'needs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'needs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'needs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'needs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'needs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'needs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'needs',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> needsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needs',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition>
      needsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'needs',
        value: '',
      ));
    });
  }
}

extension IsarMapDataQueryObject
    on QueryBuilder<IsarMapData, IsarMapData, QFilterCondition> {
  QueryBuilder<IsarMapData, IsarMapData, QAfterFilterCondition> clusterPlace(
      FilterQuery<ClusterPlace> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'clusterPlace');
    });
  }
}

extension IsarMapDataQueryLinks
    on QueryBuilder<IsarMapData, IsarMapData, QFilterCondition> {}

extension IsarMapDataQuerySortBy
    on QueryBuilder<IsarMapData, IsarMapData, QSortBy> {
  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByGeoHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoHash', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByGeoHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoHash', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByNeeds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needs', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> sortByNeedsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needs', Sort.desc);
    });
  }
}

extension IsarMapDataQuerySortThenBy
    on QueryBuilder<IsarMapData, IsarMapData, QSortThenBy> {
  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByGeoHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoHash', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByGeoHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoHash', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByNeeds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needs', Sort.asc);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QAfterSortBy> thenByNeedsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needs', Sort.desc);
    });
  }
}

extension IsarMapDataQueryWhereDistinct
    on QueryBuilder<IsarMapData, IsarMapData, QDistinct> {
  QueryBuilder<IsarMapData, IsarMapData, QDistinct> distinctByChannel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'channel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QDistinct> distinctByGeoHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QDistinct> distinctByLoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loc');
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMapData, IsarMapData, QDistinct> distinctByNeeds(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needs', caseSensitive: caseSensitive);
    });
  }
}

extension IsarMapDataQueryProperty
    on QueryBuilder<IsarMapData, IsarMapData, QQueryProperty> {
  QueryBuilder<IsarMapData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarMapData, String?, QQueryOperations> channelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'channel');
    });
  }

  QueryBuilder<IsarMapData, ClusterPlace?, QQueryOperations>
      clusterPlaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clusterPlace');
    });
  }

  QueryBuilder<IsarMapData, String?, QQueryOperations> geoHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoHash');
    });
  }

  QueryBuilder<IsarMapData, List<double>?, QQueryOperations> locProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loc');
    });
  }

  QueryBuilder<IsarMapData, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarMapData, String?, QQueryOperations> needsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needs');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ClusterPlaceSchema = Schema(
  name: r'ClusterPlace',
  id: -3037005152076233067,
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
      target: r'MapDataModel',
    )
  },
  estimateSize: _clusterPlaceEstimateSize,
  serialize: _clusterPlaceSerialize,
  deserialize: _clusterPlaceDeserialize,
  deserializeProp: _clusterPlaceDeserializeProp,
);

int _clusterPlaceEstimateSize(
  ClusterPlace object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.geohash.length * 3;
  {
    final value = object.mapDataModel;
    if (value != null) {
      bytesCount += 3 +
          MapDataModelSchema.estimateSize(
              value, allOffsets[MapDataModel]!, allOffsets);
    }
  }
  return bytesCount;
}

void _clusterPlaceSerialize(
  ClusterPlace object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.geohash);
  writer.writeLong(offsets[1], object.id);
  writer.writeBool(offsets[2], object.isClosed);
  writer.writeObject<MapDataModel>(
    offsets[3],
    allOffsets,
    MapDataModelSchema.serialize,
    object.mapDataModel,
  );
}

ClusterPlace _clusterPlaceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClusterPlace(
    isClosed: reader.readBoolOrNull(offsets[2]),
    mapDataModel: reader.readObjectOrNull<MapDataModel>(
      offsets[3],
      MapDataModelSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _clusterPlaceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<MapDataModel>(
        offset,
        MapDataModelSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ClusterPlaceQueryFilter
    on QueryBuilder<ClusterPlace, ClusterPlace, QFilterCondition> {
  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashEqualTo(
    String value, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashGreaterThan(
    String value, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashLessThan(
    String value, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geohash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geohash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geohash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      geohashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geohash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition> idGreaterThan(
    int value, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition> idLessThan(
    int value, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
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

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      isClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isClosed',
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      isClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isClosed',
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      isClosedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      mapDataModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mapDataModel',
      ));
    });
  }

  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition>
      mapDataModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mapDataModel',
      ));
    });
  }
}

extension ClusterPlaceQueryObject
    on QueryBuilder<ClusterPlace, ClusterPlace, QFilterCondition> {
  QueryBuilder<ClusterPlace, ClusterPlace, QAfterFilterCondition> mapDataModel(
      FilterQuery<MapDataModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mapDataModel');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const MapDataModelSchema = Schema(
  name: r'MapDataModel',
  id: 4963730589104071966,
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
    )
  },
  estimateSize: _mapDataModelEstimateSize,
  serialize: _mapDataModelSerialize,
  deserialize: _mapDataModelDeserialize,
  deserializeProp: _mapDataModelDeserializeProp,
);

int _mapDataModelEstimateSize(
  MapDataModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _mapDataModelSerialize(
  MapDataModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.lat);
  writer.writeDouble(offsets[1], object.lng);
}

MapDataModel _mapDataModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MapDataModel();
  return object;
}

P _mapDataModelDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MapDataModelQueryFilter
    on QueryBuilder<MapDataModel, MapDataModel, QFilterCondition> {
  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition>
      latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> latEqualTo(
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition>
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> latLessThan(
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> latBetween(
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> lngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition>
      lngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> lngEqualTo(
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition>
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> lngLessThan(
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

  QueryBuilder<MapDataModel, MapDataModel, QAfterFilterCondition> lngBetween(
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
}

extension MapDataModelQueryObject
    on QueryBuilder<MapDataModel, MapDataModel, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopLevelResponse _$$_TopLevelResponseFromJson(Map<String, dynamic> json) =>
    _$_TopLevelResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MapDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_TopLevelResponseToJson(_$_TopLevelResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };

_$_MapDataModel _$$_MapDataModelFromJson(Map<String, dynamic> json) =>
    _$_MapDataModel(
      id: json['id'] as int?,
      loc: (json['loc'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      entryId: json['entryId'] as int?,
      epoch: json['epoch'] as int?,
      reason: json['reason'] as String?,
      channel: json['channel'] as String?,
      isLocationVerified: json['isLocationVerified'] as bool?,
      isNeedVerified: json['isNeedVerified'] as bool?,
      needs: (json['needs'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      geoHash: json['geoHash'] as String?,
    );

Map<String, dynamic> _$$_MapDataModelToJson(_$_MapDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loc': instance.loc,
      'entryId': instance.entryId,
      'epoch': instance.epoch,
      'reason': instance.reason,
      'channel': instance.channel,
      'isLocationVerified': instance.isLocationVerified,
      'isNeedVerified': instance.isNeedVerified,
      'needs': instance.needs,
      'geoHash': instance.geoHash,
    };
