// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PollData _$PollDataFromJson(Map<String, dynamic> json) {
  return _PollData.fromJson(json);
}

/// @nodoc
mixin _$PollData {
  /// Unique identifier of the expanded poll.
  String get id => throw _privateConstructorUsedError;

  /// Contains objects describing each choice in the referenced poll.
  List<PollOption> get options => throw _privateConstructorUsedError;

  /// Indicates if this poll is still active and can receive votes,
  /// or if the voting is now closed.
  PollVotingStatus? get votingStatus => throw _privateConstructorUsedError;

  /// Specifies the total duration of this poll.
  int? get durationMinutes => throw _privateConstructorUsedError;

  /// Specifies the end date and time for this poll.
  @JsonKey(name: 'end_datetime')
  DateTime? get endAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollDataCopyWith<PollData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollDataCopyWith<$Res> {
  factory $PollDataCopyWith(PollData value, $Res Function(PollData) then) =
      _$PollDataCopyWithImpl<$Res, PollData>;
  @useResult
  $Res call(
      {String id,
      List<PollOption> options,
      PollVotingStatus? votingStatus,
      int? durationMinutes,
      @JsonKey(name: 'end_datetime') DateTime? endAt});
}

/// @nodoc
class _$PollDataCopyWithImpl<$Res, $Val extends PollData>
    implements $PollDataCopyWith<$Res> {
  _$PollDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? options = null,
    Object? votingStatus = freezed,
    Object? durationMinutes = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PollOption>,
      votingStatus: freezed == votingStatus
          ? _value.votingStatus
          : votingStatus // ignore: cast_nullable_to_non_nullable
              as PollVotingStatus?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PollDataCopyWith<$Res> implements $PollDataCopyWith<$Res> {
  factory _$$_PollDataCopyWith(
          _$_PollData value, $Res Function(_$_PollData) then) =
      __$$_PollDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<PollOption> options,
      PollVotingStatus? votingStatus,
      int? durationMinutes,
      @JsonKey(name: 'end_datetime') DateTime? endAt});
}

/// @nodoc
class __$$_PollDataCopyWithImpl<$Res>
    extends _$PollDataCopyWithImpl<$Res, _$_PollData>
    implements _$$_PollDataCopyWith<$Res> {
  __$$_PollDataCopyWithImpl(
      _$_PollData _value, $Res Function(_$_PollData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? options = null,
    Object? votingStatus = freezed,
    Object? durationMinutes = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_$_PollData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PollOption>,
      votingStatus: freezed == votingStatus
          ? _value.votingStatus
          : votingStatus // ignore: cast_nullable_to_non_nullable
              as PollVotingStatus?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_PollData implements _PollData {
  const _$_PollData(
      {required this.id,
      required final List<PollOption> options,
      this.votingStatus,
      this.durationMinutes,
      @JsonKey(name: 'end_datetime') this.endAt})
      : _options = options;

  factory _$_PollData.fromJson(Map<String, dynamic> json) =>
      _$$_PollDataFromJson(json);

  /// Unique identifier of the expanded poll.
  @override
  final String id;

  /// Contains objects describing each choice in the referenced poll.
  final List<PollOption> _options;

  /// Contains objects describing each choice in the referenced poll.
  @override
  List<PollOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Indicates if this poll is still active and can receive votes,
  /// or if the voting is now closed.
  @override
  final PollVotingStatus? votingStatus;

  /// Specifies the total duration of this poll.
  @override
  final int? durationMinutes;

  /// Specifies the end date and time for this poll.
  @override
  @JsonKey(name: 'end_datetime')
  final DateTime? endAt;

  @override
  String toString() {
    return 'PollData(id: $id, options: $options, votingStatus: $votingStatus, durationMinutes: $durationMinutes, endAt: $endAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PollData &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.votingStatus, votingStatus) ||
                other.votingStatus == votingStatus) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_options),
      votingStatus,
      durationMinutes,
      endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PollDataCopyWith<_$_PollData> get copyWith =>
      __$$_PollDataCopyWithImpl<_$_PollData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PollDataToJson(
      this,
    );
  }
}

abstract class _PollData implements PollData {
  const factory _PollData(
      {required final String id,
      required final List<PollOption> options,
      final PollVotingStatus? votingStatus,
      final int? durationMinutes,
      @JsonKey(name: 'end_datetime') final DateTime? endAt}) = _$_PollData;

  factory _PollData.fromJson(Map<String, dynamic> json) = _$_PollData.fromJson;

  @override

  /// Unique identifier of the expanded poll.
  String get id;
  @override

  /// Contains objects describing each choice in the referenced poll.
  List<PollOption> get options;
  @override

  /// Indicates if this poll is still active and can receive votes,
  /// or if the voting is now closed.
  PollVotingStatus? get votingStatus;
  @override

  /// Specifies the total duration of this poll.
  int? get durationMinutes;
  @override

  /// Specifies the end date and time for this poll.
  @JsonKey(name: 'end_datetime')
  DateTime? get endAt;
  @override
  @JsonKey(ignore: true)
  _$$_PollDataCopyWith<_$_PollData> get copyWith =>
      throw _privateConstructorUsedError;
}
