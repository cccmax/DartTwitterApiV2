// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retweet_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RetweetStateData _$RetweetStateDataFromJson(Map<String, dynamic> json) {
  return _RetweetStateData.fromJson(json);
}

/// @nodoc
mixin _$RetweetStateData {
  /// Indicates whether the user Retweets the specified Tweet as a result
  /// of this request.
  @JsonKey(name: 'retweeted')
  bool get isRetweeted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RetweetStateDataCopyWith<RetweetStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetweetStateDataCopyWith<$Res> {
  factory $RetweetStateDataCopyWith(
          RetweetStateData value, $Res Function(RetweetStateData) then) =
      _$RetweetStateDataCopyWithImpl<$Res, RetweetStateData>;
  @useResult
  $Res call({@JsonKey(name: 'retweeted') bool isRetweeted});
}

/// @nodoc
class _$RetweetStateDataCopyWithImpl<$Res, $Val extends RetweetStateData>
    implements $RetweetStateDataCopyWith<$Res> {
  _$RetweetStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRetweeted = null,
  }) {
    return _then(_value.copyWith(
      isRetweeted: null == isRetweeted
          ? _value.isRetweeted
          : isRetweeted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RetweetStateDataCopyWith<$Res>
    implements $RetweetStateDataCopyWith<$Res> {
  factory _$$_RetweetStateDataCopyWith(
          _$_RetweetStateData value, $Res Function(_$_RetweetStateData) then) =
      __$$_RetweetStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'retweeted') bool isRetweeted});
}

/// @nodoc
class __$$_RetweetStateDataCopyWithImpl<$Res>
    extends _$RetweetStateDataCopyWithImpl<$Res, _$_RetweetStateData>
    implements _$$_RetweetStateDataCopyWith<$Res> {
  __$$_RetweetStateDataCopyWithImpl(
      _$_RetweetStateData _value, $Res Function(_$_RetweetStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRetweeted = null,
  }) {
    return _then(_$_RetweetStateData(
      isRetweeted: null == isRetweeted
          ? _value.isRetweeted
          : isRetweeted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RetweetStateData implements _RetweetStateData {
  const _$_RetweetStateData(
      {@JsonKey(name: 'retweeted') required this.isRetweeted});

  factory _$_RetweetStateData.fromJson(Map<String, dynamic> json) =>
      _$$_RetweetStateDataFromJson(json);

  /// Indicates whether the user Retweets the specified Tweet as a result
  /// of this request.
  @override
  @JsonKey(name: 'retweeted')
  final bool isRetweeted;

  @override
  String toString() {
    return 'RetweetStateData(isRetweeted: $isRetweeted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RetweetStateData &&
            (identical(other.isRetweeted, isRetweeted) ||
                other.isRetweeted == isRetweeted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isRetweeted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RetweetStateDataCopyWith<_$_RetweetStateData> get copyWith =>
      __$$_RetweetStateDataCopyWithImpl<_$_RetweetStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RetweetStateDataToJson(
      this,
    );
  }
}

abstract class _RetweetStateData implements RetweetStateData {
  const factory _RetweetStateData(
          {@JsonKey(name: 'retweeted') required final bool isRetweeted}) =
      _$_RetweetStateData;

  factory _RetweetStateData.fromJson(Map<String, dynamic> json) =
      _$_RetweetStateData.fromJson;

  @override

  /// Indicates whether the user Retweets the specified Tweet as a result
  /// of this request.
  @JsonKey(name: 'retweeted')
  bool get isRetweeted;
  @override
  @JsonKey(ignore: true)
  _$$_RetweetStateDataCopyWith<_$_RetweetStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
