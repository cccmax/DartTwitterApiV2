// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/dms/dm_event_type.dart';

void main() {
  test('.name', () {
    expect(DMEventType.messageCreate.name, 'messageCreate');
    expect(DMEventType.participantsJoin.name, 'participantsJoin');
    expect(DMEventType.participantsLeave.name, 'participantsLeave');
  });

  test('.value', () {
    expect(DMEventType.messageCreate.value, 'MessageCreate');
    expect(DMEventType.participantsJoin.value, 'ParticipantsJoin');
    expect(DMEventType.participantsLeave.value, 'ParticipantsLeave');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(DMEventType.valueOf('MessageCreate'), DMEventType.messageCreate);
    });

    test('when value is unsupported', () {
      expect(
          () => DMEventType.valueOf('test'), throwsA(isA<UnsupportedError>()));
    });
  });
}
