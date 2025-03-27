// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceData _$PlaceDataFromJson(Map<String, dynamic> json) {
  return _PlaceData.fromJson(json);
}

/// @nodoc
mixin _$PlaceData {
  /// The unique identifier of the expanded place, if this is a point of
  /// interest tagged in the Tweet.
  ///
  /// ## How It Can Be Used
  ///
  /// - Use this to programmatically retrieve a place.
  String get id => throw _privateConstructorUsedError;

  /// A longer-form detailed place name.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific place name.
  String get fullName => throw _privateConstructorUsedError;

  /// The short name of this place.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific place name
  String? get name => throw _privateConstructorUsedError;

  /// Specified the particular type of information represented by this place
  /// information, such as a city name, or a point of interest.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific type of place.
  PlaceType? get placeType => throw _privateConstructorUsedError;

  /// The full-length name of the country this place belongs to.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by country name.
  @JsonKey(name: 'country')
  String? get countryName => throw _privateConstructorUsedError;

  /// The ISO Alpha-2 country code this place belongs to.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by country code.
  @JsonKey(name: 'country_code')
  Country? get country => throw _privateConstructorUsedError;

  /// Contains place details in GeoJSON format.
  PlaceGeo? get geo => throw _privateConstructorUsedError;

  /// Returns the identifiers of known places that contain the referenced
  /// place.
  List<String>? get containedWithin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDataCopyWith<PlaceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDataCopyWith<$Res> {
  factory $PlaceDataCopyWith(PlaceData value, $Res Function(PlaceData) then) =
      _$PlaceDataCopyWithImpl<$Res, PlaceData>;
  @useResult
  $Res call(
      {String id,
      String fullName,
      String? name,
      PlaceType? placeType,
      @JsonKey(name: 'country') String? countryName,
      @JsonKey(name: 'country_code') Country? country,
      PlaceGeo? geo,
      List<String>? containedWithin});

  $PlaceGeoCopyWith<$Res>? get geo;
}

/// @nodoc
class _$PlaceDataCopyWithImpl<$Res, $Val extends PlaceData>
    implements $PlaceDataCopyWith<$Res> {
  _$PlaceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? name = freezed,
    Object? placeType = freezed,
    Object? countryName = freezed,
    Object? country = freezed,
    Object? geo = freezed,
    Object? containedWithin = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      placeType: freezed == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      geo: freezed == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as PlaceGeo?,
      containedWithin: freezed == containedWithin
          ? _value.containedWithin
          : containedWithin // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceGeoCopyWith<$Res>? get geo {
    if (_value.geo == null) {
      return null;
    }

    return $PlaceGeoCopyWith<$Res>(_value.geo!, (value) {
      return _then(_value.copyWith(geo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlaceDataCopyWith<$Res> implements $PlaceDataCopyWith<$Res> {
  factory _$$_PlaceDataCopyWith(
          _$_PlaceData value, $Res Function(_$_PlaceData) then) =
      __$$_PlaceDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String? name,
      PlaceType? placeType,
      @JsonKey(name: 'country') String? countryName,
      @JsonKey(name: 'country_code') Country? country,
      PlaceGeo? geo,
      List<String>? containedWithin});

  @override
  $PlaceGeoCopyWith<$Res>? get geo;
}

/// @nodoc
class __$$_PlaceDataCopyWithImpl<$Res>
    extends _$PlaceDataCopyWithImpl<$Res, _$_PlaceData>
    implements _$$_PlaceDataCopyWith<$Res> {
  __$$_PlaceDataCopyWithImpl(
      _$_PlaceData _value, $Res Function(_$_PlaceData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? name = freezed,
    Object? placeType = freezed,
    Object? countryName = freezed,
    Object? country = freezed,
    Object? geo = freezed,
    Object? containedWithin = freezed,
  }) {
    return _then(_$_PlaceData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      placeType: freezed == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      geo: freezed == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as PlaceGeo?,
      containedWithin: freezed == containedWithin
          ? _value._containedWithin
          : containedWithin // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_PlaceData implements _PlaceData {
  const _$_PlaceData(
      {required this.id,
      required this.fullName,
      this.name,
      this.placeType,
      @JsonKey(name: 'country') this.countryName,
      @JsonKey(name: 'country_code') this.country,
      this.geo,
      final List<String>? containedWithin})
      : _containedWithin = containedWithin;

  factory _$_PlaceData.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDataFromJson(json);

  /// The unique identifier of the expanded place, if this is a point of
  /// interest tagged in the Tweet.
  ///
  /// ## How It Can Be Used
  ///
  /// - Use this to programmatically retrieve a place.
  @override
  final String id;

  /// A longer-form detailed place name.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific place name.
  @override
  final String fullName;

  /// The short name of this place.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific place name
  @override
  final String? name;

  /// Specified the particular type of information represented by this place
  /// information, such as a city name, or a point of interest.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific type of place.
  @override
  final PlaceType? placeType;

  /// The full-length name of the country this place belongs to.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by country name.
  @override
  @JsonKey(name: 'country')
  final String? countryName;

  /// The ISO Alpha-2 country code this place belongs to.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by country code.
  @override
  @JsonKey(name: 'country_code')
  final Country? country;

  /// Contains place details in GeoJSON format.
  @override
  final PlaceGeo? geo;

  /// Returns the identifiers of known places that contain the referenced
  /// place.
  final List<String>? _containedWithin;

  /// Returns the identifiers of known places that contain the referenced
  /// place.
  @override
  List<String>? get containedWithin {
    final value = _containedWithin;
    if (value == null) return null;
    if (_containedWithin is EqualUnmodifiableListView) return _containedWithin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlaceData(id: $id, fullName: $fullName, name: $name, placeType: $placeType, countryName: $countryName, country: $country, geo: $geo, containedWithin: $containedWithin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.placeType, placeType) ||
                other.placeType == placeType) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.geo, geo) || other.geo == geo) &&
            const DeepCollectionEquality()
                .equals(other._containedWithin, _containedWithin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      name,
      placeType,
      countryName,
      country,
      geo,
      const DeepCollectionEquality().hash(_containedWithin));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDataCopyWith<_$_PlaceData> get copyWith =>
      __$$_PlaceDataCopyWithImpl<_$_PlaceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceDataToJson(
      this,
    );
  }
}

abstract class _PlaceData implements PlaceData {
  const factory _PlaceData(
      {required final String id,
      required final String fullName,
      final String? name,
      final PlaceType? placeType,
      @JsonKey(name: 'country') final String? countryName,
      @JsonKey(name: 'country_code') final Country? country,
      final PlaceGeo? geo,
      final List<String>? containedWithin}) = _$_PlaceData;

  factory _PlaceData.fromJson(Map<String, dynamic> json) =
      _$_PlaceData.fromJson;

  @override

  /// The unique identifier of the expanded place, if this is a point of
  /// interest tagged in the Tweet.
  ///
  /// ## How It Can Be Used
  ///
  /// - Use this to programmatically retrieve a place.
  String get id;
  @override

  /// A longer-form detailed place name.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific place name.
  String get fullName;
  @override

  /// The short name of this place.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific place name
  String? get name;
  @override

  /// Specified the particular type of information represented by this place
  /// information, such as a city name, or a point of interest.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by a specific type of place.
  PlaceType? get placeType;
  @override

  /// The full-length name of the country this place belongs to.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by country name.
  @JsonKey(name: 'country')
  String? get countryName;
  @override

  /// The ISO Alpha-2 country code this place belongs to.
  ///
  /// ## How It Can Be Used
  ///
  /// - Classify a Tweet by country code.
  @JsonKey(name: 'country_code')
  Country? get country;
  @override

  /// Contains place details in GeoJSON format.
  PlaceGeo? get geo;
  @override

  /// Returns the identifiers of known places that contain the referenced
  /// place.
  List<String>? get containedWithin;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDataCopyWith<_$_PlaceData> get copyWith =>
      throw _privateConstructorUsedError;
}
