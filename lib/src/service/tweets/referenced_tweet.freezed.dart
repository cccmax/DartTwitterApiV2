// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referenced_tweet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReferencedTweet _$ReferencedTweetFromJson(Map<String, dynamic> json) {
  return _ReferencedTweet.fromJson(json);
}

/// @nodoc
mixin _$ReferencedTweet {
  /// The unique identifier of the referenced Tweet.
  String get id => throw _privateConstructorUsedError;

  /// Indicates the type of relationship between this Tweet and the Tweet
  /// returned in the response:
  /// [TweetType.retweeted] (this Tweet is a Retweet),
  /// [TweetType.quoted] (a Retweet with comment, also known as Quoted Tweet),
  /// or [TweetType.repliedTo] (this Tweet is a reply).
  TweetType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferencedTweetCopyWith<ReferencedTweet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferencedTweetCopyWith<$Res> {
  factory $ReferencedTweetCopyWith(
          ReferencedTweet value, $Res Function(ReferencedTweet) then) =
      _$ReferencedTweetCopyWithImpl<$Res, ReferencedTweet>;
  @useResult
  $Res call({String id, TweetType type});
}

/// @nodoc
class _$ReferencedTweetCopyWithImpl<$Res, $Val extends ReferencedTweet>
    implements $ReferencedTweetCopyWith<$Res> {
  _$ReferencedTweetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TweetType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReferencedTweetCopyWith<$Res>
    implements $ReferencedTweetCopyWith<$Res> {
  factory _$$_ReferencedTweetCopyWith(
          _$_ReferencedTweet value, $Res Function(_$_ReferencedTweet) then) =
      __$$_ReferencedTweetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, TweetType type});
}

/// @nodoc
class __$$_ReferencedTweetCopyWithImpl<$Res>
    extends _$ReferencedTweetCopyWithImpl<$Res, _$_ReferencedTweet>
    implements _$$_ReferencedTweetCopyWith<$Res> {
  __$$_ReferencedTweetCopyWithImpl(
      _$_ReferencedTweet _value, $Res Function(_$_ReferencedTweet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_$_ReferencedTweet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TweetType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReferencedTweet implements _ReferencedTweet {
  const _$_ReferencedTweet({required this.id, required this.type});

  factory _$_ReferencedTweet.fromJson(Map<String, dynamic> json) =>
      _$$_ReferencedTweetFromJson(json);

  /// The unique identifier of the referenced Tweet.
  @override
  final String id;

  /// Indicates the type of relationship between this Tweet and the Tweet
  /// returned in the response:
  /// [TweetType.retweeted] (this Tweet is a Retweet),
  /// [TweetType.quoted] (a Retweet with comment, also known as Quoted Tweet),
  /// or [TweetType.repliedTo] (this Tweet is a reply).
  @override
  final TweetType type;

  @override
  String toString() {
    return 'ReferencedTweet(id: $id, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferencedTweet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

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

abstract class _ReferencedTweet implements ReferencedTweet {
  const factory _ReferencedTweet(
      {required final String id,
      required final TweetType type}) = _$_ReferencedTweet;

  factory _ReferencedTweet.fromJson(Map<String, dynamic> json) =
      _$_ReferencedTweet.fromJson;

  @override

  /// The unique identifier of the referenced Tweet.
  String get id;
  @override

  /// Indicates the type of relationship between this Tweet and the Tweet
  /// returned in the response:
  /// [TweetType.retweeted] (this Tweet is a Retweet),
  /// [TweetType.quoted] (a Retweet with comment, also known as Quoted Tweet),
  /// or [TweetType.repliedTo] (this Tweet is a reply).
  TweetType get type;
  @override
  @JsonKey(ignore: true)
  _$$_ReferencedTweetCopyWith<_$_ReferencedTweet> get copyWith =>
      throw _privateConstructorUsedError;
}
