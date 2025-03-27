// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtering_rule_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilteringRuleSummary _$FilteringRuleSummaryFromJson(Map<String, dynamic> json) {
  return _FilteringRuleSummary.fromJson(json);
}

/// @nodoc
mixin _$FilteringRuleSummary {
  /// The count of created filtering rules.
  @JsonKey(name: 'created')
  int? get createdCount => throw _privateConstructorUsedError;

  /// The count of not created filtering rules.
  @JsonKey(name: 'not_created')
  int? get notCreatedCount => throw _privateConstructorUsedError;

  /// The count of deleted filtering rules.
  @JsonKey(name: 'deleted')
  int? get deletedCount => throw _privateConstructorUsedError;

  /// The count of not deleted filtering rules.
  @JsonKey(name: 'not_deleted')
  int? get notDeletedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilteringRuleSummaryCopyWith<FilteringRuleSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilteringRuleSummaryCopyWith<$Res> {
  factory $FilteringRuleSummaryCopyWith(FilteringRuleSummary value,
          $Res Function(FilteringRuleSummary) then) =
      _$FilteringRuleSummaryCopyWithImpl<$Res, FilteringRuleSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created') int? createdCount,
      @JsonKey(name: 'not_created') int? notCreatedCount,
      @JsonKey(name: 'deleted') int? deletedCount,
      @JsonKey(name: 'not_deleted') int? notDeletedCount});
}

/// @nodoc
class _$FilteringRuleSummaryCopyWithImpl<$Res,
        $Val extends FilteringRuleSummary>
    implements $FilteringRuleSummaryCopyWith<$Res> {
  _$FilteringRuleSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdCount = freezed,
    Object? notCreatedCount = freezed,
    Object? deletedCount = freezed,
    Object? notDeletedCount = freezed,
  }) {
    return _then(_value.copyWith(
      createdCount: freezed == createdCount
          ? _value.createdCount
          : createdCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notCreatedCount: freezed == notCreatedCount
          ? _value.notCreatedCount
          : notCreatedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedCount: freezed == deletedCount
          ? _value.deletedCount
          : deletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notDeletedCount: freezed == notDeletedCount
          ? _value.notDeletedCount
          : notDeletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilteringRuleSummaryCopyWith<$Res>
    implements $FilteringRuleSummaryCopyWith<$Res> {
  factory _$$_FilteringRuleSummaryCopyWith(_$_FilteringRuleSummary value,
          $Res Function(_$_FilteringRuleSummary) then) =
      __$$_FilteringRuleSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created') int? createdCount,
      @JsonKey(name: 'not_created') int? notCreatedCount,
      @JsonKey(name: 'deleted') int? deletedCount,
      @JsonKey(name: 'not_deleted') int? notDeletedCount});
}

/// @nodoc
class __$$_FilteringRuleSummaryCopyWithImpl<$Res>
    extends _$FilteringRuleSummaryCopyWithImpl<$Res, _$_FilteringRuleSummary>
    implements _$$_FilteringRuleSummaryCopyWith<$Res> {
  __$$_FilteringRuleSummaryCopyWithImpl(_$_FilteringRuleSummary _value,
      $Res Function(_$_FilteringRuleSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdCount = freezed,
    Object? notCreatedCount = freezed,
    Object? deletedCount = freezed,
    Object? notDeletedCount = freezed,
  }) {
    return _then(_$_FilteringRuleSummary(
      createdCount: freezed == createdCount
          ? _value.createdCount
          : createdCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notCreatedCount: freezed == notCreatedCount
          ? _value.notCreatedCount
          : notCreatedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedCount: freezed == deletedCount
          ? _value.deletedCount
          : deletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notDeletedCount: freezed == notDeletedCount
          ? _value.notDeletedCount
          : notDeletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_FilteringRuleSummary implements _FilteringRuleSummary {
  const _$_FilteringRuleSummary(
      {@JsonKey(name: 'created') this.createdCount,
      @JsonKey(name: 'not_created') this.notCreatedCount,
      @JsonKey(name: 'deleted') this.deletedCount,
      @JsonKey(name: 'not_deleted') this.notDeletedCount});

  factory _$_FilteringRuleSummary.fromJson(Map<String, dynamic> json) =>
      _$$_FilteringRuleSummaryFromJson(json);

  /// The count of created filtering rules.
  @override
  @JsonKey(name: 'created')
  final int? createdCount;

  /// The count of not created filtering rules.
  @override
  @JsonKey(name: 'not_created')
  final int? notCreatedCount;

  /// The count of deleted filtering rules.
  @override
  @JsonKey(name: 'deleted')
  final int? deletedCount;

  /// The count of not deleted filtering rules.
  @override
  @JsonKey(name: 'not_deleted')
  final int? notDeletedCount;

  @override
  String toString() {
    return 'FilteringRuleSummary(createdCount: $createdCount, notCreatedCount: $notCreatedCount, deletedCount: $deletedCount, notDeletedCount: $notDeletedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilteringRuleSummary &&
            (identical(other.createdCount, createdCount) ||
                other.createdCount == createdCount) &&
            (identical(other.notCreatedCount, notCreatedCount) ||
                other.notCreatedCount == notCreatedCount) &&
            (identical(other.deletedCount, deletedCount) ||
                other.deletedCount == deletedCount) &&
            (identical(other.notDeletedCount, notDeletedCount) ||
                other.notDeletedCount == notDeletedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdCount, notCreatedCount,
      deletedCount, notDeletedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilteringRuleSummaryCopyWith<_$_FilteringRuleSummary> get copyWith =>
      __$$_FilteringRuleSummaryCopyWithImpl<_$_FilteringRuleSummary>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilteringRuleSummaryToJson(
      this,
    );
  }
}

abstract class _FilteringRuleSummary implements FilteringRuleSummary {
  const factory _FilteringRuleSummary(
          {@JsonKey(name: 'created') final int? createdCount,
          @JsonKey(name: 'not_created') final int? notCreatedCount,
          @JsonKey(name: 'deleted') final int? deletedCount,
          @JsonKey(name: 'not_deleted') final int? notDeletedCount}) =
      _$_FilteringRuleSummary;

  factory _FilteringRuleSummary.fromJson(Map<String, dynamic> json) =
      _$_FilteringRuleSummary.fromJson;

  @override

  /// The count of created filtering rules.
  @JsonKey(name: 'created')
  int? get createdCount;
  @override

  /// The count of not created filtering rules.
  @JsonKey(name: 'not_created')
  int? get notCreatedCount;
  @override

  /// The count of deleted filtering rules.
  @JsonKey(name: 'deleted')
  int? get deletedCount;
  @override

  /// The count of not deleted filtering rules.
  @JsonKey(name: 'not_deleted')
  int? get notDeletedCount;
  @override
  @JsonKey(ignore: true)
  _$$_FilteringRuleSummaryCopyWith<_$_FilteringRuleSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
