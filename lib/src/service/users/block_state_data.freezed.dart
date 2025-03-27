// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlockStateData _$BlockStateDataFromJson(Map<String, dynamic> json) {
  return _BlockStateData.fromJson(json);
}

/// @nodoc
mixin _$BlockStateData {
  /// Indicates whether the user is blocking the specified user as a result
  /// of this request.
  @JsonKey(name: 'blocking')
  bool get isBlocking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockStateDataCopyWith<BlockStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockStateDataCopyWith<$Res> {
  factory $BlockStateDataCopyWith(
          BlockStateData value, $Res Function(BlockStateData) then) =
      _$BlockStateDataCopyWithImpl<$Res, BlockStateData>;
  @useResult
  $Res call({@JsonKey(name: 'blocking') bool isBlocking});
}

/// @nodoc
class _$BlockStateDataCopyWithImpl<$Res, $Val extends BlockStateData>
    implements $BlockStateDataCopyWith<$Res> {
  _$BlockStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBlocking = null,
  }) {
    return _then(_value.copyWith(
      isBlocking: null == isBlocking
          ? _value.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlockStateDataCopyWith<$Res>
    implements $BlockStateDataCopyWith<$Res> {
  factory _$$_BlockStateDataCopyWith(
          _$_BlockStateData value, $Res Function(_$_BlockStateData) then) =
      __$$_BlockStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'blocking') bool isBlocking});
}

/// @nodoc
class __$$_BlockStateDataCopyWithImpl<$Res>
    extends _$BlockStateDataCopyWithImpl<$Res, _$_BlockStateData>
    implements _$$_BlockStateDataCopyWith<$Res> {
  __$$_BlockStateDataCopyWithImpl(
      _$_BlockStateData _value, $Res Function(_$_BlockStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBlocking = null,
  }) {
    return _then(_$_BlockStateData(
      isBlocking: null == isBlocking
          ? _value.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BlockStateData implements _BlockStateData {
  const _$_BlockStateData(
      {@JsonKey(name: 'blocking') required this.isBlocking});

  factory _$_BlockStateData.fromJson(Map<String, dynamic> json) =>
      _$$_BlockStateDataFromJson(json);

  /// Indicates whether the user is blocking the specified user as a result
  /// of this request.
  @override
  @JsonKey(name: 'blocking')
  final bool isBlocking;

  @override
  String toString() {
    return 'BlockStateData(isBlocking: $isBlocking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockStateData &&
            (identical(other.isBlocking, isBlocking) ||
                other.isBlocking == isBlocking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isBlocking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockStateDataCopyWith<_$_BlockStateData> get copyWith =>
      __$$_BlockStateDataCopyWithImpl<_$_BlockStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlockStateDataToJson(
      this,
    );
  }
}

abstract class _BlockStateData implements BlockStateData {
  const factory _BlockStateData(
          {@JsonKey(name: 'blocking') required final bool isBlocking}) =
      _$_BlockStateData;

  factory _BlockStateData.fromJson(Map<String, dynamic> json) =
      _$_BlockStateData.fromJson;

  @override

  /// Indicates whether the user is blocking the specified user as a result
  /// of this request.
  @JsonKey(name: 'blocking')
  bool get isBlocking;
  @override
  @JsonKey(ignore: true)
  _$$_BlockStateDataCopyWith<_$_BlockStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
