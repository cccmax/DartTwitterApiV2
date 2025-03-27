// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'object_adaptor.dart';

class UserObjectAdaptor implements ObjectAdaptor {
  /// Returns the new instance of [UserObjectAdaptor].
  const UserObjectAdaptor();

  @override
  Map<String, dynamic> execute(final Map<String, dynamic> source) {
    final result = {
      'data': {
        'id': source['id_str'],
        'name': source['name'],
        'username': source['screen_name'],
        'description': source['description'],
        'url': source['url'],
        'profile_image_url': source['profile_image_url_https'],
        'location': source['location'],
        'protected': source['protected'],
        'verified': source['verified'],
        'public_metrics': {
          'followers_count': source['followers_count'],
          'following_count': source['friends_count'],
          'tweet_count': source['statuses_count'],
          'listed_count': source['listed_count'],
        },
      }
    };

    final withheldCountryCodes = source['withheld_in_countries'];
    if (withheldCountryCodes != null && withheldCountryCodes.isNotEmpty) {
      result['data']!['withheld'] = {
        'country_codes': withheldCountryCodes,
      };
    }

    return result;
  }
}
