// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_tweet_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicTweetMetrics _$PublicTweetMetricsFromJson(Map<String, dynamic> json) {
  return _PublicTweetMetrics.fromJson(json);
}

/// @nodoc
mixin _$PublicTweetMetrics {
  /// Number of Likes of this Tweet.
  int get likeCount => throw _privateConstructorUsedError;

  /// Number of times this Tweet has been Retweeted.
  int get retweetCount => throw _privateConstructorUsedError;

  /// Number of Replies of this Tweet.
  int get replyCount => throw _privateConstructorUsedError;

  /// Number of times this Tweet has been Retweeted with a comment
  /// (also known as Quote).
  int get quoteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicTweetMetricsCopyWith<PublicTweetMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicTweetMetricsCopyWith<$Res> {
  factory $PublicTweetMetricsCopyWith(
          PublicTweetMetrics value, $Res Function(PublicTweetMetrics) then) =
      _$PublicTweetMetricsCopyWithImpl<$Res, PublicTweetMetrics>;
  @useResult
  $Res call({int likeCount, int retweetCount, int replyCount, int quoteCount});
}

/// @nodoc
class _$PublicTweetMetricsCopyWithImpl<$Res, $Val extends PublicTweetMetrics>
    implements $PublicTweetMetricsCopyWith<$Res> {
  _$PublicTweetMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likeCount = null,
    Object? retweetCount = null,
    Object? replyCount = null,
    Object? quoteCount = null,
  }) {
    return _then(_value.copyWith(
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      retweetCount: null == retweetCount
          ? _value.retweetCount
          : retweetCount // ignore: cast_nullable_to_non_nullable
              as int,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      quoteCount: null == quoteCount
          ? _value.quoteCount
          : quoteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicTweetMetricsCopyWith<$Res>
    implements $PublicTweetMetricsCopyWith<$Res> {
  factory _$$_PublicTweetMetricsCopyWith(_$_PublicTweetMetrics value,
          $Res Function(_$_PublicTweetMetrics) then) =
      __$$_PublicTweetMetricsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int likeCount, int retweetCount, int replyCount, int quoteCount});
}

/// @nodoc
class __$$_PublicTweetMetricsCopyWithImpl<$Res>
    extends _$PublicTweetMetricsCopyWithImpl<$Res, _$_PublicTweetMetrics>
    implements _$$_PublicTweetMetricsCopyWith<$Res> {
  __$$_PublicTweetMetricsCopyWithImpl(
      _$_PublicTweetMetrics _value, $Res Function(_$_PublicTweetMetrics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likeCount = null,
    Object? retweetCount = null,
    Object? replyCount = null,
    Object? quoteCount = null,
  }) {
    return _then(_$_PublicTweetMetrics(
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      retweetCount: null == retweetCount
          ? _value.retweetCount
          : retweetCount // ignore: cast_nullable_to_non_nullable
              as int,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      quoteCount: null == quoteCount
          ? _value.quoteCount
          : quoteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicTweetMetrics implements _PublicTweetMetrics {
  const _$_PublicTweetMetrics(
      {required this.likeCount,
      required this.retweetCount,
      required this.replyCount,
      required this.quoteCount});

  factory _$_PublicTweetMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_PublicTweetMetricsFromJson(json);

  /// Number of Likes of this Tweet.
  @override
  final int likeCount;

  /// Number of times this Tweet has been Retweeted.
  @override
  final int retweetCount;

  /// Number of Replies of this Tweet.
  @override
  final int replyCount;

  /// Number of times this Tweet has been Retweeted with a comment
  /// (also known as Quote).
  @override
  final int quoteCount;

  @override
  String toString() {
    return 'PublicTweetMetrics(likeCount: $likeCount, retweetCount: $retweetCount, replyCount: $replyCount, quoteCount: $quoteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicTweetMetrics &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.retweetCount, retweetCount) ||
                other.retweetCount == retweetCount) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.quoteCount, quoteCount) ||
                other.quoteCount == quoteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, likeCount, retweetCount, replyCount, quoteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicTweetMetricsCopyWith<_$_PublicTweetMetrics> get copyWith =>
      __$$_PublicTweetMetricsCopyWithImpl<_$_PublicTweetMetrics>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicTweetMetricsToJson(
      this,
    );
  }
}

abstract class _PublicTweetMetrics implements PublicTweetMetrics {
  const factory _PublicTweetMetrics(
      {required final int likeCount,
      required final int retweetCount,
      required final int replyCount,
      required final int quoteCount}) = _$_PublicTweetMetrics;

  factory _PublicTweetMetrics.fromJson(Map<String, dynamic> json) =
      _$_PublicTweetMetrics.fromJson;

  @override

  /// Number of Likes of this Tweet.
  int get likeCount;
  @override

  /// Number of times this Tweet has been Retweeted.
  int get retweetCount;
  @override

  /// Number of Replies of this Tweet.
  int get replyCount;
  @override

  /// Number of times this Tweet has been Retweeted with a comment
  /// (also known as Quote).
  int get quoteCount;
  @override
  @JsonKey(ignore: true)
  _$$_PublicTweetMetricsCopyWith<_$_PublicTweetMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}
