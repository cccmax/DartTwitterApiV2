// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/conjunction/singleton/is_operator_type.dart';

void main() {
  test('.name', () {
    expect(IsOperatorType.retweet.name, 'retweet');
    expect(IsOperatorType.reply.name, 'reply');
    expect(IsOperatorType.quote.name, 'quote');
    expect(IsOperatorType.verified.name, 'verified');
    expect(IsOperatorType.nullcast.name, 'nullcast');
  });
}
