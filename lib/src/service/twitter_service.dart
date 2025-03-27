// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../core/client/client_context.dart';
import 'compliance/compliance_service.dart';
import 'dms/direct_messages_service.dart';
import 'geo/geo_service.dart';
import 'lists/lists_service.dart';
import 'media/media_service.dart';
import 'spaces/spaces_service.dart';
import 'trends/trends_service.dart';
import 'tweets/tweets_service.dart';
import 'users/users_service.dart';

/// The class represents the twitter services.
abstract class TwitterService {
  factory TwitterService({required ClientContext context}) =>
      _TwitterService(context: context);

  /// Returns the tweets service.
  TweetsService get tweetsService;

  /// Returns the users service.
  UsersService get usersService;

  /// Returns the spaces service.
  SpacesService get spacesService;

  /// Returns the lists service.
  ListsService get listsService;

  /// Returns the media service.
  MediaService get mediaService;

  /// Returns the direct messages service.
  DirectMessagesService get directMessagesService;

  /// Returns the geo service.
  GeoService get geoService;

  /// Returns the trends service.
  TrendsService get trendsService;

  /// Returns the compliance service.
  ComplianceService get complianceService;
}

class _TwitterService implements TwitterService {
  /// Returns the new instance of [_TwitterService].
  _TwitterService({required ClientContext context})
      : tweetsService = TweetsService(context: context),
        usersService = UsersService(context: context),
        spacesService = SpacesService(context: context),
        listsService = ListsService(context: context),
        mediaService = MediaService(context: context),
        directMessagesService = DirectMessagesService(context: context),
        geoService = GeoService(context: context),
        trendsService = TrendsService(context: context),
        complianceService = ComplianceService(context: context);

  @override
  final TweetsService tweetsService;

  @override
  final UsersService usersService;

  @override
  final SpacesService spacesService;

  @override
  final ListsService listsService;

  @override
  final MediaService mediaService;

  @override
  final DirectMessagesService directMessagesService;

  @override
  final GeoService geoService;

  @override
  final TrendsService trendsService;

  @override
  final ComplianceService complianceService;
}
