// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopLevelResponse _$TopLevelResponseFromJson(Map<String, dynamic> json) {
  return _TopLevelResponse.fromJson(json);
}

/// @nodoc
mixin _$TopLevelResponse {
  List<MapDataModel>? get results => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopLevelResponseCopyWith<TopLevelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopLevelResponseCopyWith<$Res> {
  factory $TopLevelResponseCopyWith(
          TopLevelResponse value, $Res Function(TopLevelResponse) then) =
      _$TopLevelResponseCopyWithImpl<$Res, TopLevelResponse>;
  @useResult
  $Res call({List<MapDataModel>? results, int? count});
}

/// @nodoc
class _$TopLevelResponseCopyWithImpl<$Res, $Val extends TopLevelResponse>
    implements $TopLevelResponseCopyWith<$Res> {
  _$TopLevelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MapDataModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopLevelResponseCopyWith<$Res>
    implements $TopLevelResponseCopyWith<$Res> {
  factory _$$_TopLevelResponseCopyWith(
          _$_TopLevelResponse value, $Res Function(_$_TopLevelResponse) then) =
      __$$_TopLevelResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MapDataModel>? results, int? count});
}

/// @nodoc
class __$$_TopLevelResponseCopyWithImpl<$Res>
    extends _$TopLevelResponseCopyWithImpl<$Res, _$_TopLevelResponse>
    implements _$$_TopLevelResponseCopyWith<$Res> {
  __$$_TopLevelResponseCopyWithImpl(
      _$_TopLevelResponse _value, $Res Function(_$_TopLevelResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_TopLevelResponse(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MapDataModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopLevelResponse
    with DiagnosticableTreeMixin
    implements _TopLevelResponse {
  const _$_TopLevelResponse({final List<MapDataModel>? results, this.count})
      : _results = results;

  factory _$_TopLevelResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TopLevelResponseFromJson(json);

  final List<MapDataModel>? _results;
  @override
  List<MapDataModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopLevelResponse(results: $results, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopLevelResponse'))
      ..add(DiagnosticsProperty('results', results))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopLevelResponse &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopLevelResponseCopyWith<_$_TopLevelResponse> get copyWith =>
      __$$_TopLevelResponseCopyWithImpl<_$_TopLevelResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopLevelResponseToJson(
      this,
    );
  }
}

abstract class _TopLevelResponse implements TopLevelResponse {
  const factory _TopLevelResponse(
      {final List<MapDataModel>? results,
      final int? count}) = _$_TopLevelResponse;

  factory _TopLevelResponse.fromJson(Map<String, dynamic> json) =
      _$_TopLevelResponse.fromJson;

  @override
  List<MapDataModel>? get results;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_TopLevelResponseCopyWith<_$_TopLevelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MapDataModel _$MapDataModelFromJson(Map<String, dynamic> json) {
  return _MapDataModel.fromJson(json);
}

/// @nodoc
mixin _$MapDataModel {
  int? get id => throw _privateConstructorUsedError;
  List<double>? get loc => throw _privateConstructorUsedError;
  int? get entryId => throw _privateConstructorUsedError;
  int? get epoch => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get channel => throw _privateConstructorUsedError;
  bool? get isLocationVerified => throw _privateConstructorUsedError;
  bool? get isNeedVerified => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get needs => throw _privateConstructorUsedError;
  String? get geoHash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapDataModelCopyWith<MapDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapDataModelCopyWith<$Res> {
  factory $MapDataModelCopyWith(
          MapDataModel value, $Res Function(MapDataModel) then) =
      _$MapDataModelCopyWithImpl<$Res, MapDataModel>;
  @useResult
  $Res call(
      {int? id,
      List<double>? loc,
      int? entryId,
      int? epoch,
      String? reason,
      String? channel,
      bool? isLocationVerified,
      bool? isNeedVerified,
      List<Map<String, dynamic>>? needs,
      String? geoHash});
}

/// @nodoc
class _$MapDataModelCopyWithImpl<$Res, $Val extends MapDataModel>
    implements $MapDataModelCopyWith<$Res> {
  _$MapDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? loc = freezed,
    Object? entryId = freezed,
    Object? epoch = freezed,
    Object? reason = freezed,
    Object? channel = freezed,
    Object? isLocationVerified = freezed,
    Object? isNeedVerified = freezed,
    Object? needs = freezed,
    Object? geoHash = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      loc: freezed == loc
          ? _value.loc
          : loc // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      entryId: freezed == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocationVerified: freezed == isLocationVerified
          ? _value.isLocationVerified
          : isLocationVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNeedVerified: freezed == isNeedVerified
          ? _value.isNeedVerified
          : isNeedVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      needs: freezed == needs
          ? _value.needs
          : needs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      geoHash: freezed == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapDataModelCopyWith<$Res>
    implements $MapDataModelCopyWith<$Res> {
  factory _$$_MapDataModelCopyWith(
          _$_MapDataModel value, $Res Function(_$_MapDataModel) then) =
      __$$_MapDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      List<double>? loc,
      int? entryId,
      int? epoch,
      String? reason,
      String? channel,
      bool? isLocationVerified,
      bool? isNeedVerified,
      List<Map<String, dynamic>>? needs,
      String? geoHash});
}

/// @nodoc
class __$$_MapDataModelCopyWithImpl<$Res>
    extends _$MapDataModelCopyWithImpl<$Res, _$_MapDataModel>
    implements _$$_MapDataModelCopyWith<$Res> {
  __$$_MapDataModelCopyWithImpl(
      _$_MapDataModel _value, $Res Function(_$_MapDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? loc = freezed,
    Object? entryId = freezed,
    Object? epoch = freezed,
    Object? reason = freezed,
    Object? channel = freezed,
    Object? isLocationVerified = freezed,
    Object? isNeedVerified = freezed,
    Object? needs = freezed,
    Object? geoHash = freezed,
  }) {
    return _then(_$_MapDataModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      loc: freezed == loc
          ? _value._loc
          : loc // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      entryId: freezed == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as int?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocationVerified: freezed == isLocationVerified
          ? _value.isLocationVerified
          : isLocationVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNeedVerified: freezed == isNeedVerified
          ? _value.isNeedVerified
          : isNeedVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      needs: freezed == needs
          ? _value._needs
          : needs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      geoHash: freezed == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapDataModel extends _MapDataModel with DiagnosticableTreeMixin {
  const _$_MapDataModel(
      {this.id,
      final List<double>? loc,
      this.entryId,
      this.epoch,
      this.reason,
      this.channel,
      this.isLocationVerified,
      this.isNeedVerified,
      final List<Map<String, dynamic>>? needs,
      this.geoHash})
      : _loc = loc,
        _needs = needs,
        super._();

  factory _$_MapDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_MapDataModelFromJson(json);

  @override
  final int? id;
  final List<double>? _loc;
  @override
  List<double>? get loc {
    final value = _loc;
    if (value == null) return null;
    if (_loc is EqualUnmodifiableListView) return _loc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? entryId;
  @override
  final int? epoch;
  @override
  final String? reason;
  @override
  final String? channel;
  @override
  final bool? isLocationVerified;
  @override
  final bool? isNeedVerified;
  final List<Map<String, dynamic>>? _needs;
  @override
  List<Map<String, dynamic>>? get needs {
    final value = _needs;
    if (value == null) return null;
    if (_needs is EqualUnmodifiableListView) return _needs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? geoHash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapDataModel(id: $id, loc: $loc, entryId: $entryId, epoch: $epoch, reason: $reason, channel: $channel, isLocationVerified: $isLocationVerified, isNeedVerified: $isNeedVerified, needs: $needs, geoHash: $geoHash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapDataModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('loc', loc))
      ..add(DiagnosticsProperty('entryId', entryId))
      ..add(DiagnosticsProperty('epoch', epoch))
      ..add(DiagnosticsProperty('reason', reason))
      ..add(DiagnosticsProperty('channel', channel))
      ..add(DiagnosticsProperty('isLocationVerified', isLocationVerified))
      ..add(DiagnosticsProperty('isNeedVerified', isNeedVerified))
      ..add(DiagnosticsProperty('needs', needs))
      ..add(DiagnosticsProperty('geoHash', geoHash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapDataModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._loc, _loc) &&
            (identical(other.entryId, entryId) || other.entryId == entryId) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.isLocationVerified, isLocationVerified) ||
                other.isLocationVerified == isLocationVerified) &&
            (identical(other.isNeedVerified, isNeedVerified) ||
                other.isNeedVerified == isNeedVerified) &&
            const DeepCollectionEquality().equals(other._needs, _needs) &&
            (identical(other.geoHash, geoHash) || other.geoHash == geoHash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_loc),
      entryId,
      epoch,
      reason,
      channel,
      isLocationVerified,
      isNeedVerified,
      const DeepCollectionEquality().hash(_needs),
      geoHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapDataModelCopyWith<_$_MapDataModel> get copyWith =>
      __$$_MapDataModelCopyWithImpl<_$_MapDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapDataModelToJson(
      this,
    );
  }
}

abstract class _MapDataModel extends MapDataModel {
  const factory _MapDataModel(
      {final int? id,
      final List<double>? loc,
      final int? entryId,
      final int? epoch,
      final String? reason,
      final String? channel,
      final bool? isLocationVerified,
      final bool? isNeedVerified,
      final List<Map<String, dynamic>>? needs,
      final String? geoHash}) = _$_MapDataModel;
  const _MapDataModel._() : super._();

  factory _MapDataModel.fromJson(Map<String, dynamic> json) =
      _$_MapDataModel.fromJson;

  @override
  int? get id;
  @override
  List<double>? get loc;
  @override
  int? get entryId;
  @override
  int? get epoch;
  @override
  String? get reason;
  @override
  String? get channel;
  @override
  bool? get isLocationVerified;
  @override
  bool? get isNeedVerified;
  @override
  List<Map<String, dynamic>>? get needs;
  @override
  String? get geoHash;
  @override
  @JsonKey(ignore: true)
  _$$_MapDataModelCopyWith<_$_MapDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
