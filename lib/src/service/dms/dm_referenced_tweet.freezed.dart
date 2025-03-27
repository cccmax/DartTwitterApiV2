// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dm_referenced_tweet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DMReferencedTweet _$DMReferencedTweetFromJson(Map<String, dynamic> json) {
  return _ReferencedTweet.fromJson(json);
}

/// @nodoc
mixin _$DMReferencedTweet {
  /// The id of a "shared" Tweet in the Direct Message.
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DMReferencedTweetCopyWith<DMReferencedTweet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DMReferencedTweetCopyWith<$Res> {
  factory $DMReferencedTweetCopyWith(
          DMReferencedTweet value, $Res Function(DMReferencedTweet) then) =
      _$DMReferencedTweetCopyWithImpl<$Res, DMReferencedTweet>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DMReferencedTweetCopyWithImpl<$Res, $Val extends DMReferencedTweet>
    implements $DMReferencedTweetCopyWith<$Res> {
  _$DMReferencedTweetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReferencedTweetCopyWith<$Res>
    implements $DMReferencedTweetCopyWith<$Res> {
  factory _$$_ReferencedTweetCopyWith(
          _$_ReferencedTweet value, $Res Function(_$_ReferencedTweet) then) =
      __$$_ReferencedTweetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_ReferencedTweetCopyWithImpl<$Res>
    extends _$DMReferencedTweetCopyWithImpl<$Res, _$_ReferencedTweet>
    implements _$$_ReferencedTweetCopyWith<$Res> {
  __$$_ReferencedTweetCopyWithImpl(
      _$_ReferencedTweet _value, $Res Function(_$_ReferencedTweet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_ReferencedTweet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReferencedTweet implements _ReferencedTweet {
  const _$_ReferencedTweet({required this.id});

  factory _$_ReferencedTweet.fromJson(Map<String, dynamic> json) =>
      _$$_ReferencedTweetFromJson(json);

  /// The id of a "shared" Tweet in the Direct Message.
  @override
  final String id;

  @override
  String toString() {
    return 'DMReferencedTweet(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferencedTweet &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReferencedTweetCopyWith<_$_ReferencedTweet> get copyWith =>
      __$$_ReferencedTweetCopyWithImpl<_$_ReferencedTweet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferencedTweetToJson(
      this,
    );
  }
}

abstract class _ReferencedTweet implements DMReferencedTweet {
  const factory _ReferencedTweet({required final String id}) =
      _$_ReferencedTweet;

  factory _ReferencedTweet.fromJson(Map<String, dynamic> json) =
      _$_ReferencedTweet.fromJson;

  @override

  /// The id of a "shared" Tweet in the Direct Message.
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_ReferencedTweetCopyWith<_$_ReferencedTweet> get copyWith =>
      throw _privateConstructorUsedError;
}
