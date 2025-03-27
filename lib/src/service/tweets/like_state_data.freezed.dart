// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikeStateData _$LikeStateDataFromJson(Map<String, dynamic> json) {
  return _LikeStateData.fromJson(json);
}

/// @nodoc
mixin _$LikeStateData {
  /// Indicates whether the user likes the specified Tweet
  /// as a result of this request.
  @JsonKey(name: 'liked')
  bool get isLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeStateDataCopyWith<LikeStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeStateDataCopyWith<$Res> {
  factory $LikeStateDataCopyWith(
          LikeStateData value, $Res Function(LikeStateData) then) =
      _$LikeStateDataCopyWithImpl<$Res, LikeStateData>;
  @useResult
  $Res call({@JsonKey(name: 'liked') bool isLiked});
}

/// @nodoc
class _$LikeStateDataCopyWithImpl<$Res, $Val extends LikeStateData>
    implements $LikeStateDataCopyWith<$Res> {
  _$LikeStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikeStateDataCopyWith<$Res>
    implements $LikeStateDataCopyWith<$Res> {
  factory _$$_LikeStateDataCopyWith(
          _$_LikeStateData value, $Res Function(_$_LikeStateData) then) =
      __$$_LikeStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'liked') bool isLiked});
}

/// @nodoc
class __$$_LikeStateDataCopyWithImpl<$Res>
    extends _$LikeStateDataCopyWithImpl<$Res, _$_LikeStateData>
    implements _$$_LikeStateDataCopyWith<$Res> {
  __$$_LikeStateDataCopyWithImpl(
      _$_LikeStateData _value, $Res Function(_$_LikeStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
  }) {
    return _then(_$_LikeStateData(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikeStateData implements _LikeStateData {
  const _$_LikeStateData({@JsonKey(name: 'liked') required this.isLiked});

  factory _$_LikeStateData.fromJson(Map<String, dynamic> json) =>
      _$$_LikeStateDataFromJson(json);

  /// Indicates whether the user likes the specified Tweet
  /// as a result of this request.
  @override
  @JsonKey(name: 'liked')
  final bool isLiked;

  @override
  String toString() {
    return 'LikeStateData(isLiked: $isLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikeStateData &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeStateDataCopyWith<_$_LikeStateData> get copyWith =>
      __$$_LikeStateDataCopyWithImpl<_$_LikeStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeStateDataToJson(
      this,
    );
  }
}

abstract class _LikeStateData implements LikeStateData {
  const factory _LikeStateData(
      {@JsonKey(name: 'liked') required final bool isLiked}) = _$_LikeStateData;

  factory _LikeStateData.fromJson(Map<String, dynamic> json) =
      _$_LikeStateData.fromJson;

  @override

  /// Indicates whether the user likes the specified Tweet
  /// as a result of this request.
  @JsonKey(name: 'liked')
  bool get isLiked;
  @override
  @JsonKey(ignore: true)
  _$$_LikeStateDataCopyWith<_$_LikeStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
