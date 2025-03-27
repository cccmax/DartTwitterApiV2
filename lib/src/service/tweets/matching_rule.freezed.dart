// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchingRule _$MatchingRuleFromJson(Map<String, dynamic> json) {
  return _MatchingRule.fromJson(json);
}

/// @nodoc
mixin _$MatchingRule {
  /// ID of the filter rule that matched against the Tweet delivered.
  String get id => throw _privateConstructorUsedError;

  /// The tag label of the filter rule that matched against the
  /// Tweet delivered.
  String get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchingRuleCopyWith<MatchingRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingRuleCopyWith<$Res> {
  factory $MatchingRuleCopyWith(
          MatchingRule value, $Res Function(MatchingRule) then) =
      _$MatchingRuleCopyWithImpl<$Res, MatchingRule>;
  @useResult
  $Res call({String id, String tag});
}

/// @nodoc
class _$MatchingRuleCopyWithImpl<$Res, $Val extends MatchingRule>
    implements $MatchingRuleCopyWith<$Res> {
  _$MatchingRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchingRuleCopyWith<$Res>
    implements $MatchingRuleCopyWith<$Res> {
  factory _$$_MatchingRuleCopyWith(
          _$_MatchingRule value, $Res Function(_$_MatchingRule) then) =
      __$$_MatchingRuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String tag});
}

/// @nodoc
class __$$_MatchingRuleCopyWithImpl<$Res>
    extends _$MatchingRuleCopyWithImpl<$Res, _$_MatchingRule>
    implements _$$_MatchingRuleCopyWith<$Res> {
  __$$_MatchingRuleCopyWithImpl(
      _$_MatchingRule _value, $Res Function(_$_MatchingRule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_$_MatchingRule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchingRule implements _MatchingRule {
  const _$_MatchingRule({required this.id, required this.tag});

  factory _$_MatchingRule.fromJson(Map<String, dynamic> json) =>
      _$$_MatchingRuleFromJson(json);

  /// ID of the filter rule that matched against the Tweet delivered.
  @override
  final String id;

  /// The tag label of the filter rule that matched against the
  /// Tweet delivered.
  @override
  final String tag;

  @override
  String toString() {
    return 'MatchingRule(id: $id, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchingRule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchingRuleCopyWith<_$_MatchingRule> get copyWith =>
      __$$_MatchingRuleCopyWithImpl<_$_MatchingRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchingRuleToJson(
      this,
    );
  }
}

abstract class _MatchingRule implements MatchingRule {
  const factory _MatchingRule(
      {required final String id, required final String tag}) = _$_MatchingRule;

  factory _MatchingRule.fromJson(Map<String, dynamic> json) =
      _$_MatchingRule.fromJson;

  @override

  /// ID of the filter rule that matched against the Tweet delivered.
  String get id;
  @override

  /// The tag label of the filter rule that matched against the
  /// Tweet delivered.
  String get tag;
  @override
  @JsonKey(ignore: true)
  _$$_MatchingRuleCopyWith<_$_MatchingRule> get copyWith =>
      throw _privateConstructorUsedError;
}
