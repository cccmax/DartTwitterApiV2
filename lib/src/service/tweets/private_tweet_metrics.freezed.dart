// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_tweet_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrivateTweetMetrics _$PrivateTweetMetricsFromJson(Map<String, dynamic> json) {
  return _PrivateTweetMetrics.fromJson(json);
}

/// @nodoc
mixin _$PrivateTweetMetrics {
  /// A count of how many times the Tweet has been viewed
  /// (not unique by user). A view is counted if any part of the Tweet is
  /// visible on the screen.
  int get impressionCount => throw _privateConstructorUsedError;

  /// A count of the number of times a user clicks the following portions of
  /// a Tweet: display name, user name, profile picture.
  @JsonKey(name: 'user_profile_clicks')
  int get profileClickCount => throw _privateConstructorUsedError;

  /// A count of the number of times a user clicks on a URL link or URL
  /// preview card in a Tweet.
  @JsonKey(name: 'url_link_clicks')
  int? get linkClickCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivateTweetMetricsCopyWith<PrivateTweetMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateTweetMetricsCopyWith<$Res> {
  factory $PrivateTweetMetricsCopyWith(
          PrivateTweetMetrics value, $Res Function(PrivateTweetMetrics) then) =
      _$PrivateTweetMetricsCopyWithImpl<$Res, PrivateTweetMetrics>;
  @useResult
  $Res call(
      {int impressionCount,
      @JsonKey(name: 'user_profile_clicks') int profileClickCount,
      @JsonKey(name: 'url_link_clicks') int? linkClickCount});
}

/// @nodoc
class _$PrivateTweetMetricsCopyWithImpl<$Res, $Val extends PrivateTweetMetrics>
    implements $PrivateTweetMetricsCopyWith<$Res> {
  _$PrivateTweetMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impressionCount = null,
    Object? profileClickCount = null,
    Object? linkClickCount = freezed,
  }) {
    return _then(_value.copyWith(
      impressionCount: null == impressionCount
          ? _value.impressionCount
          : impressionCount // ignore: cast_nullable_to_non_nullable
              as int,
      profileClickCount: null == profileClickCount
          ? _value.profileClickCount
          : profileClickCount // ignore: cast_nullable_to_non_nullable
              as int,
      linkClickCount: freezed == linkClickCount
          ? _value.linkClickCount
          : linkClickCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrivateTweetMetricsCopyWith<$Res>
    implements $PrivateTweetMetricsCopyWith<$Res> {
  factory _$$_PrivateTweetMetricsCopyWith(_$_PrivateTweetMetrics value,
          $Res Function(_$_PrivateTweetMetrics) then) =
      __$$_PrivateTweetMetricsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int impressionCount,
      @JsonKey(name: 'user_profile_clicks') int profileClickCount,
      @JsonKey(name: 'url_link_clicks') int? linkClickCount});
}

/// @nodoc
class __$$_PrivateTweetMetricsCopyWithImpl<$Res>
    extends _$PrivateTweetMetricsCopyWithImpl<$Res, _$_PrivateTweetMetrics>
    implements _$$_PrivateTweetMetricsCopyWith<$Res> {
  __$$_PrivateTweetMetricsCopyWithImpl(_$_PrivateTweetMetrics _value,
      $Res Function(_$_PrivateTweetMetrics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impressionCount = null,
    Object? profileClickCount = null,
    Object? linkClickCount = freezed,
  }) {
    return _then(_$_PrivateTweetMetrics(
      impressionCount: null == impressionCount
          ? _value.impressionCount
          : impressionCount // ignore: cast_nullable_to_non_nullable
              as int,
      profileClickCount: null == profileClickCount
          ? _value.profileClickCount
          : profileClickCount // ignore: cast_nullable_to_non_nullable
              as int,
      linkClickCount: freezed == linkClickCount
          ? _value.linkClickCount
          : linkClickCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_PrivateTweetMetrics implements _PrivateTweetMetrics {
  const _$_PrivateTweetMetrics(
      {required this.impressionCount,
      @JsonKey(name: 'user_profile_clicks') required this.profileClickCount,
      @JsonKey(name: 'url_link_clicks') this.linkClickCount});

  factory _$_PrivateTweetMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_PrivateTweetMetricsFromJson(json);

  /// A count of how many times the Tweet has been viewed
  /// (not unique by user). A view is counted if any part of the Tweet is
  /// visible on the screen.
  @override
  final int impressionCount;

  /// A count of the number of times a user clicks the following portions of
  /// a Tweet: display name, user name, profile picture.
  @override
  @JsonKey(name: 'user_profile_clicks')
  final int profileClickCount;

  /// A count of the number of times a user clicks on a URL link or URL
  /// preview card in a Tweet.
  @override
  @JsonKey(name: 'url_link_clicks')
  final int? linkClickCount;

  @override
  String toString() {
    return 'PrivateTweetMetrics(impressionCount: $impressionCount, profileClickCount: $profileClickCount, linkClickCount: $linkClickCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivateTweetMetrics &&
            (identical(other.impressionCount, impressionCount) ||
                other.impressionCount == impressionCount) &&
            (identical(other.profileClickCount, profileClickCount) ||
                other.profileClickCount == profileClickCount) &&
            (identical(other.linkClickCount, linkClickCount) ||
                other.linkClickCount == linkClickCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, impressionCount, profileClickCount, linkClickCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivateTweetMetricsCopyWith<_$_PrivateTweetMetrics> get copyWith =>
      __$$_PrivateTweetMetricsCopyWithImpl<_$_PrivateTweetMetrics>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivateTweetMetricsToJson(
      this,
    );
  }
}

abstract class _PrivateTweetMetrics implements PrivateTweetMetrics {
  const factory _PrivateTweetMetrics(
      {required final int impressionCount,
      @JsonKey(name: 'user_profile_clicks')
          required final int profileClickCount,
      @JsonKey(name: 'url_link_clicks')
          final int? linkClickCount}) = _$_PrivateTweetMetrics;

  factory _PrivateTweetMetrics.fromJson(Map<String, dynamic> json) =
      _$_PrivateTweetMetrics.fromJson;

  @override

  /// A count of how many times the Tweet has been viewed
  /// (not unique by user). A view is counted if any part of the Tweet is
  /// visible on the screen.
  int get impressionCount;
  @override

  /// A count of the number of times a user clicks the following portions of
  /// a Tweet: display name, user name, profile picture.
  @JsonKey(name: 'user_profile_clicks')
  int get profileClickCount;
  @override

  /// A count of the number of times a user clicks on a URL link or URL
  /// preview card in a Tweet.
  @JsonKey(name: 'url_link_clicks')
  int? get linkClickCount;
  @override
  @JsonKey(ignore: true)
  _$$_PrivateTweetMetricsCopyWith<_$_PrivateTweetMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}
