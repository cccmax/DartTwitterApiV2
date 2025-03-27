// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Url _$UrlFromJson(Map<String, dynamic> json) {
  return _Url.fromJson(json);
}

/// @nodoc
mixin _$Url {
  /// The start position (zero-based) of the recognized URL within the object.
  /// All start indices are inclusive.
  int get start => throw _privateConstructorUsedError;

  /// The end position (zero-based) of the recognized URL within the object.
  /// This end index is exclusive.
  int get end => throw _privateConstructorUsedError;

  /// The URL in the format posted by the user.
  String get url => throw _privateConstructorUsedError;

  /// The fully resolved URL.
  String get expandedUrl => throw _privateConstructorUsedError;

  /// The URL as displayed in the Twitter client.
  String get displayUrl => throw _privateConstructorUsedError;

  /// The full destination URL.
  String? get unwoundUrl => throw _privateConstructorUsedError;

  /// The unique key to the media.
  String? get mediaKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UrlCopyWith<Url> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlCopyWith<$Res> {
  factory $UrlCopyWith(Url value, $Res Function(Url) then) =
      _$UrlCopyWithImpl<$Res, Url>;
  @useResult
  $Res call(
      {int start,
      int end,
      String url,
      String expandedUrl,
      String displayUrl,
      String? unwoundUrl,
      String? mediaKey});
}

/// @nodoc
class _$UrlCopyWithImpl<$Res, $Val extends Url> implements $UrlCopyWith<$Res> {
  _$UrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? url = null,
    Object? expandedUrl = null,
    Object? displayUrl = null,
    Object? unwoundUrl = freezed,
    Object? mediaKey = freezed,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      expandedUrl: null == expandedUrl
          ? _value.expandedUrl
          : expandedUrl // ignore: cast_nullable_to_non_nullable
              as String,
      displayUrl: null == displayUrl
          ? _value.displayUrl
          : displayUrl // ignore: cast_nullable_to_non_nullable
              as String,
      unwoundUrl: freezed == unwoundUrl
          ? _value.unwoundUrl
          : unwoundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UrlCopyWith<$Res> implements $UrlCopyWith<$Res> {
  factory _$$_UrlCopyWith(_$_Url value, $Res Function(_$_Url) then) =
      __$$_UrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int start,
      int end,
      String url,
      String expandedUrl,
      String displayUrl,
      String? unwoundUrl,
      String? mediaKey});
}

/// @nodoc
class __$$_UrlCopyWithImpl<$Res> extends _$UrlCopyWithImpl<$Res, _$_Url>
    implements _$$_UrlCopyWith<$Res> {
  __$$_UrlCopyWithImpl(_$_Url _value, $Res Function(_$_Url) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? url = null,
    Object? expandedUrl = null,
    Object? displayUrl = null,
    Object? unwoundUrl = freezed,
    Object? mediaKey = freezed,
  }) {
    return _then(_$_Url(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      expandedUrl: null == expandedUrl
          ? _value.expandedUrl
          : expandedUrl // ignore: cast_nullable_to_non_nullable
              as String,
      displayUrl: null == displayUrl
          ? _value.displayUrl
          : displayUrl // ignore: cast_nullable_to_non_nullable
              as String,
      unwoundUrl: freezed == unwoundUrl
          ? _value.unwoundUrl
          : unwoundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_Url implements _Url {
  const _$_Url(
      {required this.start,
      required this.end,
      required this.url,
      required this.expandedUrl,
      required this.displayUrl,
      this.unwoundUrl,
      this.mediaKey});

  factory _$_Url.fromJson(Map<String, dynamic> json) => _$$_UrlFromJson(json);

  /// The start position (zero-based) of the recognized URL within the object.
  /// All start indices are inclusive.
  @override
  final int start;

  /// The end position (zero-based) of the recognized URL within the object.
  /// This end index is exclusive.
  @override
  final int end;

  /// The URL in the format posted by the user.
  @override
  final String url;

  /// The fully resolved URL.
  @override
  final String expandedUrl;

  /// The URL as displayed in the Twitter client.
  @override
  final String displayUrl;

  /// The full destination URL.
  @override
  final String? unwoundUrl;

  /// The unique key to the media.
  @override
  final String? mediaKey;

  @override
  String toString() {
    return 'Url(start: $start, end: $end, url: $url, expandedUrl: $expandedUrl, displayUrl: $displayUrl, unwoundUrl: $unwoundUrl, mediaKey: $mediaKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Url &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.expandedUrl, expandedUrl) ||
                other.expandedUrl == expandedUrl) &&
            (identical(other.displayUrl, displayUrl) ||
                other.displayUrl == displayUrl) &&
            (identical(other.unwoundUrl, unwoundUrl) ||
                other.unwoundUrl == unwoundUrl) &&
            (identical(other.mediaKey, mediaKey) ||
                other.mediaKey == mediaKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, url, expandedUrl,
      displayUrl, unwoundUrl, mediaKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UrlCopyWith<_$_Url> get copyWith =>
      __$$_UrlCopyWithImpl<_$_Url>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UrlToJson(
      this,
    );
  }
}

abstract class _Url implements Url {
  const factory _Url(
      {required final int start,
      required final int end,
      required final String url,
      required final String expandedUrl,
      required final String displayUrl,
      final String? unwoundUrl,
      final String? mediaKey}) = _$_Url;

  factory _Url.fromJson(Map<String, dynamic> json) = _$_Url.fromJson;

  @override

  /// The start position (zero-based) of the recognized URL within the object.
  /// All start indices are inclusive.
  int get start;
  @override

  /// The end position (zero-based) of the recognized URL within the object.
  /// This end index is exclusive.
  int get end;
  @override

  /// The URL in the format posted by the user.
  String get url;
  @override

  /// The fully resolved URL.
  String get expandedUrl;
  @override

  /// The URL as displayed in the Twitter client.
  String get displayUrl;
  @override

  /// The full destination URL.
  String? get unwoundUrl;
  @override

  /// The unique key to the media.
  String? get mediaKey;
  @override
  @JsonKey(ignore: true)
  _$$_UrlCopyWith<_$_Url> get copyWith => throw _privateConstructorUsedError;
}
