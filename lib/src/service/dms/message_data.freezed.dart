// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return _MessageData.fromJson(json);
}

/// @nodoc
mixin _$MessageData {
  /// The `id` of the event sent in this conversation.
  @JsonKey(name: 'dm_event_id')
  String get eventId => throw _privateConstructorUsedError;

  /// The `id` of the DM conversation.
  @JsonKey(name: 'dm_conversation_id')
  String get conversationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDataCopyWith<MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDataCopyWith<$Res> {
  factory $MessageDataCopyWith(
          MessageData value, $Res Function(MessageData) then) =
      _$MessageDataCopyWithImpl<$Res, MessageData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dm_event_id') String eventId,
      @JsonKey(name: 'dm_conversation_id') String conversationId});
}

/// @nodoc
class _$MessageDataCopyWithImpl<$Res, $Val extends MessageData>
    implements $MessageDataCopyWith<$Res> {
  _$MessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? conversationId = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageDataCopyWith<$Res>
    implements $MessageDataCopyWith<$Res> {
  factory _$$_MessageDataCopyWith(
          _$_MessageData value, $Res Function(_$_MessageData) then) =
      __$$_MessageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dm_event_id') String eventId,
      @JsonKey(name: 'dm_conversation_id') String conversationId});
}

/// @nodoc
class __$$_MessageDataCopyWithImpl<$Res>
    extends _$MessageDataCopyWithImpl<$Res, _$_MessageData>
    implements _$$_MessageDataCopyWith<$Res> {
  __$$_MessageDataCopyWithImpl(
      _$_MessageData _value, $Res Function(_$_MessageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? conversationId = null,
  }) {
    return _then(_$_MessageData(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageData implements _MessageData {
  const _$_MessageData(
      {@JsonKey(name: 'dm_event_id') required this.eventId,
      @JsonKey(name: 'dm_conversation_id') required this.conversationId});

  factory _$_MessageData.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDataFromJson(json);

  /// The `id` of the event sent in this conversation.
  @override
  @JsonKey(name: 'dm_event_id')
  final String eventId;

  /// The `id` of the DM conversation.
  @override
  @JsonKey(name: 'dm_conversation_id')
  final String conversationId;

  @override
  String toString() {
    return 'MessageData(eventId: $eventId, conversationId: $conversationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageData &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, conversationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageDataCopyWith<_$_MessageData> get copyWith =>
      __$$_MessageDataCopyWithImpl<_$_MessageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDataToJson(
      this,
    );
  }
}

abstract class _MessageData implements MessageData {
  const factory _MessageData(
      {@JsonKey(name: 'dm_event_id')
          required final String eventId,
      @JsonKey(name: 'dm_conversation_id')
          required final String conversationId}) = _$_MessageData;

  factory _MessageData.fromJson(Map<String, dynamic> json) =
      _$_MessageData.fromJson;

  @override

  /// The `id` of the event sent in this conversation.
  @JsonKey(name: 'dm_event_id')
  String get eventId;
  @override

  /// The `id` of the DM conversation.
  @JsonKey(name: 'dm_conversation_id')
  String get conversationId;
  @override
  @JsonKey(ignore: true)
  _$$_MessageDataCopyWith<_$_MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}
