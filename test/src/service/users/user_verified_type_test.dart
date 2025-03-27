// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/users/user_verified_type.dart';

void main() {
  test('.name', () {
    expect(UserVerifiedType.blue.name, 'blue');
    expect(UserVerifiedType.government.name, 'government');
    expect(UserVerifiedType.business.name, 'business');
    expect(UserVerifiedType.none.name, 'none');
  });

  test('.value', () {
    expect(UserVerifiedType.blue.value, 'blue');
    expect(UserVerifiedType.government.value, 'government');
    expect(UserVerifiedType.business.value, 'business');
    expect(UserVerifiedType.none.value, 'none');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(UserVerifiedType.valueOf('business'), UserVerifiedType.business);
    });

    test('when value is unsupported', () {
      expect(() => UserVerifiedType.valueOf('test'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
