// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dm_event_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DMEventMeta _$DMEventMetaFromJson(Map<String, dynamic> json) {
  return _DMEventMeta.fromJson(json);
}

/// @nodoc
mixin _$DMEventMeta {
  /// The number of results in the current page.
  int get resultCount => throw _privateConstructorUsedError;

  /// A value that encodes the next 'page' of results that can be requested,
  /// via the `pagination_token` request parameter.
  String? get nextToken => throw _privateConstructorUsedError;

  /// A value that encodes the previous 'page' of results that can be
  /// requested, via the `pagination_token` request parameter.
  String? get previousToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DMEventMetaCopyWith<DMEventMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DMEventMetaCopyWith<$Res> {
  factory $DMEventMetaCopyWith(
          DMEventMeta value, $Res Function(DMEventMeta) then) =
      _$DMEventMetaCopyWithImpl<$Res, DMEventMeta>;
  @useResult
  $Res call({int resultCount, String? nextToken, String? previousToken});
}

/// @nodoc
class _$DMEventMetaCopyWithImpl<$Res, $Val extends DMEventMeta>
    implements $DMEventMetaCopyWith<$Res> {
  _$DMEventMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCount = null,
    Object? nextToken = freezed,
    Object? previousToken = freezed,
  }) {
    return _then(_value.copyWith(
      resultCount: null == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int,
      nextToken: freezed == nextToken
          ? _value.nextToken
          : nextToken // ignore: cast_nullable_to_non_nullable
              as String?,
      previousToken: freezed == previousToken
          ? _value.previousToken
          : previousToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DMEventMetaCopyWith<$Res>
    implements $DMEventMetaCopyWith<$Res> {
  factory _$$_DMEventMetaCopyWith(
          _$_DMEventMeta value, $Res Function(_$_DMEventMeta) then) =
      __$$_DMEventMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int resultCount, String? nextToken, String? previousToken});
}

/// @nodoc
class __$$_DMEventMetaCopyWithImpl<$Res>
    extends _$DMEventMetaCopyWithImpl<$Res, _$_DMEventMeta>
    implements _$$_DMEventMetaCopyWith<$Res> {
  __$$_DMEventMetaCopyWithImpl(
      _$_DMEventMeta _value, $Res Function(_$_DMEventMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCount = null,
    Object? nextToken = freezed,
    Object? previousToken = freezed,
  }) {
    return _then(_$_DMEventMeta(
      resultCount: null == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int,
      nextToken: freezed == nextToken
          ? _value.nextToken
          : nextToken // ignore: cast_nullable_to_non_nullable
              as String?,
      previousToken: freezed == previousToken
          ? _value.previousToken
          : previousToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_DMEventMeta implements _DMEventMeta {
  const _$_DMEventMeta(
      {required this.resultCount, this.nextToken, this.previousToken});

  factory _$_DMEventMeta.fromJson(Map<String, dynamic> json) =>
      _$$_DMEventMetaFromJson(json);

  /// The number of results in the current page.
  @override
  final int resultCount;

  /// A value that encodes the next 'page' of results that can be requested,
  /// via the `pagination_token` request parameter.
  @override
  final String? nextToken;

  /// A value that encodes the previous 'page' of results that can be
  /// requested, via the `pagination_token` request parameter.
  @override
  final String? previousToken;

  @override
  String toString() {
    return 'DMEventMeta(resultCount: $resultCount, nextToken: $nextToken, previousToken: $previousToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DMEventMeta &&
            (identical(other.resultCount, resultCount) ||
                other.resultCount == resultCount) &&
            (identical(other.nextToken, nextToken) ||
                other.nextToken == nextToken) &&
            (identical(other.previousToken, previousToken) ||
                other.previousToken == previousToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, resultCount, nextToken, previousToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DMEventMetaCopyWith<_$_DMEventMeta> get copyWith =>
      __$$_DMEventMetaCopyWithImpl<_$_DMEventMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DMEventMetaToJson(
      this,
    );
  }
}

abstract class _DMEventMeta implements DMEventMeta {
  const factory _DMEventMeta(
      {required final int resultCount,
      final String? nextToken,
      final String? previousToken}) = _$_DMEventMeta;

  factory _DMEventMeta.fromJson(Map<String, dynamic> json) =
      _$_DMEventMeta.fromJson;

  @override

  /// The number of results in the current page.
  int get resultCount;
  @override

  /// A value that encodes the next 'page' of results that can be requested,
  /// via the `pagination_token` request parameter.
  String? get nextToken;
  @override

  /// A value that encodes the previous 'page' of results that can be
  /// requested, via the `pagination_token` request parameter.
  String? get previousToken;
  @override
  @JsonKey(ignore: true)
  _$$_DMEventMetaCopyWith<_$_DMEventMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
