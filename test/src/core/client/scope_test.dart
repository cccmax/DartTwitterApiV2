// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/scope.dart';

void main() {
  test('.name', () {
    expect(Scope.tweetRead.name, 'tweetRead');
    expect(Scope.tweetWrite.name, 'tweetWrite');
    expect(Scope.tweetModerateWrite.name, 'tweetModerateWrite');
    expect(Scope.usersRead.name, 'usersRead');
    expect(Scope.followsRead.name, 'followsRead');
    expect(Scope.followsWrite.name, 'followsWrite');
    expect(Scope.offlineAccess.name, 'offlineAccess');
    expect(Scope.spaceRead.name, 'spaceRead');
    expect(Scope.muteRead.name, 'muteRead');
    expect(Scope.muteWrite.name, 'muteWrite');
    expect(Scope.likeRead.name, 'likeRead');
    expect(Scope.likeWrite.name, 'likeWrite');
    expect(Scope.listRead.name, 'listRead');
    expect(Scope.listWrite.name, 'listWrite');
    expect(Scope.blockRead.name, 'blockRead');
    expect(Scope.blockWrite.name, 'blockWrite');
    expect(Scope.bookmarkRead.name, 'bookmarkRead');
    expect(Scope.bookmarkWrite.name, 'bookmarkWrite');
    expect(Scope.directMessageRead.name, 'directMessageRead');
    expect(Scope.directMessageWrite.name, 'directMessageWrite');
  });

  test('.value', () {
    expect(Scope.tweetRead.value, 'tweet.read');
    expect(Scope.tweetWrite.value, 'tweet.write');
    expect(Scope.tweetModerateWrite.value, 'tweet.moderate.write');
    expect(Scope.usersRead.value, 'users.read');
    expect(Scope.followsRead.value, 'follows.read');
    expect(Scope.followsWrite.value, 'follows.write');
    expect(Scope.offlineAccess.value, 'offline.access');
    expect(Scope.spaceRead.value, 'space.read');
    expect(Scope.muteRead.value, 'mute.read');
    expect(Scope.muteWrite.value, 'mute.write');
    expect(Scope.likeRead.value, 'like.read');
    expect(Scope.likeWrite.value, 'like.write');
    expect(Scope.listRead.value, 'list.read');
    expect(Scope.listWrite.value, 'list.write');
    expect(Scope.blockRead.value, 'block.read');
    expect(Scope.blockWrite.value, 'block.write');
    expect(Scope.bookmarkRead.value, 'bookmark.read');
    expect(Scope.bookmarkWrite.value, 'bookmark.write');
    expect(Scope.directMessageRead.value, 'dm.read');
    expect(Scope.directMessageWrite.value, 'dm.write');
  });

  group('.valueOf', () {
    test('when normal case', () {
      expect(Scope.valueOf('users.read'), Scope.usersRead);
    });

    test('with invalid scope name', () {
      expect(() => Scope.valueOf('test'), throwsA(isA<ArgumentError>()));
    });
  });
}
