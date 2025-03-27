// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteStateData _$DeleteStateDataFromJson(Map<String, dynamic> json) {
  return _DeleteStateData.fromJson(json);
}

/// @nodoc
mixin _$DeleteStateData {
  /// Indicates whether the content specified in the request has been deleted.
  @JsonKey(name: 'deleted')
  bool get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteStateDataCopyWith<DeleteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteStateDataCopyWith<$Res> {
  factory $DeleteStateDataCopyWith(
          DeleteStateData value, $Res Function(DeleteStateData) then) =
      _$DeleteStateDataCopyWithImpl<$Res, DeleteStateData>;
  @useResult
  $Res call({@JsonKey(name: 'deleted') bool isDeleted});
}

/// @nodoc
class _$DeleteStateDataCopyWithImpl<$Res, $Val extends DeleteStateData>
    implements $DeleteStateDataCopyWith<$Res> {
  _$DeleteStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeleteStateDataCopyWith<$Res>
    implements $DeleteStateDataCopyWith<$Res> {
  factory _$$_DeleteStateDataCopyWith(
          _$_DeleteStateData value, $Res Function(_$_DeleteStateData) then) =
      __$$_DeleteStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'deleted') bool isDeleted});
}

/// @nodoc
class __$$_DeleteStateDataCopyWithImpl<$Res>
    extends _$DeleteStateDataCopyWithImpl<$Res, _$_DeleteStateData>
    implements _$$_DeleteStateDataCopyWith<$Res> {
  __$$_DeleteStateDataCopyWithImpl(
      _$_DeleteStateData _value, $Res Function(_$_DeleteStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDeleted = null,
  }) {
    return _then(_$_DeleteStateData(
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeleteStateData implements _DeleteStateData {
  const _$_DeleteStateData({@JsonKey(name: 'deleted') required this.isDeleted});

  factory _$_DeleteStateData.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteStateDataFromJson(json);

  /// Indicates whether the content specified in the request has been deleted.
  @override
  @JsonKey(name: 'deleted')
  final bool isDeleted;

  @override
  String toString() {
    return 'DeleteStateData(isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteStateData &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteStateDataCopyWith<_$_DeleteStateData> get copyWith =>
      __$$_DeleteStateDataCopyWithImpl<_$_DeleteStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteStateDataToJson(
      this,
    );
  }
}

abstract class _DeleteStateData implements DeleteStateData {
  const factory _DeleteStateData(
          {@JsonKey(name: 'deleted') required final bool isDeleted}) =
      _$_DeleteStateData;

  factory _DeleteStateData.fromJson(Map<String, dynamic> json) =
      _$_DeleteStateData.fromJson;

  @override

  /// Indicates whether the content specified in the request has been deleted.
  @JsonKey(name: 'deleted')
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteStateDataCopyWith<_$_DeleteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
