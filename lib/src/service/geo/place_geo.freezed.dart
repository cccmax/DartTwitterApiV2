// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceGeo _$PlaceGeoFromJson(Map<String, dynamic> json) {
  return _PlaceGeo.fromJson(json);
}

/// @nodoc
mixin _$PlaceGeo {
  /// The place type.
  String get type => throw _privateConstructorUsedError;

  /// The bounding box.
  List<double> get bbox => throw _privateConstructorUsedError;

  /// The place properties.
  Map<String, dynamic> get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceGeoCopyWith<PlaceGeo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceGeoCopyWith<$Res> {
  factory $PlaceGeoCopyWith(PlaceGeo value, $Res Function(PlaceGeo) then) =
      _$PlaceGeoCopyWithImpl<$Res, PlaceGeo>;
  @useResult
  $Res call({String type, List<double> bbox, Map<String, dynamic> properties});
}

/// @nodoc
class _$PlaceGeoCopyWithImpl<$Res, $Val extends PlaceGeo>
    implements $PlaceGeoCopyWith<$Res> {
  _$PlaceGeoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? bbox = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<double>,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceGeoCopyWith<$Res> implements $PlaceGeoCopyWith<$Res> {
  factory _$$_PlaceGeoCopyWith(
          _$_PlaceGeo value, $Res Function(_$_PlaceGeo) then) =
      __$$_PlaceGeoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<double> bbox, Map<String, dynamic> properties});
}

/// @nodoc
class __$$_PlaceGeoCopyWithImpl<$Res>
    extends _$PlaceGeoCopyWithImpl<$Res, _$_PlaceGeo>
    implements _$$_PlaceGeoCopyWith<$Res> {
  __$$_PlaceGeoCopyWithImpl(
      _$_PlaceGeo _value, $Res Function(_$_PlaceGeo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? bbox = null,
    Object? properties = null,
  }) {
    return _then(_$_PlaceGeo(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      bbox: null == bbox
          ? _value._bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<double>,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceGeo implements _PlaceGeo {
  const _$_PlaceGeo(
      {required this.type,
      required final List<double> bbox,
      required final Map<String, dynamic> properties})
      : _bbox = bbox,
        _properties = properties;

  factory _$_PlaceGeo.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceGeoFromJson(json);

  /// The place type.
  @override
  final String type;

  /// The bounding box.
  final List<double> _bbox;

  /// The bounding box.
  @override
  List<double> get bbox {
    if (_bbox is EqualUnmodifiableListView) return _bbox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bbox);
  }

  /// The place properties.
  final Map<String, dynamic> _properties;

  /// The place properties.
  @override
  Map<String, dynamic> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  @override
  String toString() {
    return 'PlaceGeo(type: $type, bbox: $bbox, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceGeo &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._bbox, _bbox) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_bbox),
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceGeoCopyWith<_$_PlaceGeo> get copyWith =>
      __$$_PlaceGeoCopyWithImpl<_$_PlaceGeo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceGeoToJson(
      this,
    );
  }
}

abstract class _PlaceGeo implements PlaceGeo {
  const factory _PlaceGeo(
      {required final String type,
      required final List<double> bbox,
      required final Map<String, dynamic> properties}) = _$_PlaceGeo;

  factory _PlaceGeo.fromJson(Map<String, dynamic> json) = _$_PlaceGeo.fromJson;

  @override

  /// The place type.
  String get type;
  @override

  /// The bounding box.
  List<double> get bbox;
  @override

  /// The place properties.
  Map<String, dynamic> get properties;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceGeoCopyWith<_$_PlaceGeo> get copyWith =>
      throw _privateConstructorUsedError;
}
