// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/dms/dm_event_field.dart';

void main() {
  test('.name', () {
    expect(DMEventField.id.name, 'id');
    expect(DMEventField.text.name, 'text');
    expect(DMEventField.conversationId.name, 'conversationId');
    expect(DMEventField.senderId.name, 'senderId');
    expect(DMEventField.participantIds.name, 'participantIds');
    expect(DMEventField.referencedTweets.name, 'referencedTweets');
    expect(DMEventField.attachments.name, 'attachments');
    expect(DMEventField.createdAt.name, 'createdAt');
  });

  test('.value', () {
    expect(DMEventField.id.value, 'id');
    expect(DMEventField.text.value, 'text');
    expect(DMEventField.conversationId.value, 'dm_conversation_id');
    expect(DMEventField.senderId.value, 'sender_id');
    expect(DMEventField.participantIds.value, 'participant_ids');
    expect(DMEventField.referencedTweets.value, 'referenced_tweets');
    expect(DMEventField.attachments.value, 'attachments');
    expect(DMEventField.createdAt.value, 'created_at');
  });

  group('.valueOf', () {
    test('normal case', () {
      expect(DMEventField.valueOf('sender_id'), DMEventField.senderId);
    });

    test('when value is unsupported', () {
      expect(
          () => DMEventField.valueOf('test'), throwsA(isA<UnsupportedError>()));
    });
  });
}
