// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/geo/place_type.dart';

void main() {
  test('.name', () {
    expect(PlaceType.poi.name, 'poi');
    expect(PlaceType.neighborhood.name, 'neighborhood');
    expect(PlaceType.city.name, 'city');
    expect(PlaceType.admin.name, 'admin');
    expect(PlaceType.country.name, 'country');
    expect(PlaceType.unknown.name, 'unknown');
  });

  test('.value', () {
    expect(PlaceType.poi.value, 'poi');
    expect(PlaceType.neighborhood.value, 'neighborhood');
    expect(PlaceType.city.value, 'city');
    expect(PlaceType.admin.value, 'admin');
    expect(PlaceType.country.value, 'country');
    expect(PlaceType.unknown.value, 'unknown');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(PlaceType.valueOf('unknown'), PlaceType.unknown);
    });

    test('when value is unsupported', () {
      expect(() => PlaceType.valueOf('test'), throwsA(isA<UnsupportedError>()));
    });
  });
}
