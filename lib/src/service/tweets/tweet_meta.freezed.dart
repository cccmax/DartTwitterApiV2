// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TweetMeta _$TweetMetaFromJson(Map<String, dynamic> json) {
  return _TweetMeta.fromJson(json);
}

/// @nodoc
mixin _$TweetMeta {
  /// The Tweet ID of the most recent Tweet returned in the response.
  String? get newestId => throw _privateConstructorUsedError;

  /// The Tweet ID of the oldest Tweet returned in the response.
  String? get oldestId => throw _privateConstructorUsedError;

  /// The number of Tweet results returned in the response.
  int? get resultCount => throw _privateConstructorUsedError;

  /// A value that encodes the next 'page' of results that can be requested,
  /// via the `pagination_token` request parameter.
  String? get nextToken => throw _privateConstructorUsedError;

  /// A value that encodes the previous 'page' of results that can be
  /// requested, via the `pagination_token` request parameter.
  String? get previousToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetMetaCopyWith<TweetMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetMetaCopyWith<$Res> {
  factory $TweetMetaCopyWith(TweetMeta value, $Res Function(TweetMeta) then) =
      _$TweetMetaCopyWithImpl<$Res, TweetMeta>;
  @useResult
  $Res call(
      {String? newestId,
      String? oldestId,
      int? resultCount,
      String? nextToken,
      String? previousToken});
}

/// @nodoc
class _$TweetMetaCopyWithImpl<$Res, $Val extends TweetMeta>
    implements $TweetMetaCopyWith<$Res> {
  _$TweetMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newestId = freezed,
    Object? oldestId = freezed,
    Object? resultCount = freezed,
    Object? nextToken = freezed,
    Object? previousToken = freezed,
  }) {
    return _then(_value.copyWith(
      newestId: freezed == newestId
          ? _value.newestId
          : newestId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestId: freezed == oldestId
          ? _value.oldestId
          : oldestId // ignore: cast_nullable_to_non_nullable
              as String?,
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_TweetMetaCopyWith<$Res> implements $TweetMetaCopyWith<$Res> {
  factory _$$_TweetMetaCopyWith(
          _$_TweetMeta value, $Res Function(_$_TweetMeta) then) =
      __$$_TweetMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? newestId,
      String? oldestId,
      int? resultCount,
      String? nextToken,
      String? previousToken});
}

/// @nodoc
class __$$_TweetMetaCopyWithImpl<$Res>
    extends _$TweetMetaCopyWithImpl<$Res, _$_TweetMeta>
    implements _$$_TweetMetaCopyWith<$Res> {
  __$$_TweetMetaCopyWithImpl(
      _$_TweetMeta _value, $Res Function(_$_TweetMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newestId = freezed,
    Object? oldestId = freezed,
    Object? resultCount = freezed,
    Object? nextToken = freezed,
    Object? previousToken = freezed,
  }) {
    return _then(_$_TweetMeta(
      newestId: freezed == newestId
          ? _value.newestId
          : newestId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestId: freezed == oldestId
          ? _value.oldestId
          : oldestId // ignore: cast_nullable_to_non_nullable
              as String?,
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_TweetMeta implements _TweetMeta {
  const _$_TweetMeta(
      {this.newestId,
      this.oldestId,
      this.resultCount,
      this.nextToken,
      this.previousToken});

  factory _$_TweetMeta.fromJson(Map<String, dynamic> json) =>
      _$$_TweetMetaFromJson(json);

  /// The Tweet ID of the most recent Tweet returned in the response.
  @override
  final String? newestId;

  /// The Tweet ID of the oldest Tweet returned in the response.
  @override
  final String? oldestId;

  /// The number of Tweet results returned in the response.
  @override
  final int? resultCount;

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
    return 'TweetMeta(newestId: $newestId, oldestId: $oldestId, resultCount: $resultCount, nextToken: $nextToken, previousToken: $previousToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TweetMeta &&
            (identical(other.newestId, newestId) ||
                other.newestId == newestId) &&
            (identical(other.oldestId, oldestId) ||
                other.oldestId == oldestId) &&
            (identical(other.resultCount, resultCount) ||
                other.resultCount == resultCount) &&
            (identical(other.nextToken, nextToken) ||
                other.nextToken == nextToken) &&
            (identical(other.previousToken, previousToken) ||
                other.previousToken == previousToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, newestId, oldestId, resultCount, nextToken, previousToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetMetaCopyWith<_$_TweetMeta> get copyWith =>
      __$$_TweetMetaCopyWithImpl<_$_TweetMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetMetaToJson(
      this,
    );
  }
}

abstract class _TweetMeta implements TweetMeta {
  const factory _TweetMeta(
      {final String? newestId,
      final String? oldestId,
      final int? resultCount,
      final String? nextToken,
      final String? previousToken}) = _$_TweetMeta;

  factory _TweetMeta.fromJson(Map<String, dynamic> json) =
      _$_TweetMeta.fromJson;

  @override

  /// The Tweet ID of the most recent Tweet returned in the response.
  String? get newestId;
  @override

  /// The Tweet ID of the oldest Tweet returned in the response.
  String? get oldestId;
  @override

  /// The number of Tweet results returned in the response.
  int? get resultCount;
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
  _$$_TweetMetaCopyWith<_$_TweetMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
