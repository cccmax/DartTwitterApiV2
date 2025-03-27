// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MuteStateData _$MuteStateDataFromJson(Map<String, dynamic> json) {
  return _MuteStateData.fromJson(json);
}

/// @nodoc
mixin _$MuteStateData {
  /// Indicates whether the user is muting the specified user as a result of
  /// this request.
  ///
  /// The returned value is `false` for a successful unmute request.
  @JsonKey(name: 'muting')
  bool get isMuting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuteStateDataCopyWith<MuteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuteStateDataCopyWith<$Res> {
  factory $MuteStateDataCopyWith(
          MuteStateData value, $Res Function(MuteStateData) then) =
      _$MuteStateDataCopyWithImpl<$Res, MuteStateData>;
  @useResult
  $Res call({@JsonKey(name: 'muting') bool isMuting});
}

/// @nodoc
class _$MuteStateDataCopyWithImpl<$Res, $Val extends MuteStateData>
    implements $MuteStateDataCopyWith<$Res> {
  _$MuteStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMuting = null,
  }) {
    return _then(_value.copyWith(
      isMuting: null == isMuting
          ? _value.isMuting
          : isMuting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MuteStateDataCopyWith<$Res>
    implements $MuteStateDataCopyWith<$Res> {
  factory _$$_MuteStateDataCopyWith(
          _$_MuteStateData value, $Res Function(_$_MuteStateData) then) =
      __$$_MuteStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'muting') bool isMuting});
}

/// @nodoc
class __$$_MuteStateDataCopyWithImpl<$Res>
    extends _$MuteStateDataCopyWithImpl<$Res, _$_MuteStateData>
    implements _$$_MuteStateDataCopyWith<$Res> {
  __$$_MuteStateDataCopyWithImpl(
      _$_MuteStateData _value, $Res Function(_$_MuteStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMuting = null,
  }) {
    return _then(_$_MuteStateData(
      isMuting: null == isMuting
          ? _value.isMuting
          : isMuting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MuteStateData implements _MuteStateData {
  const _$_MuteStateData({@JsonKey(name: 'muting') required this.isMuting});

  factory _$_MuteStateData.fromJson(Map<String, dynamic> json) =>
      _$$_MuteStateDataFromJson(json);

  /// Indicates whether the user is muting the specified user as a result of
  /// this request.
  ///
  /// The returned value is `false` for a successful unmute request.
  @override
  @JsonKey(name: 'muting')
  final bool isMuting;

  @override
  String toString() {
    return 'MuteStateData(isMuting: $isMuting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MuteStateData &&
            (identical(other.isMuting, isMuting) ||
                other.isMuting == isMuting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isMuting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MuteStateDataCopyWith<_$_MuteStateData> get copyWith =>
      __$$_MuteStateDataCopyWithImpl<_$_MuteStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MuteStateDataToJson(
      this,
    );
  }
}

abstract class _MuteStateData implements MuteStateData {
  const factory _MuteStateData(
          {@JsonKey(name: 'muting') required final bool isMuting}) =
      _$_MuteStateData;

  factory _MuteStateData.fromJson(Map<String, dynamic> json) =
      _$_MuteStateData.fromJson;

  @override

  /// Indicates whether the user is muting the specified user as a result of
  /// this request.
  ///
  /// The returned value is `false` for a successful unmute request.
  @JsonKey(name: 'muting')
  bool get isMuting;
  @override
  @JsonKey(ignore: true)
  _$$_MuteStateDataCopyWith<_$_MuteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
