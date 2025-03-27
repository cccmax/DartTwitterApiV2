// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowStateData _$FollowStateDataFromJson(Map<String, dynamic> json) {
  return _FollowStateData.fromJson(json);
}

/// @nodoc
mixin _$FollowStateData {
  /// Indicates whether the user followed the specified List as a result
  /// of the request.
  @JsonKey(name: 'following')
  bool get isFollowing => throw _privateConstructorUsedError;

  /// Indicates whether the target user will need to approve the follow
  /// request.
  ///
  /// Note that the authenticated user will follow the target user only
  /// when they approve the incoming follower request.
  @JsonKey(name: 'pending_follow')
  bool get isPending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowStateDataCopyWith<FollowStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateDataCopyWith<$Res> {
  factory $FollowStateDataCopyWith(
          FollowStateData value, $Res Function(FollowStateData) then) =
      _$FollowStateDataCopyWithImpl<$Res, FollowStateData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'following') bool isFollowing,
      @JsonKey(name: 'pending_follow') bool isPending});
}

/// @nodoc
class _$FollowStateDataCopyWithImpl<$Res, $Val extends FollowStateData>
    implements $FollowStateDataCopyWith<$Res> {
  _$FollowStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowing = null,
    Object? isPending = null,
  }) {
    return _then(_value.copyWith(
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowStateDataCopyWith<$Res>
    implements $FollowStateDataCopyWith<$Res> {
  factory _$$_FollowStateDataCopyWith(
          _$_FollowStateData value, $Res Function(_$_FollowStateData) then) =
      __$$_FollowStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'following') bool isFollowing,
      @JsonKey(name: 'pending_follow') bool isPending});
}

/// @nodoc
class __$$_FollowStateDataCopyWithImpl<$Res>
    extends _$FollowStateDataCopyWithImpl<$Res, _$_FollowStateData>
    implements _$$_FollowStateDataCopyWith<$Res> {
  __$$_FollowStateDataCopyWithImpl(
      _$_FollowStateData _value, $Res Function(_$_FollowStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollowing = null,
    Object? isPending = null,
  }) {
    return _then(_$_FollowStateData(
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FollowStateData implements _FollowStateData {
  const _$_FollowStateData(
      {@JsonKey(name: 'following') required this.isFollowing,
      @JsonKey(name: 'pending_follow') this.isPending = false});

  factory _$_FollowStateData.fromJson(Map<String, dynamic> json) =>
      _$$_FollowStateDataFromJson(json);

  /// Indicates whether the user followed the specified List as a result
  /// of the request.
  @override
  @JsonKey(name: 'following')
  final bool isFollowing;

  /// Indicates whether the target user will need to approve the follow
  /// request.
  ///
  /// Note that the authenticated user will follow the target user only
  /// when they approve the incoming follower request.
  @override
  @JsonKey(name: 'pending_follow')
  final bool isPending;

  @override
  String toString() {
    return 'FollowStateData(isFollowing: $isFollowing, isPending: $isPending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowStateData &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFollowing, isPending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowStateDataCopyWith<_$_FollowStateData> get copyWith =>
      __$$_FollowStateDataCopyWithImpl<_$_FollowStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowStateDataToJson(
      this,
    );
  }
}

abstract class _FollowStateData implements FollowStateData {
  const factory _FollowStateData(
          {@JsonKey(name: 'following') required final bool isFollowing,
          @JsonKey(name: 'pending_follow') final bool isPending}) =
      _$_FollowStateData;

  factory _FollowStateData.fromJson(Map<String, dynamic> json) =
      _$_FollowStateData.fromJson;

  @override

  /// Indicates whether the user followed the specified List as a result
  /// of the request.
  @JsonKey(name: 'following')
  bool get isFollowing;
  @override

  /// Indicates whether the target user will need to approve the follow
  /// request.
  ///
  /// Note that the authenticated user will follow the target user only
  /// when they approve the incoming follower request.
  @JsonKey(name: 'pending_follow')
  bool get isPending;
  @override
  @JsonKey(ignore: true)
  _$$_FollowStateDataCopyWith<_$_FollowStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
