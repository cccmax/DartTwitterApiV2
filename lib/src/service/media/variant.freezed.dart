// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return _Variant.fromJson(json);
}

/// @nodoc
mixin _$Variant {
  /// The number of bit rates in the content.
  ///
  /// It may be null when content type is `application/x-mpegURL`.
  int? get bitRate => throw _privateConstructorUsedError;

  /// The content type.
  String get contentType => throw _privateConstructorUsedError;

  /// The url to the content.
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantCopyWith<Variant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) then) =
      _$VariantCopyWithImpl<$Res, Variant>;
  @useResult
  $Res call({int? bitRate, String contentType, String url});
}

/// @nodoc
class _$VariantCopyWithImpl<$Res, $Val extends Variant>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitRate = freezed,
    Object? contentType = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$$_VariantCopyWith(
          _$_Variant value, $Res Function(_$_Variant) then) =
      __$$_VariantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? bitRate, String contentType, String url});
}

/// @nodoc
class __$$_VariantCopyWithImpl<$Res>
    extends _$VariantCopyWithImpl<$Res, _$_Variant>
    implements _$$_VariantCopyWith<$Res> {
  __$$_VariantCopyWithImpl(_$_Variant _value, $Res Function(_$_Variant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitRate = freezed,
    Object? contentType = null,
    Object? url = null,
  }) {
    return _then(_$_Variant(
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_Variant implements _Variant {
  const _$_Variant(
      {this.bitRate, required this.contentType, required this.url});

  factory _$_Variant.fromJson(Map<String, dynamic> json) =>
      _$$_VariantFromJson(json);

  /// The number of bit rates in the content.
  ///
  /// It may be null when content type is `application/x-mpegURL`.
  @override
  final int? bitRate;

  /// The content type.
  @override
  final String contentType;

  /// The url to the content.
  @override
  final String url;

  @override
  String toString() {
    return 'Variant(bitRate: $bitRate, contentType: $contentType, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Variant &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bitRate, contentType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VariantCopyWith<_$_Variant> get copyWith =>
      __$$_VariantCopyWithImpl<_$_Variant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VariantToJson(
      this,
    );
  }
}

abstract class _Variant implements Variant {
  const factory _Variant(
      {final int? bitRate,
      required final String contentType,
      required final String url}) = _$_Variant;

  factory _Variant.fromJson(Map<String, dynamic> json) = _$_Variant.fromJson;

  @override

  /// The number of bit rates in the content.
  ///
  /// It may be null when content type is `application/x-mpegURL`.
  int? get bitRate;
  @override

  /// The content type.
  String get contentType;
  @override

  /// The url to the content.
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_VariantCopyWith<_$_Variant> get copyWith =>
      throw _privateConstructorUsedError;
}
