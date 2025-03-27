// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplyStateData _$ReplyStateDataFromJson(Map<String, dynamic> json) {
  return _ReplyStateData.fromJson(json);
}

/// @nodoc
mixin _$ReplyStateData {
  /// Indicates if the Tweet was successfully hidden or unhidden.
  @JsonKey(name: 'hidden')
  bool get isHidden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplyStateDataCopyWith<ReplyStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyStateDataCopyWith<$Res> {
  factory $ReplyStateDataCopyWith(
          ReplyStateData value, $Res Function(ReplyStateData) then) =
      _$ReplyStateDataCopyWithImpl<$Res, ReplyStateData>;
  @useResult
  $Res call({@JsonKey(name: 'hidden') bool isHidden});
}

/// @nodoc
class _$ReplyStateDataCopyWithImpl<$Res, $Val extends ReplyStateData>
    implements $ReplyStateDataCopyWith<$Res> {
  _$ReplyStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
  }) {
    return _then(_value.copyWith(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReplyStateDataCopyWith<$Res>
    implements $ReplyStateDataCopyWith<$Res> {
  factory _$$_ReplyStateDataCopyWith(
          _$_ReplyStateData value, $Res Function(_$_ReplyStateData) then) =
      __$$_ReplyStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'hidden') bool isHidden});
}

/// @nodoc
class __$$_ReplyStateDataCopyWithImpl<$Res>
    extends _$ReplyStateDataCopyWithImpl<$Res, _$_ReplyStateData>
    implements _$$_ReplyStateDataCopyWith<$Res> {
  __$$_ReplyStateDataCopyWithImpl(
      _$_ReplyStateData _value, $Res Function(_$_ReplyStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
  }) {
    return _then(_$_ReplyStateData(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplyStateData implements _ReplyStateData {
  const _$_ReplyStateData({@JsonKey(name: 'hidden') required this.isHidden});

  factory _$_ReplyStateData.fromJson(Map<String, dynamic> json) =>
      _$$_ReplyStateDataFromJson(json);

  /// Indicates if the Tweet was successfully hidden or unhidden.
  @override
  @JsonKey(name: 'hidden')
  final bool isHidden;

  @override
  String toString() {
    return 'ReplyStateData(isHidden: $isHidden)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplyStateData &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isHidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplyStateDataCopyWith<_$_ReplyStateData> get copyWith =>
      __$$_ReplyStateDataCopyWithImpl<_$_ReplyStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplyStateDataToJson(
      this,
    );
  }
}

abstract class _ReplyStateData implements ReplyStateData {
  const factory _ReplyStateData(
          {@JsonKey(name: 'hidden') required final bool isHidden}) =
      _$_ReplyStateData;

  factory _ReplyStateData.fromJson(Map<String, dynamic> json) =
      _$_ReplyStateData.fromJson;

  @override

  /// Indicates if the Tweet was successfully hidden or unhidden.
  @JsonKey(name: 'hidden')
  bool get isHidden;
  @override
  @JsonKey(ignore: true)
  _$$_ReplyStateDataCopyWith<_$_ReplyStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
