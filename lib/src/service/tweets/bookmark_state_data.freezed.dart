// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookmarkStateData _$BookmarkStateDataFromJson(Map<String, dynamic> json) {
  return _BookmarkStateData.fromJson(json);
}

/// @nodoc
mixin _$BookmarkStateData {
  /// Indicates whether the user bookmarks the specified Tweet as a result
  /// of this request.
  @JsonKey(name: 'bookmarked')
  bool get isBookmarked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkStateDataCopyWith<BookmarkStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkStateDataCopyWith<$Res> {
  factory $BookmarkStateDataCopyWith(
          BookmarkStateData value, $Res Function(BookmarkStateData) then) =
      _$BookmarkStateDataCopyWithImpl<$Res, BookmarkStateData>;
  @useResult
  $Res call({@JsonKey(name: 'bookmarked') bool isBookmarked});
}

/// @nodoc
class _$BookmarkStateDataCopyWithImpl<$Res, $Val extends BookmarkStateData>
    implements $BookmarkStateDataCopyWith<$Res> {
  _$BookmarkStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBookmarked = null,
  }) {
    return _then(_value.copyWith(
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookmarkStateDataCopyWith<$Res>
    implements $BookmarkStateDataCopyWith<$Res> {
  factory _$$_BookmarkStateDataCopyWith(_$_BookmarkStateData value,
          $Res Function(_$_BookmarkStateData) then) =
      __$$_BookmarkStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'bookmarked') bool isBookmarked});
}

/// @nodoc
class __$$_BookmarkStateDataCopyWithImpl<$Res>
    extends _$BookmarkStateDataCopyWithImpl<$Res, _$_BookmarkStateData>
    implements _$$_BookmarkStateDataCopyWith<$Res> {
  __$$_BookmarkStateDataCopyWithImpl(
      _$_BookmarkStateData _value, $Res Function(_$_BookmarkStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBookmarked = null,
  }) {
    return _then(_$_BookmarkStateData(
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookmarkStateData implements _BookmarkStateData {
  const _$_BookmarkStateData(
      {@JsonKey(name: 'bookmarked') required this.isBookmarked});

  factory _$_BookmarkStateData.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkStateDataFromJson(json);

  /// Indicates whether the user bookmarks the specified Tweet as a result
  /// of this request.
  @override
  @JsonKey(name: 'bookmarked')
  final bool isBookmarked;

  @override
  String toString() {
    return 'BookmarkStateData(isBookmarked: $isBookmarked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkStateData &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isBookmarked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkStateDataCopyWith<_$_BookmarkStateData> get copyWith =>
      __$$_BookmarkStateDataCopyWithImpl<_$_BookmarkStateData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkStateDataToJson(
      this,
    );
  }
}

abstract class _BookmarkStateData implements BookmarkStateData {
  const factory _BookmarkStateData(
          {@JsonKey(name: 'bookmarked') required final bool isBookmarked}) =
      _$_BookmarkStateData;

  factory _BookmarkStateData.fromJson(Map<String, dynamic> json) =
      _$_BookmarkStateData.fromJson;

  @override

  /// Indicates whether the user bookmarks the specified Tweet as a result
  /// of this request.
  @JsonKey(name: 'bookmarked')
  bool get isBookmarked;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkStateDataCopyWith<_$_BookmarkStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
