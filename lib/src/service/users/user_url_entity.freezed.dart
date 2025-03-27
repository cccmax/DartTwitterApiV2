// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_url_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserUrlEntity _$UserUrlEntityFromJson(Map<String, dynamic> json) {
  return _UserUrlEntity.fromJson(json);
}

/// @nodoc
mixin _$UserUrlEntity {
  /// Contains details about the user's profile website.
  List<Url> get urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUrlEntityCopyWith<UserUrlEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUrlEntityCopyWith<$Res> {
  factory $UserUrlEntityCopyWith(
          UserUrlEntity value, $Res Function(UserUrlEntity) then) =
      _$UserUrlEntityCopyWithImpl<$Res, UserUrlEntity>;
  @useResult
  $Res call({List<Url> urls});
}

/// @nodoc
class _$UserUrlEntityCopyWithImpl<$Res, $Val extends UserUrlEntity>
    implements $UserUrlEntityCopyWith<$Res> {
  _$UserUrlEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
  }) {
    return _then(_value.copyWith(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<Url>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserUrlEntityCopyWith<$Res>
    implements $UserUrlEntityCopyWith<$Res> {
  factory _$$_UserUrlEntityCopyWith(
          _$_UserUrlEntity value, $Res Function(_$_UserUrlEntity) then) =
      __$$_UserUrlEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Url> urls});
}

/// @nodoc
class __$$_UserUrlEntityCopyWithImpl<$Res>
    extends _$UserUrlEntityCopyWithImpl<$Res, _$_UserUrlEntity>
    implements _$$_UserUrlEntityCopyWith<$Res> {
  __$$_UserUrlEntityCopyWithImpl(
      _$_UserUrlEntity _value, $Res Function(_$_UserUrlEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
  }) {
    return _then(_$_UserUrlEntity(
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<Url>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserUrlEntity implements _UserUrlEntity {
  const _$_UserUrlEntity({required final List<Url> urls}) : _urls = urls;

  factory _$_UserUrlEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserUrlEntityFromJson(json);

  /// Contains details about the user's profile website.
  final List<Url> _urls;

  /// Contains details about the user's profile website.
  @override
  List<Url> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  String toString() {
    return 'UserUrlEntity(urls: $urls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserUrlEntity &&
            const DeepCollectionEquality().equals(other._urls, _urls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_urls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserUrlEntityCopyWith<_$_UserUrlEntity> get copyWith =>
      __$$_UserUrlEntityCopyWithImpl<_$_UserUrlEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserUrlEntityToJson(
      this,
    );
  }
}

abstract class _UserUrlEntity implements UserUrlEntity {
  const factory _UserUrlEntity({required final List<Url> urls}) =
      _$_UserUrlEntity;

  factory _UserUrlEntity.fromJson(Map<String, dynamic> json) =
      _$_UserUrlEntity.fromJson;

  @override

  /// Contains details about the user's profile website.
  List<Url> get urls;
  @override
  @JsonKey(ignore: true)
  _$$_UserUrlEntityCopyWith<_$_UserUrlEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
