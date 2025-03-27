// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pinned_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PinnedStateData _$PinnedStateDataFromJson(Map<String, dynamic> json) {
  return _PinnedStateData.fromJson(json);
}

/// @nodoc
mixin _$PinnedStateData {
  /// Indicates whether the user pinned the specified List as a result
  /// of the request.
  @JsonKey(name: 'pinned')
  bool get isPinned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinnedStateDataCopyWith<PinnedStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinnedStateDataCopyWith<$Res> {
  factory $PinnedStateDataCopyWith(
          PinnedStateData value, $Res Function(PinnedStateData) then) =
      _$PinnedStateDataCopyWithImpl<$Res, PinnedStateData>;
  @useResult
  $Res call({@JsonKey(name: 'pinned') bool isPinned});
}

/// @nodoc
class _$PinnedStateDataCopyWithImpl<$Res, $Val extends PinnedStateData>
    implements $PinnedStateDataCopyWith<$Res> {
  _$PinnedStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinned = null,
  }) {
    return _then(_value.copyWith(
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PinnedStateDataCopyWith<$Res>
    implements $PinnedStateDataCopyWith<$Res> {
  factory _$$_PinnedStateDataCopyWith(
          _$_PinnedStateData value, $Res Function(_$_PinnedStateData) then) =
      __$$_PinnedStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pinned') bool isPinned});
}

/// @nodoc
class __$$_PinnedStateDataCopyWithImpl<$Res>
    extends _$PinnedStateDataCopyWithImpl<$Res, _$_PinnedStateData>
    implements _$$_PinnedStateDataCopyWith<$Res> {
  __$$_PinnedStateDataCopyWithImpl(
      _$_PinnedStateData _value, $Res Function(_$_PinnedStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinned = null,
  }) {
    return _then(_$_PinnedStateData(
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PinnedStateData implements _PinnedStateData {
  const _$_PinnedStateData({@JsonKey(name: 'pinned') required this.isPinned});

  factory _$_PinnedStateData.fromJson(Map<String, dynamic> json) =>
      _$$_PinnedStateDataFromJson(json);

  /// Indicates whether the user pinned the specified List as a result
  /// of the request.
  @override
  @JsonKey(name: 'pinned')
  final bool isPinned;

  @override
  String toString() {
    return 'PinnedStateData(isPinned: $isPinned)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PinnedStateData &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isPinned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PinnedStateDataCopyWith<_$_PinnedStateData> get copyWith =>
      __$$_PinnedStateDataCopyWithImpl<_$_PinnedStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PinnedStateDataToJson(
      this,
    );
  }
}

abstract class _PinnedStateData implements PinnedStateData {
  const factory _PinnedStateData(
          {@JsonKey(name: 'pinned') required final bool isPinned}) =
      _$_PinnedStateData;

  factory _PinnedStateData.fromJson(Map<String, dynamic> json) =
      _$_PinnedStateData.fromJson;

  @override

  /// Indicates whether the user pinned the specified List as a result
  /// of the request.
  @JsonKey(name: 'pinned')
  bool get isPinned;
  @override
  @JsonKey(ignore: true)
  _$$_PinnedStateDataCopyWith<_$_PinnedStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
