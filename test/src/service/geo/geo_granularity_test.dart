// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/geo/geo_granularity.dart';

void main() {
  test('.name', () {
    expect(GeoGranularity.neighborhood.name, 'neighborhood');
    expect(GeoGranularity.city.name, 'city');
    expect(GeoGranularity.admin.name, 'admin');
    expect(GeoGranularity.country.name, 'country');
  });

  test('.value', () {
    expect(GeoGranularity.neighborhood.value, 'neighborhood');
    expect(GeoGranularity.city.value, 'city');
    expect(GeoGranularity.admin.value, 'admin');
    expect(GeoGranularity.country.value, 'country');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(GeoGranularity.valueOf('admin'), GeoGranularity.admin);
    });

    test('when value is unsupported', () {
      expect(() => GeoGranularity.valueOf('test'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
