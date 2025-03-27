// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dm_attachments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DMAttachments _$DMAttachmentsFromJson(Map<String, dynamic> json) {
  return _DMAttachments.fromJson(json);
}

/// @nodoc
mixin _$DMAttachments {
  /// List of unique identifiers of media attached to this Tweet. These
  /// identifiers use the same media key format as those returned by the
  /// Media Library.
  ///
  /// You can obtain the expanded object in includes.media by adding
  /// `TweetExpansion.attachmentsMediaKeys` in the request's query parameter.
  List<String> get mediaKeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DMAttachmentsCopyWith<DMAttachments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DMAttachmentsCopyWith<$Res> {
  factory $DMAttachmentsCopyWith(
          DMAttachments value, $Res Function(DMAttachments) then) =
      _$DMAttachmentsCopyWithImpl<$Res, DMAttachments>;
  @useResult
  $Res call({List<String> mediaKeys});
}

/// @nodoc
class _$DMAttachmentsCopyWithImpl<$Res, $Val extends DMAttachments>
    implements $DMAttachmentsCopyWith<$Res> {
  _$DMAttachmentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaKeys = null,
  }) {
    return _then(_value.copyWith(
      mediaKeys: null == mediaKeys
          ? _value.mediaKeys
          : mediaKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DMAttachmentsCopyWith<$Res>
    implements $DMAttachmentsCopyWith<$Res> {
  factory _$$_DMAttachmentsCopyWith(
          _$_DMAttachments value, $Res Function(_$_DMAttachments) then) =
      __$$_DMAttachmentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> mediaKeys});
}

/// @nodoc
class __$$_DMAttachmentsCopyWithImpl<$Res>
    extends _$DMAttachmentsCopyWithImpl<$Res, _$_DMAttachments>
    implements _$$_DMAttachmentsCopyWith<$Res> {
  __$$_DMAttachmentsCopyWithImpl(
      _$_DMAttachments _value, $Res Function(_$_DMAttachments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaKeys = null,
  }) {
    return _then(_$_DMAttachments(
      mediaKeys: null == mediaKeys
          ? _value._mediaKeys
          : mediaKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DMAttachments implements _DMAttachments {
  const _$_DMAttachments({required final List<String> mediaKeys})
      : _mediaKeys = mediaKeys;

  factory _$_DMAttachments.fromJson(Map<String, dynamic> json) =>
      _$$_DMAttachmentsFromJson(json);

  /// List of unique identifiers of media attached to this Tweet. These
  /// identifiers use the same media key format as those returned by the
  /// Media Library.
  ///
  /// You can obtain the expanded object in includes.media by adding
  /// `TweetExpansion.attachmentsMediaKeys` in the request's query parameter.
  final List<String> _mediaKeys;

  /// List of unique identifiers of media attached to this Tweet. These
  /// identifiers use the same media key format as those returned by the
  /// Media Library.
  ///
  /// You can obtain the expanded object in includes.media by adding
  /// `TweetExpansion.attachmentsMediaKeys` in the request's query parameter.
  @override
  List<String> get mediaKeys {
    if (_mediaKeys is EqualUnmodifiableListView) return _mediaKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaKeys);
  }

  @override
  String toString() {
    return 'DMAttachments(mediaKeys: $mediaKeys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DMAttachments &&
            const DeepCollectionEquality()
                .equals(other._mediaKeys, _mediaKeys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mediaKeys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DMAttachmentsCopyWith<_$_DMAttachments> get copyWith =>
      __$$_DMAttachmentsCopyWithImpl<_$_DMAttachments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DMAttachmentsToJson(
      this,
    );
  }
}

abstract class _DMAttachments implements DMAttachments {
  const factory _DMAttachments({required final List<String> mediaKeys}) =
      _$_DMAttachments;

  factory _DMAttachments.fromJson(Map<String, dynamic> json) =
      _$_DMAttachments.fromJson;

  @override

  /// List of unique identifiers of media attached to this Tweet. These
  /// identifiers use the same media key format as those returned by the
  /// Media Library.
  ///
  /// You can obtain the expanded object in includes.media by adding
  /// `TweetExpansion.attachmentsMediaKeys` in the request's query parameter.
  List<String> get mediaKeys;
  @override
  @JsonKey(ignore: true)
  _$$_DMAttachmentsCopyWith<_$_DMAttachments> get copyWith =>
      throw _privateConstructorUsedError;
}
