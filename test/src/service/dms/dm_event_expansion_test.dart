// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/dms/dm_event_expansion.dart';

void main() {
  test('.name', () {
    expect(DMEventExpansion.attachmentsMediaKeys.name, 'attachmentsMediaKeys');
    expect(DMEventExpansion.referencedTweetsId.name, 'referencedTweetsId');
    expect(DMEventExpansion.senderId.name, 'senderId');
    expect(DMEventExpansion.participantIds.name, 'participantIds');
  });

  test('.value', () {
    expect(
        DMEventExpansion.attachmentsMediaKeys.value, 'attachments.media_keys');
    expect(DMEventExpansion.referencedTweetsId.value, 'referenced_tweets.id');
    expect(DMEventExpansion.senderId.value, 'sender_id');
    expect(DMEventExpansion.participantIds.value, 'participant_ids');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(DMEventExpansion.valueOf('sender_id'), DMEventExpansion.senderId);
    });

    test('when value is unsupported', () {
      expect(() => DMEventExpansion.valueOf('test'),
          throwsA(isA<UnsupportedError>()));
    });
  });
}
