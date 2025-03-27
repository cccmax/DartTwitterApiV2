// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberStateData _$MemberStateDataFromJson(Map<String, dynamic> json) {
  return _ListMemberStateData.fromJson(json);
}

/// @nodoc
mixin _$MemberStateData {
  /// Indicates whether the member specified in the request has been added
  /// to the List.
  bool get isMember => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberStateDataCopyWith<MemberStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberStateDataCopyWith<$Res> {
  factory $MemberStateDataCopyWith(
          MemberStateData value, $Res Function(MemberStateData) then) =
      _$MemberStateDataCopyWithImpl<$Res, MemberStateData>;
  @useResult
  $Res call({bool isMember});
}

/// @nodoc
class _$MemberStateDataCopyWithImpl<$Res, $Val extends MemberStateData>
    implements $MemberStateDataCopyWith<$Res> {
  _$MemberStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMember = null,
  }) {
    return _then(_value.copyWith(
      isMember: null == isMember
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListMemberStateDataCopyWith<$Res>
    implements $MemberStateDataCopyWith<$Res> {
  factory _$$_ListMemberStateDataCopyWith(_$_ListMemberStateData value,
          $Res Function(_$_ListMemberStateData) then) =
      __$$_ListMemberStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isMember});
}

/// @nodoc
class __$$_ListMemberStateDataCopyWithImpl<$Res>
    extends _$MemberStateDataCopyWithImpl<$Res, _$_ListMemberStateData>
    implements _$$_ListMemberStateDataCopyWith<$Res> {
  __$$_ListMemberStateDataCopyWithImpl(_$_ListMemberStateData _value,
      $Res Function(_$_ListMemberStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMember = null,
  }) {
    return _then(_$_ListMemberStateData(
      isMember: null == isMember
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListMemberStateData implements _ListMemberStateData {
  const _$_ListMemberStateData({required this.isMember});

  factory _$_ListMemberStateData.fromJson(Map<String, dynamic> json) =>
      _$$_ListMemberStateDataFromJson(json);

  /// Indicates whether the member specified in the request has been added
  /// to the List.
  @override
  final bool isMember;

  @override
  String toString() {
    return 'MemberStateData(isMember: $isMember)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListMemberStateData &&
            (identical(other.isMember, isMember) ||
                other.isMember == isMember));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isMember);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListMemberStateDataCopyWith<_$_ListMemberStateData> get copyWith =>
      __$$_ListMemberStateDataCopyWithImpl<_$_ListMemberStateData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListMemberStateDataToJson(
      this,
    );
  }
}

abstract class _ListMemberStateData implements MemberStateData {
  const factory _ListMemberStateData({required final bool isMember}) =
      _$_ListMemberStateData;

  factory _ListMemberStateData.fromJson(Map<String, dynamic> json) =
      _$_ListMemberStateData.fromJson;

  @override

  /// Indicates whether the member specified in the request has been added
  /// to the List.
  bool get isMember;
  @override
  @JsonKey(ignore: true)
  _$$_ListMemberStateDataCopyWith<_$_ListMemberStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
