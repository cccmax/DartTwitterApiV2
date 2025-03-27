// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploaded_media_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadedMediaData _$UploadedMediaDataFromJson(Map<String, dynamic> json) {
  return _UploadedMediaData.fromJson(json);
}

/// @nodoc
mixin _$UploadedMediaData {
  /// The identifier for the uploaded media.
  @JsonKey(name: 'media_id_string')
  String get id => throw _privateConstructorUsedError;

  /// The date and time this media will expire.
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// The locale of this media.
  ///
  /// This field is only set if a .srt file is uploaded.
  Locale? get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadedMediaDataCopyWith<UploadedMediaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedMediaDataCopyWith<$Res> {
  factory $UploadedMediaDataCopyWith(
          UploadedMediaData value, $Res Function(UploadedMediaData) then) =
      _$UploadedMediaDataCopyWithImpl<$Res, UploadedMediaData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'media_id_string') String id,
      DateTime expiresAt,
      Locale? locale});

  $LocaleCopyWith<$Res>? get locale;
}

/// @nodoc
class _$UploadedMediaDataCopyWithImpl<$Res, $Val extends UploadedMediaData>
    implements $UploadedMediaDataCopyWith<$Res> {
  _$UploadedMediaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? expiresAt = null,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocaleCopyWith<$Res>? get locale {
    if (_value.locale == null) {
      return null;
    }

    return $LocaleCopyWith<$Res>(_value.locale!, (value) {
      return _then(_value.copyWith(locale: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UploadedMediaDataCopyWith<$Res>
    implements $UploadedMediaDataCopyWith<$Res> {
  factory _$$_UploadedMediaDataCopyWith(_$_UploadedMediaData value,
          $Res Function(_$_UploadedMediaData) then) =
      __$$_UploadedMediaDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'media_id_string') String id,
      DateTime expiresAt,
      Locale? locale});

  @override
  $LocaleCopyWith<$Res>? get locale;
}

/// @nodoc
class __$$_UploadedMediaDataCopyWithImpl<$Res>
    extends _$UploadedMediaDataCopyWithImpl<$Res, _$_UploadedMediaData>
    implements _$$_UploadedMediaDataCopyWith<$Res> {
  __$$_UploadedMediaDataCopyWithImpl(
      _$_UploadedMediaData _value, $Res Function(_$_UploadedMediaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? expiresAt = null,
    Object? locale = freezed,
  }) {
    return _then(_$_UploadedMediaData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_UploadedMediaData implements _UploadedMediaData {
  const _$_UploadedMediaData(
      {@JsonKey(name: 'media_id_string') required this.id,
      required this.expiresAt,
      this.locale});

  factory _$_UploadedMediaData.fromJson(Map<String, dynamic> json) =>
      _$$_UploadedMediaDataFromJson(json);

  /// The identifier for the uploaded media.
  @override
  @JsonKey(name: 'media_id_string')
  final String id;

  /// The date and time this media will expire.
  @override
  final DateTime expiresAt;

  /// The locale of this media.
  ///
  /// This field is only set if a .srt file is uploaded.
  @override
  final Locale? locale;

  @override
  String toString() {
    return 'UploadedMediaData(id: $id, expiresAt: $expiresAt, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadedMediaData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, expiresAt, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadedMediaDataCopyWith<_$_UploadedMediaData> get copyWith =>
      __$$_UploadedMediaDataCopyWithImpl<_$_UploadedMediaData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadedMediaDataToJson(
      this,
    );
  }
}

abstract class _UploadedMediaData implements UploadedMediaData {
  const factory _UploadedMediaData(
      {@JsonKey(name: 'media_id_string') required final String id,
      required final DateTime expiresAt,
      final Locale? locale}) = _$_UploadedMediaData;

  factory _UploadedMediaData.fromJson(Map<String, dynamic> json) =
      _$_UploadedMediaData.fromJson;

  @override

  /// The identifier for the uploaded media.
  @JsonKey(name: 'media_id_string')
  String get id;
  @override

  /// The date and time this media will expire.
  DateTime get expiresAt;
  @override

  /// The locale of this media.
  ///
  /// This field is only set if a .srt file is uploaded.
  Locale? get locale;
  @override
  @JsonKey(ignore: true)
  _$$_UploadedMediaDataCopyWith<_$_UploadedMediaData> get copyWith =>
      throw _privateConstructorUsedError;
}
