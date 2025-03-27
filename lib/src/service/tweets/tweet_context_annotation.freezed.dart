// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_context_annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TweetContextAnnotation _$TweetContextAnnotationFromJson(
    Map<String, dynamic> json) {
  return _TweetContextAnnotation.fromJson(json);
}

/// @nodoc
mixin _$TweetContextAnnotation {
  /// Domain: Contains the numeric value of the domain.
  ///
  /// Entity: Unique value which correlates to an explicitly mentioned Person,
  /// Place, Product or Organization
  String get id => throw _privateConstructorUsedError;

  /// Domain: Domain name based on the Tweet text.
  ///
  /// Entity: Name or reference of entity referenced in the Tweet.
  String get name => throw _privateConstructorUsedError;

  /// Domain: Long form description of domain classification.
  ///
  /// Entity: Additional information regarding referenced entity.
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetContextAnnotationCopyWith<TweetContextAnnotation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetContextAnnotationCopyWith<$Res> {
  factory $TweetContextAnnotationCopyWith(TweetContextAnnotation value,
          $Res Function(TweetContextAnnotation) then) =
      _$TweetContextAnnotationCopyWithImpl<$Res, TweetContextAnnotation>;
  @useResult
  $Res call({String id, String name, String? description});
}

/// @nodoc
class _$TweetContextAnnotationCopyWithImpl<$Res,
        $Val extends TweetContextAnnotation>
    implements $TweetContextAnnotationCopyWith<$Res> {
  _$TweetContextAnnotationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TweetContextAnnotationCopyWith<$Res>
    implements $TweetContextAnnotationCopyWith<$Res> {
  factory _$$_TweetContextAnnotationCopyWith(_$_TweetContextAnnotation value,
          $Res Function(_$_TweetContextAnnotation) then) =
      __$$_TweetContextAnnotationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? description});
}

/// @nodoc
class __$$_TweetContextAnnotationCopyWithImpl<$Res>
    extends _$TweetContextAnnotationCopyWithImpl<$Res,
        _$_TweetContextAnnotation>
    implements _$$_TweetContextAnnotationCopyWith<$Res> {
  __$$_TweetContextAnnotationCopyWithImpl(_$_TweetContextAnnotation _value,
      $Res Function(_$_TweetContextAnnotation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$_TweetContextAnnotation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_TweetContextAnnotation implements _TweetContextAnnotation {
  const _$_TweetContextAnnotation(
      {required this.id, required this.name, this.description});

  factory _$_TweetContextAnnotation.fromJson(Map<String, dynamic> json) =>
      _$$_TweetContextAnnotationFromJson(json);

  /// Domain: Contains the numeric value of the domain.
  ///
  /// Entity: Unique value which correlates to an explicitly mentioned Person,
  /// Place, Product or Organization
  @override
  final String id;

  /// Domain: Domain name based on the Tweet text.
  ///
  /// Entity: Name or reference of entity referenced in the Tweet.
  @override
  final String name;

  /// Domain: Long form description of domain classification.
  ///
  /// Entity: Additional information regarding referenced entity.
  @override
  final String? description;

  @override
  String toString() {
    return 'TweetContextAnnotation(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TweetContextAnnotation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetContextAnnotationCopyWith<_$_TweetContextAnnotation> get copyWith =>
      __$$_TweetContextAnnotationCopyWithImpl<_$_TweetContextAnnotation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetContextAnnotationToJson(
      this,
    );
  }
}

abstract class _TweetContextAnnotation implements TweetContextAnnotation {
  const factory _TweetContextAnnotation(
      {required final String id,
      required final String name,
      final String? description}) = _$_TweetContextAnnotation;

  factory _TweetContextAnnotation.fromJson(Map<String, dynamic> json) =
      _$_TweetContextAnnotation.fromJson;

  @override

  /// Domain: Contains the numeric value of the domain.
  ///
  /// Entity: Unique value which correlates to an explicitly mentioned Person,
  /// Place, Product or Organization
  String get id;
  @override

  /// Domain: Domain name based on the Tweet text.
  ///
  /// Entity: Name or reference of entity referenced in the Tweet.
  String get name;
  @override

  /// Domain: Long form description of domain classification.
  ///
  /// Entity: Additional information regarding referenced entity.
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_TweetContextAnnotationCopyWith<_$_TweetContextAnnotation> get copyWith =>
      throw _privateConstructorUsedError;
}
