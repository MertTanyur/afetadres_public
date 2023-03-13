// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopLevelResponse2 _$TopLevelResponse2FromJson(Map<String, dynamic> json) {
  return _TopLevelResponse2.fromJson(json);
}

/// @nodoc
mixin _$TopLevelResponse2 {
  List<MapDataModel2>? get results => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopLevelResponse2CopyWith<TopLevelResponse2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopLevelResponse2CopyWith<$Res> {
  factory $TopLevelResponse2CopyWith(
          TopLevelResponse2 value, $Res Function(TopLevelResponse2) then) =
      _$TopLevelResponse2CopyWithImpl<$Res, TopLevelResponse2>;
  @useResult
  $Res call({List<MapDataModel2>? results, int? count});
}

/// @nodoc
class _$TopLevelResponse2CopyWithImpl<$Res, $Val extends TopLevelResponse2>
    implements $TopLevelResponse2CopyWith<$Res> {
  _$TopLevelResponse2CopyWithImpl(this._value, this._then);

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
              as List<MapDataModel2>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopLevelResponse2CopyWith<$Res>
    implements $TopLevelResponse2CopyWith<$Res> {
  factory _$$_TopLevelResponse2CopyWith(_$_TopLevelResponse2 value,
          $Res Function(_$_TopLevelResponse2) then) =
      __$$_TopLevelResponse2CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MapDataModel2>? results, int? count});
}

/// @nodoc
class __$$_TopLevelResponse2CopyWithImpl<$Res>
    extends _$TopLevelResponse2CopyWithImpl<$Res, _$_TopLevelResponse2>
    implements _$$_TopLevelResponse2CopyWith<$Res> {
  __$$_TopLevelResponse2CopyWithImpl(
      _$_TopLevelResponse2 _value, $Res Function(_$_TopLevelResponse2) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_TopLevelResponse2(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MapDataModel2>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopLevelResponse2 implements _TopLevelResponse2 {
  const _$_TopLevelResponse2({final List<MapDataModel2>? results, this.count})
      : _results = results;

  factory _$_TopLevelResponse2.fromJson(Map<String, dynamic> json) =>
      _$$_TopLevelResponse2FromJson(json);

  final List<MapDataModel2>? _results;
  @override
  List<MapDataModel2>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'TopLevelResponse2(results: $results, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopLevelResponse2 &&
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
  _$$_TopLevelResponse2CopyWith<_$_TopLevelResponse2> get copyWith =>
      __$$_TopLevelResponse2CopyWithImpl<_$_TopLevelResponse2>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopLevelResponse2ToJson(
      this,
    );
  }
}

abstract class _TopLevelResponse2 implements TopLevelResponse2 {
  const factory _TopLevelResponse2(
      {final List<MapDataModel2>? results,
      final int? count}) = _$_TopLevelResponse2;

  factory _TopLevelResponse2.fromJson(Map<String, dynamic> json) =
      _$_TopLevelResponse2.fromJson;

  @override
  List<MapDataModel2>? get results;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_TopLevelResponse2CopyWith<_$_TopLevelResponse2> get copyWith =>
      throw _privateConstructorUsedError;
}
