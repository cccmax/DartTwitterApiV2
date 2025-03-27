// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateStateData _$UpdateStateDataFromJson(Map<String, dynamic> json) {
  return _UpdateStateData.fromJson(json);
}

/// @nodoc
mixin _$UpdateStateData {
  /// Indicates whether the content specified in the request has been updated.
  @JsonKey(name: 'updated')
  bool get isUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateStateDataCopyWith<UpdateStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStateDataCopyWith<$Res> {
  factory $UpdateStateDataCopyWith(
          UpdateStateData value, $Res Function(UpdateStateData) then) =
      _$UpdateStateDataCopyWithImpl<$Res, UpdateStateData>;
  @useResult
  $Res call({@JsonKey(name: 'updated') bool isUpdated});
}

/// @nodoc
class _$UpdateStateDataCopyWithImpl<$Res, $Val extends UpdateStateData>
    implements $UpdateStateDataCopyWith<$Res> {
  _$UpdateStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
  }) {
    return _then(_value.copyWith(
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateStateDataCopyWith<$Res>
    implements $UpdateStateDataCopyWith<$Res> {
  factory _$$_UpdateStateDataCopyWith(
          _$_UpdateStateData value, $Res Function(_$_UpdateStateData) then) =
      __$$_UpdateStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'updated') bool isUpdated});
}

/// @nodoc
class __$$_UpdateStateDataCopyWithImpl<$Res>
    extends _$UpdateStateDataCopyWithImpl<$Res, _$_UpdateStateData>
    implements _$$_UpdateStateDataCopyWith<$Res> {
  __$$_UpdateStateDataCopyWithImpl(
      _$_UpdateStateData _value, $Res Function(_$_UpdateStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
  }) {
    return _then(_$_UpdateStateData(
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateStateData implements _UpdateStateData {
  const _$_UpdateStateData({@JsonKey(name: 'updated') required this.isUpdated});

  factory _$_UpdateStateData.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateStateDataFromJson(json);

  /// Indicates whether the content specified in the request has been updated.
  @override
  @JsonKey(name: 'updated')
  final bool isUpdated;

  @override
  String toString() {
    return 'UpdateStateData(isUpdated: $isUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateStateData &&
            (identical(other.isUpdated, isUpdated) ||
                other.isUpdated == isUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateStateDataCopyWith<_$_UpdateStateData> get copyWith =>
      __$$_UpdateStateDataCopyWithImpl<_$_UpdateStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateStateDataToJson(
      this,
    );
  }
}

abstract class _UpdateStateData implements UpdateStateData {
  const factory _UpdateStateData(
          {@JsonKey(name: 'updated') required final bool isUpdated}) =
      _$_UpdateStateData;

  factory _UpdateStateData.fromJson(Map<String, dynamic> json) =
      _$_UpdateStateData.fromJson;

  @override

  /// Indicates whether the content specified in the request has been updated.
  @JsonKey(name: 'updated')
  bool get isUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateStateDataCopyWith<_$_UpdateStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
