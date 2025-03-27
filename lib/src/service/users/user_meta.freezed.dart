// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMeta _$UserMetaFromJson(Map<String, dynamic> json) {
  return _UserMeta.fromJson(json);
}

/// @nodoc
mixin _$UserMeta {
  /// The number of users returned in this request. Note that this number
  /// may be lower than what was specified in the max_results query parameter.
  int get resultCount => throw _privateConstructorUsedError;

  /// Pagination token for the next page of results. This value is returned
  /// when there are multiple pages of results, as the current request may
  /// only return a subset of results. To retrieve the full list, keep passing
  /// the value from this field in the pagination_token query parameter. When
  /// this field is not returned in the response, it means you've reached the
  /// last page of results, and that there are no further pages.
  String? get nextToken => throw _privateConstructorUsedError;

  /// Pagination token for the previous page of results. This value is
  /// returned when there are multiple pages of results, as the current
  /// request may only return a subset of results. To go back to the previous
  /// page, passing the value from this field in the pagination_token query
  /// parameter. When this field is not returned in the response, it means
  /// you are on the first page of results.
  String? get previousToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMetaCopyWith<UserMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMetaCopyWith<$Res> {
  factory $UserMetaCopyWith(UserMeta value, $Res Function(UserMeta) then) =
      _$UserMetaCopyWithImpl<$Res, UserMeta>;
  @useResult
  $Res call({int resultCount, String? nextToken, String? previousToken});
}

/// @nodoc
class _$UserMetaCopyWithImpl<$Res, $Val extends UserMeta>
    implements $UserMetaCopyWith<$Res> {
  _$UserMetaCopyWithImpl(this._value, this._then);

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
abstract class _$$_UserMetaCopyWith<$Res> implements $UserMetaCopyWith<$Res> {
  factory _$$_UserMetaCopyWith(
          _$_UserMeta value, $Res Function(_$_UserMeta) then) =
      __$$_UserMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int resultCount, String? nextToken, String? previousToken});
}

/// @nodoc
class __$$_UserMetaCopyWithImpl<$Res>
    extends _$UserMetaCopyWithImpl<$Res, _$_UserMeta>
    implements _$$_UserMetaCopyWith<$Res> {
  __$$_UserMetaCopyWithImpl(
      _$_UserMeta _value, $Res Function(_$_UserMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultCount = null,
    Object? nextToken = freezed,
    Object? previousToken = freezed,
  }) {
    return _then(_$_UserMeta(
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
class _$_UserMeta implements _UserMeta {
  const _$_UserMeta(
      {required this.resultCount, this.nextToken, this.previousToken});

  factory _$_UserMeta.fromJson(Map<String, dynamic> json) =>
      _$$_UserMetaFromJson(json);

  /// The number of users returned in this request. Note that this number
  /// may be lower than what was specified in the max_results query parameter.
  @override
  final int resultCount;

  /// Pagination token for the next page of results. This value is returned
  /// when there are multiple pages of results, as the current request may
  /// only return a subset of results. To retrieve the full list, keep passing
  /// the value from this field in the pagination_token query parameter. When
  /// this field is not returned in the response, it means you've reached the
  /// last page of results, and that there are no further pages.
  @override
  final String? nextToken;

  /// Pagination token for the previous page of results. This value is
  /// returned when there are multiple pages of results, as the current
  /// request may only return a subset of results. To go back to the previous
  /// page, passing the value from this field in the pagination_token query
  /// parameter. When this field is not returned in the response, it means
  /// you are on the first page of results.
  @override
  final String? previousToken;

  @override
  String toString() {
    return 'UserMeta(resultCount: $resultCount, nextToken: $nextToken, previousToken: $previousToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserMeta &&
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
  _$$_UserMetaCopyWith<_$_UserMeta> get copyWith =>
      __$$_UserMetaCopyWithImpl<_$_UserMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserMetaToJson(
      this,
    );
  }
}

abstract class _UserMeta implements UserMeta {
  const factory _UserMeta(
      {required final int resultCount,
      final String? nextToken,
      final String? previousToken}) = _$_UserMeta;

  factory _UserMeta.fromJson(Map<String, dynamic> json) = _$_UserMeta.fromJson;

  @override

  /// The number of users returned in this request. Note that this number
  /// may be lower than what was specified in the max_results query parameter.
  int get resultCount;
  @override

  /// Pagination token for the next page of results. This value is returned
  /// when there are multiple pages of results, as the current request may
  /// only return a subset of results. To retrieve the full list, keep passing
  /// the value from this field in the pagination_token query parameter. When
  /// this field is not returned in the response, it means you've reached the
  /// last page of results, and that there are no further pages.
  String? get nextToken;
  @override

  /// Pagination token for the previous page of results. This value is
  /// returned when there are multiple pages of results, as the current
  /// request may only return a subset of results. To go back to the previous
  /// page, passing the value from this field in the pagination_token query
  /// parameter. When this field is not returned in the response, it means
  /// you are on the first page of results.
  String? get previousToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserMetaCopyWith<_$_UserMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
