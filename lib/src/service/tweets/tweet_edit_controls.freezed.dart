// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_edit_controls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TweetEditControls _$TweetEditControlsFromJson(Map<String, dynamic> json) {
  return _TweetEditControls.fromJson(json);
}

/// @nodoc
mixin _$TweetEditControls {
  /// A flag indicating whether the tweet is editable or not.
  ///
  /// Editable Tweets can be edited for the first 30 minutes after creation.
  @JsonKey(name: 'is_edit_eligible')
  bool get isEditable => throw _privateConstructorUsedError;

  /// A number indicating how many more tweets will be allowed to be edited.
  ///
  /// Tweet can be edited up to 5 times.
  @JsonKey(name: 'edits_remaining')
  int get remainingCount => throw _privateConstructorUsedError;

  /// Indicates when the permission to edit tweets will expire.
  @JsonKey(name: 'editable_until')
  DateTime get expireAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetEditControlsCopyWith<TweetEditControls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetEditControlsCopyWith<$Res> {
  factory $TweetEditControlsCopyWith(
          TweetEditControls value, $Res Function(TweetEditControls) then) =
      _$TweetEditControlsCopyWithImpl<$Res, TweetEditControls>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_edit_eligible') bool isEditable,
      @JsonKey(name: 'edits_remaining') int remainingCount,
      @JsonKey(name: 'editable_until') DateTime expireAt});
}

/// @nodoc
class _$TweetEditControlsCopyWithImpl<$Res, $Val extends TweetEditControls>
    implements $TweetEditControlsCopyWith<$Res> {
  _$TweetEditControlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditable = null,
    Object? remainingCount = null,
    Object? expireAt = null,
  }) {
    return _then(_value.copyWith(
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingCount: null == remainingCount
          ? _value.remainingCount
          : remainingCount // ignore: cast_nullable_to_non_nullable
              as int,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TweetEditControlsCopyWith<$Res>
    implements $TweetEditControlsCopyWith<$Res> {
  factory _$$_TweetEditControlsCopyWith(_$_TweetEditControls value,
          $Res Function(_$_TweetEditControls) then) =
      __$$_TweetEditControlsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_edit_eligible') bool isEditable,
      @JsonKey(name: 'edits_remaining') int remainingCount,
      @JsonKey(name: 'editable_until') DateTime expireAt});
}

/// @nodoc
class __$$_TweetEditControlsCopyWithImpl<$Res>
    extends _$TweetEditControlsCopyWithImpl<$Res, _$_TweetEditControls>
    implements _$$_TweetEditControlsCopyWith<$Res> {
  __$$_TweetEditControlsCopyWithImpl(
      _$_TweetEditControls _value, $Res Function(_$_TweetEditControls) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditable = null,
    Object? remainingCount = null,
    Object? expireAt = null,
  }) {
    return _then(_$_TweetEditControls(
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingCount: null == remainingCount
          ? _value.remainingCount
          : remainingCount // ignore: cast_nullable_to_non_nullable
              as int,
      expireAt: null == expireAt
          ? _value.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TweetEditControls implements _TweetEditControls {
  const _$_TweetEditControls(
      {@JsonKey(name: 'is_edit_eligible') required this.isEditable,
      @JsonKey(name: 'edits_remaining') required this.remainingCount,
      @JsonKey(name: 'editable_until') required this.expireAt});

  factory _$_TweetEditControls.fromJson(Map<String, dynamic> json) =>
      _$$_TweetEditControlsFromJson(json);

  /// A flag indicating whether the tweet is editable or not.
  ///
  /// Editable Tweets can be edited for the first 30 minutes after creation.
  @override
  @JsonKey(name: 'is_edit_eligible')
  final bool isEditable;

  /// A number indicating how many more tweets will be allowed to be edited.
  ///
  /// Tweet can be edited up to 5 times.
  @override
  @JsonKey(name: 'edits_remaining')
  final int remainingCount;

  /// Indicates when the permission to edit tweets will expire.
  @override
  @JsonKey(name: 'editable_until')
  final DateTime expireAt;

  @override
  String toString() {
    return 'TweetEditControls(isEditable: $isEditable, remainingCount: $remainingCount, expireAt: $expireAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TweetEditControls &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.remainingCount, remainingCount) ||
                other.remainingCount == remainingCount) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isEditable, remainingCount, expireAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetEditControlsCopyWith<_$_TweetEditControls> get copyWith =>
      __$$_TweetEditControlsCopyWithImpl<_$_TweetEditControls>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetEditControlsToJson(
      this,
    );
  }
}

abstract class _TweetEditControls implements TweetEditControls {
  const factory _TweetEditControls(
          {@JsonKey(name: 'is_edit_eligible') required final bool isEditable,
          @JsonKey(name: 'edits_remaining') required final int remainingCount,
          @JsonKey(name: 'editable_until') required final DateTime expireAt}) =
      _$_TweetEditControls;

  factory _TweetEditControls.fromJson(Map<String, dynamic> json) =
      _$_TweetEditControls.fromJson;

  @override

  /// A flag indicating whether the tweet is editable or not.
  ///
  /// Editable Tweets can be edited for the first 30 minutes after creation.
  @JsonKey(name: 'is_edit_eligible')
  bool get isEditable;
  @override

  /// A number indicating how many more tweets will be allowed to be edited.
  ///
  /// Tweet can be edited up to 5 times.
  @JsonKey(name: 'edits_remaining')
  int get remainingCount;
  @override

  /// Indicates when the permission to edit tweets will expire.
  @JsonKey(name: 'editable_until')
  DateTime get expireAt;
  @override
  @JsonKey(ignore: true)
  _$$_TweetEditControlsCopyWith<_$_TweetEditControls> get copyWith =>
      throw _privateConstructorUsedError;
}
