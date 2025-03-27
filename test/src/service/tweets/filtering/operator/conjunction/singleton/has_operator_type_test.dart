// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/has_operator_type.dart';

void main() {
  test('.name', () {
    expect(HasOperatorType.hashtags.name, 'hashtags');
    expect(HasOperatorType.cashtags.name, 'cashtags');
    expect(HasOperatorType.links.name, 'links');
    expect(HasOperatorType.mentions.name, 'mentions');
    expect(HasOperatorType.media.name, 'media');
    expect(HasOperatorType.images.name, 'images');
    expect(HasOperatorType.videoLink.name, 'videoLink');
    expect(HasOperatorType.geo.name, 'geo');
  });

  test('.value', () {
    expect(HasOperatorType.hashtags.value, 'hashtags');
    expect(HasOperatorType.cashtags.value, 'cashtags');
    expect(HasOperatorType.links.value, 'links');
    expect(HasOperatorType.mentions.value, 'mentions');
    expect(HasOperatorType.media.value, 'media');
    expect(HasOperatorType.images.value, 'images');
    expect(HasOperatorType.videoLink.value, 'video_link');
    expect(HasOperatorType.geo.value, 'geo');
  });
}
