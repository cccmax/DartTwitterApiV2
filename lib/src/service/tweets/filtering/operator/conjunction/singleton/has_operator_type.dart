// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum HasOperatorType {
  hashtags('hashtags'),
  cashtags('cashtags'),
  links('links'),
  mentions('mentions'),
  media('media'),
  images('images'),
  videoLink('video_link'),
  geo('geo');

  /// The value
  final String value;

  const HasOperatorType(this.value);
}
