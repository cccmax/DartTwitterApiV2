// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mention.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mention _$MentionFromJson(Map<String, dynamic> json) {
  return _Mention.fromJson(json);
}

/// @nodoc
mixin _$Mention {
  /// The user id that created the mentions.
  String? get id => throw _privateConstructorUsedError;

  /// The part of text recognized as a user mention.
  ///
  /// You can obtain the expanded object in includes.users by adding
  /// `TweetExpansion.entitiesMentionsUsername` in the request's query
  /// parameter.
  String get username => throw _privateConstructorUsedError;

  /// The start position (zero-based) of the recognized user mention within
  /// the Tweet. All start indices are inclusive.
  int get start => throw _privateConstructorUsedError;

  /// The end position (zero-based) of the recognized user mention within t
  /// he Tweet. This end index is exclusive.
  int get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MentionCopyWith<Mention> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentionCopyWith<$Res> {
  factory $MentionCopyWith(Mention value, $Res Function(Mention) then) =
      _$MentionCopyWithImpl<$Res, Mention>;
  @useResult
  $Res call({String? id, String username, int start, int end});
}

/// @nodoc
class _$MentionCopyWithImpl<$Res, $Val extends Mention>
    implements $MentionCopyWith<$Res> {
  _$MentionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MentionCopyWith<$Res> implements $MentionCopyWith<$Res> {
  factory _$$_MentionCopyWith(
          _$_Mention value, $Res Function(_$_Mention) then) =
      __$$_MentionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String username, int start, int end});
}

/// @nodoc
class __$$_MentionCopyWithImpl<$Res>
    extends _$MentionCopyWithImpl<$Res, _$_Mention>
    implements _$$_MentionCopyWith<$Res> {
  __$$_MentionCopyWithImpl(_$_Mention _value, $Res Function(_$_Mention) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_Mention(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_Mention implements _Mention {
  const _$_Mention(
      {this.id,
      required this.username,
      required this.start,
      required this.end});

  factory _$_Mention.fromJson(Map<String, dynamic> json) =>
      _$$_MentionFromJson(json);

  /// The user id that created the mentions.
  @override
  final String? id;

  /// The part of text recognized as a user mention.
  ///
  /// You can obtain the expanded object in includes.users by adding
  /// `TweetExpansion.entitiesMentionsUsername` in the request's query
  /// parameter.
  @override
  final String username;

  /// The start position (zero-based) of the recognized user mention within
  /// the Tweet. All start indices are inclusive.
  @override
  final int start;

  /// The end position (zero-based) of the recognized user mention within t
  /// he Tweet. This end index is exclusive.
  @override
  final int end;

  @override
  String toString() {
    return 'Mention(id: $id, username: $username, start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mention &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MentionCopyWith<_$_Mention> get copyWith =>
      __$$_MentionCopyWithImpl<_$_Mention>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MentionToJson(
      this,
    );
  }
}

abstract class _Mention implements Mention {
  const factory _Mention(
      {final String? id,
      required final String username,
      required final int start,
      required final int end}) = _$_Mention;

  factory _Mention.fromJson(Map<String, dynamic> json) = _$_Mention.fromJson;

  @override

  /// The user id that created the mentions.
  String? get id;
  @override

  /// The part of text recognized as a user mention.
  ///
  /// You can obtain the expanded object in includes.users by adding
  /// `TweetExpansion.entitiesMentionsUsername` in the request's query
  /// parameter.
  String get username;
  @override

  /// The start position (zero-based) of the recognized user mention within
  /// the Tweet. All start indices are inclusive.
  int get start;
  @override

  /// The end position (zero-based) of the recognized user mention within t
  /// he Tweet. This end index is exclusive.
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$_MentionCopyWith<_$_Mention> get copyWith =>
      throw _privateConstructorUsedError;
}
