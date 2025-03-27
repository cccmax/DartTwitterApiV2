// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/client/client_context.dart';
import '../../core/client/user_context.dart';
import '../base_service.dart';
import '../common/delete_state_data.dart';
import '../common/follow_state_data.dart';
import '../common/member_state_data.dart';
import '../common/pinned_state_data.dart';
import '../common/update_state_data.dart';
import '../pagination/bidirectional_pagination.dart';
import '../response/twitter_response.dart';
import '../tweets/tweet_data.dart';
import '../tweets/tweet_expansion.dart';
import '../tweets/tweet_field.dart';
import '../tweets/tweet_meta.dart';
import '../users/user_data.dart';
import '../users/user_expansion.dart';
import '../users/user_field.dart';
import '../users/user_meta.dart';
import 'list_data.dart';
import 'list_expansion.dart';
import 'list_field.dart';
import 'list_meta.dart';

/// This class provides methods to easily access endpoints based on List.
abstract class ListsService {
  /// Returns the new instance of [ListsService].
  factory ListsService({required ClientContext context}) =>
      _ListsService(context: context);

  /// Returns the details of a specified List.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List to lookup.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned List. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the List data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original user object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with the users object. The user
  ///                 fields will only be returned if you have included
  ///                 expansions=owner_id query parameter in your request. You
  ///                 will find this ID and all additional user fields in the
  ///                 included data object.
  ///
  /// - [listFields]: This fields parameter enables you to select which specific
  ///                 List fields will deliver with each returned List objects.
  ///                 Specify the desired fields in a comma-separated list
  ///                 without spaces between commas and fields. These specified
  ///                 List fields will display directly in the List data
  ///                 objects.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    75 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-lists-id
  Future<TwitterResponse<ListData, void>> lookupById({
    required String listId,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
  });

  /// Returns all Lists owned by the specified user.
  ///
  /// The value returned when the [paging] callback is specified is
  /// the first object obtained that started the paging process. The value
  /// obtained in the paging process is passed to the [paging] callback
  /// function as a `PagingEvent` object.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID whose owned Lists you would like to retrieve.
  ///
  /// - [maxResults]: The maximum number of results to be returned per page.
  ///                 This can be a number between 1 and 100. By default,
  ///                 each page will return 100 results.
  ///
  /// - [paginationToken]: Used to request the next page of results if all
  ///                      results weren't returned with the latest request, or
  ///                      to go back to the previous page of results. To return
  ///                      the next page, pass the `next_token` returned in your
  ///                      previous response. To go back one page, pass the
  ///                      `previous_token` returned in your previous response.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned List. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the List data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original user object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with the users object. The user
  ///                 fields will only be returned if you have included
  ///                 expansions=owner_id query parameter in your request. You
  ///                 will find this ID and all additional user fields in the
  ///                 included data object.
  ///
  /// - [listFields]: This fields parameter enables you to select which specific
  ///                 List fields will deliver with each returned List objects.
  ///                 Specify the desired fields in a comma-separated list
  ///                 without spaces between commas and fields. These specified
  ///                 List fields will display directly in the List data
  ///                 objects.
  ///
  /// - [paging]: If this callback function is specified, paging is
  ///             performed continuously until certain conditions are met.
  ///             This paging function is bi-directional,
  ///             both forward and backward, and allows for safe paging.
  ///             The response and other metadata obtained when paging is
  ///             performed is passed to the callback function as
  ///             `PagingEvent` object. So you can get the result of paging
  ///             from `PagingEvent` object. Also, the direction and continuity
  ///             of paging can be controlled by returning
  ///             `PaginationControl` object in the `paging` callback function.
  ///             Please use `PaginationControl.forward()` to continue paging
  ///             and move forward, or use `PaginationControl.backward()`
  ///             to move backward. And be sure to return
  ///             `PaginationControl.stop()` to terminate paging on
  ///             arbitrary conditions, otherwise paging continues until the
  ///             next page runs out.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/owned_lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    15 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    15 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-users-id-owned_lists
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupOwnedBy({
    required String userId,
    int? maxResults,
    String? paginationToken,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
    Paging<List<ListData>, ListMeta>? paging,
  });

  /// Enables the authenticated user to pin a List.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are pinning a List on behalf of.
  ///             It must match your own user ID or that of an authenticating
  ///             user, meaning that you must pass the Access Tokens associated
  ///             with the user ID when authenticating your request.
  ///
  /// - [listId]: The ID of the List that you would like the user id to pin.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/owned_lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/post-users-id-pinned-lists
  Future<TwitterResponse<PinnedStateData, void>> createPinnedList(
      {required String userId, required String listId});

  /// Enables the authenticated user to unpin a List.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are unpin a List on behalf of. It must
  ///             match your own user ID or that of an authenticating user,
  ///             meaning that you must pass the Access Tokens associated with
  ///             the user ID when authenticating your request.
  ///
  /// - [listId]: The ID of the List that you would like the user id to unpin.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/pinned_lists/:list_id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/delete-users-id-pinned-lists-list_id
  Future<TwitterResponse<PinnedStateData, void>> destroyPinnedList(
      {required String userId, required String listId});

  /// Returns the Lists pinned by a specified user.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID whose pinned Lists you would like to retrieve.
  ///             The user’s ID must correspond to the user ID of the
  ///             authenticating user, meaning that you must pass the Access
  ///             Tokens associated with the user ID when authenticating your
  ///             request.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned List. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the List data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original user object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with the users object. The user
  ///                 fields will only be returned if you have included
  ///                 expansions=owner_id query parameter in your request. You
  ///                 will find this ID and all additional user fields in the
  ///                 included data object.
  ///
  /// - [listFields]: This fields parameter enables you to select which specific
  ///                 List fields will deliver with each returned List objects.
  ///                 Specify the desired fields in a comma-separated list
  ///                 without spaces between commas and fields. These specified
  ///                 List fields will display directly in the List data
  ///                 objects.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/pinned_lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    15 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/get-users-id-pinned_lists
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupPinnedLists({
    required String userId,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
  });

  /// Returns a list of Tweets from the specified List.
  ///
  /// The value returned when the [paging] callback is specified is
  /// the first object obtained that started the paging process. The value
  /// obtained in the paging process is passed to the [paging] callback
  /// function as a `PagingEvent` object.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List whose Tweets you would like to retrieve.
  ///
  /// - [maxResults]: The maximum number of results to be returned per page.
  ///                 This can be a number between 1 and 100. By default,
  ///                 each page will return 100 results.
  ///
  /// - [paginationToken]: Used to request the next page of results if all
  ///                      results weren't returned with the latest request, or
  ///                      to go back to the previous page of results. To return
  ///                      the next page, pass the next_token returned in your
  ///                      previous response. To go back one page, pass the
  ///                      previous_token returned in your previous response.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned users. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the user data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original Tweet object.
  ///
  /// - [tweetFields]: Expansions enable you to request additional data objects
  ///                  that relate to the originally returned Tweets. Submit a
  ///                  list of desired expansions in a comma-separated list
  ///                  without spaces. The ID that represents the expanded data
  ///                  object will be included directly in the Tweet data
  ///                  object, but the expanded object metadata will be returned
  ///                  within the includes response object, and will also
  ///                  include the ID so that you can match this data object to
  ///                  the original Tweet object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with the users object. These
  ///                 specified user fields will display directly in the user
  ///                 data objects.
  ///
  /// - [paging]: If this callback function is specified, paging is
  ///             performed continuously until certain conditions are met.
  ///             This paging function is bi-directional,
  ///             both forward and backward, and allows for safe paging.
  ///             The response and other metadata obtained when paging is
  ///             performed is passed to the callback function as
  ///             `PagingEvent` object. So you can get the result of paging
  ///             from `PagingEvent` object. Also, the direction and continuity
  ///             of paging can be controlled by returning
  ///             `PaginationControl` object in the `paging` callback function.
  ///             Please use `PaginationControl.forward()` to continue paging
  ///             and move forward, or use `PaginationControl.backward()`
  ///             to move backward. And be sure to return
  ///             `PaginationControl.stop()` to terminate paging on
  ///             arbitrary conditions, otherwise paging continues until the
  ///             next page runs out.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id/tweets
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    900 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    900 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-tweets/api-reference/get-lists-id-tweets
  Future<TwitterResponse<List<TweetData>, TweetMeta>> lookupTweets({
    required String listId,
    int? maxResults,
    String? paginationToken,
    List<TweetExpansion>? expansions,
    List<TweetField>? tweetFields,
    List<UserField>? userFields,
    Paging<List<TweetData>, TweetMeta>? paging,
  });

  /// Enables the authenticated user to create a public List.
  ///
  /// ## Parameters
  ///
  /// - [name]: The name of the List you wish to create.
  ///
  /// - [description]: Description of the List.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists
  Future<TwitterResponse<ListData, void>> createPublicList(
      {required String name, String? description});

  /// Enables the authenticated user to create a private List.
  ///
  /// ## Parameters
  ///
  /// - [name]: The name of the List you wish to create.
  ///
  /// - [description]: Description of the List.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists
  Future<TwitterResponse<ListData, void>> createPrivateList(
      {required String name, String? description});

  /// Enables the authenticated user to delete a List that they own.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List to be deleted.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id
  Future<TwitterResponse<DeleteStateData, void>> destroyList(
      {required String listId});

  /// Enables the authenticated user to update the meta data of a specified List
  /// that they own as a public scope.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List to be updated.
  ///
  /// - [name]: Updates the name of the List.
  ///
  /// - [description]: Updates the description of the List.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id
  Future<TwitterResponse<UpdateStateData, void>> updateListAsPublic(
      {required String listId, String? name, String? description});

  /// Enables the authenticated user to update the meta data of a specified List
  /// that they own as a private scope.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List to be updated.
  ///
  /// - [name]: Updates the name of the List.
  ///
  /// - [description]: Updates the description of the List.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id
  Future<TwitterResponse<UpdateStateData, void>> updateListAsPrivate(
      {required String listId, String? name, String? description});

  /// Enables the authenticated user to follow a List.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are following a List on behalf of.
  ///             It must match your own user ID or that of an authenticating
  ///             user, meaning that you must pass the Access Tokens associated
  ///             with the user ID when authenticating your request.
  ///
  /// - [listId]: The ID of the List that you would like the user id to follow.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/followed_lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/post-users-id-followed-lists
  Future<TwitterResponse<FollowStateData, void>> createFollow(
      {required String userId, required String listId});

  /// Enables the authenticated user to unfollow a List.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID who you are unfollowing a List on behalf of.
  ///             It must match your own user ID or that of an authenticating
  ///             user, meaning that you must pass the Access Tokens associated
  ///             with the user ID when authenticating your request.
  ///
  /// - [listId]: The ID of the List that you would like the user id to
  ///             unfollow.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/followed_lists/:list_id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    50 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/delete-users-id-followed-lists-list_id
  Future<TwitterResponse<FollowStateData, void>> destroyFollow(
      {required String userId, required String listId});

  /// Returns a list of users who are followers of the specified List.
  ///
  /// The value returned when the [paging] callback is specified is
  /// the first object obtained that started the paging process. The value
  /// obtained in the paging process is passed to the [paging] callback
  /// function as a `PagingEvent` object.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List whose followers you would like to retrieve.
  ///
  /// - [maxResults]: The maximum number of results to be returned per page.
  ///                 This can be a number between 1 and 100. By default,
  ///                 each page will return 100 results.
  ///
  /// - [paginationToken]: Used to request the next page of results if all
  ///                      results weren't returned with the latest request,
  ///                      or to go back to the previous page of results.
  ///                      To return the next page, pass the next_token returned
  ///                      in your previous response. To go back one page, pass
  ///                      the previous_token returned in your previous
  ///                      response.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned users. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the user data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original Tweet object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with each returned users objects.
  ///                 These specified user fields will display directly in the
  ///                 user data objects.
  ///
  /// - [paging]: If this callback function is specified, paging is
  ///             performed continuously until certain conditions are met.
  ///             This paging function is bi-directional,
  ///             both forward and backward, and allows for safe paging.
  ///             The response and other metadata obtained when paging is
  ///             performed is passed to the callback function as
  ///             `PagingEvent` object. So you can get the result of paging
  ///             from `PagingEvent` object. Also, the direction and continuity
  ///             of paging can be controlled by returning
  ///             `PaginationControl` object in the `paging` callback function.
  ///             Please use `PaginationControl.forward()` to continue paging
  ///             and move forward, or use `PaginationControl.backward()`
  ///             to move backward. And be sure to return
  ///             `PaginationControl.stop()` to terminate paging on
  ///             arbitrary conditions, otherwise paging continues until the
  ///             next page runs out.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id/followers
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    180 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    180 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/get-lists-id-followers
  Future<TwitterResponse<List<UserData>, UserMeta>> lookupFollowers({
    required String listId,
    int? maxResults,
    String? paginationToken,
    List<UserExpansion>? expansions,
    List<UserField>? userFields,
    Paging<List<UserData>, UserMeta>? paging,
  });

  /// Returns all Lists a specified user follows.
  ///
  /// The value returned when the [paging] callback is specified is
  /// the first object obtained that started the paging process. The value
  /// obtained in the paging process is passed to the [paging] callback
  /// function as a `PagingEvent` object.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID whose followed Lists you would like to retrieve.
  ///
  /// - [maxResults]: The maximum number of results to be returned per page.
  ///                 This can be a number between 1 and 100. By default,
  ///                 each page will return 100 results.
  ///
  /// - [paginationToken]: Used to request the next page of results if all
  ///                      results weren't returned with the latest request,
  ///                      or to go back to the previous page of results.
  ///                      To return the next page, pass the next_token returned
  ///                      in your previous response. To go back one page, pass
  ///                      the previous_token returned in your previous
  ///                      response.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned List. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the List data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original user object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with the users object. The user
  ///                 fields will only be returned if you have included
  ///                 expansions=owner_id query parameter in your request. You
  ///                 will find this ID and all additional user fields in the
  ///                 included data object.
  ///
  /// - [listFields]: This fields parameter enables you to select which specific
  ///                 List fields will deliver with each returned List objects.
  ///                 Specify the desired fields in a comma-separated list
  ///                 without spaces between commas and fields. These specified
  ///                 List fields will display directly in the List data
  ///                 objects.
  ///
  /// - [paging]: If this callback function is specified, paging is
  ///             performed continuously until certain conditions are met.
  ///             This paging function is bi-directional,
  ///             both forward and backward, and allows for safe paging.
  ///             The response and other metadata obtained when paging is
  ///             performed is passed to the callback function as
  ///             `PagingEvent` object. So you can get the result of paging
  ///             from `PagingEvent` object. Also, the direction and continuity
  ///             of paging can be controlled by returning
  ///             `PaginationControl` object in the `paging` callback function.
  ///             Please use `PaginationControl.forward()` to continue paging
  ///             and move forward, or use `PaginationControl.backward()`
  ///             to move backward. And be sure to return
  ///             `PaginationControl.stop()` to terminate paging on
  ///             arbitrary conditions, otherwise paging continues until the
  ///             next page runs out.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/followed_lists
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    15 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    15 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/get-users-id-followed_lists
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupFollowedLists({
    required String userId,
    int? maxResults,
    String? paginationToken,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
    Paging<List<ListData>, ListMeta>? paging,
  });

  /// Enables the authenticated user to add a member to a List they own.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List you are adding a member to.
  ///
  /// - [userId]: The ID of the user you wish to add as a member of the List.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id/members
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/post-lists-id-members
  Future<TwitterResponse<MemberStateData, void>> createMember(
      {required String listId, required String userId});

  /// Enables the authenticated user to remove a member from a List they own.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List you are removing a member from.
  ///
  /// - [userId]: The ID of the user you wish to remove as a member of the List.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id/members/:user_id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.write
  ///
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    300 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/delete-lists-id-members-user_id
  Future<TwitterResponse<MemberStateData, void>> destroyMember(
      {required String listId, required String userId});

  /// Returns a list of users who are members of the specified List.
  ///
  /// The value returned when the [paging] callback is specified is
  /// the first object obtained that started the paging process. The value
  /// obtained in the paging process is passed to the [paging] callback
  /// function as a `PagingEvent` object.
  ///
  /// ## Parameters
  ///
  /// - [listId]: The ID of the List whose members you would like to retrieve.
  ///
  /// - [maxResults]: The maximum number of results to be returned per page.
  ///                 This can be a number between 1 and 100. By default,
  ///                 each page will return 100 results.
  ///
  /// - [paginationToken]: Used to request the next page of results if all
  ///                      results weren't returned with the latest request,
  ///                      or to go back to the previous page of results. To
  ///                      return the next page, pass the next_token returned
  ///                      in your previous response. To go back one page, pass
  ///                      the previous_token returned in your previous
  ///                      response.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned users. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the user data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original Tweet object.
  ///
  /// - [tweetFields]: This fields parameter enables you to select which
  ///                  specific Tweet fields will deliver in each returned
  ///                  pinned Tweet. The Tweet fields will only return if the
  ///                  user has a pinned Tweet and if you've also included the
  ///                  `expansions=pinned_tweet_id` query parameter in your
  ///                  request. While the referenced Tweet ID will be located
  ///                  in the original Tweet object, you will find this ID and
  ///                  all additional Tweet fields in the includes data object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///                 user fields will deliver with each returned users objects.
  ///                 These specified user fields will display directly in the
  ///                 user data objects.
  ///
  /// - [paging]: If this callback function is specified, paging is
  ///             performed continuously until certain conditions are met.
  ///             This paging function is bi-directional,
  ///             both forward and backward, and allows for safe paging.
  ///             The response and other metadata obtained when paging is
  ///             performed is passed to the callback function as
  ///             `PagingEvent` object. So you can get the result of paging
  ///             from `PagingEvent` object. Also, the direction and continuity
  ///             of paging can be controlled by returning
  ///             `PaginationControl` object in the `paging` callback function.
  ///             Please use `PaginationControl.forward()` to continue paging
  ///             and move forward, or use `PaginationControl.backward()`
  ///             to move backward. And be sure to return
  ///             `PaginationControl.stop()` to terminate paging on
  ///             arbitrary conditions, otherwise paging continues until the
  ///             next page runs out.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/lists/:id/members
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    900 requests per 15-minute window shared among all users of your app
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    900 requests per 15-minute window per each authenticated user
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-lists-id-members
  Future<TwitterResponse<List<UserData>, UserMeta>> lookupMembers({
    required String listId,
    int? maxResults,
    String? paginationToken,
    List<UserExpansion>? expansions,
    List<TweetField>? tweetFields,
    List<UserField>? userFields,
    Paging<List<UserData>, UserMeta>? paging,
  });

  /// Returns all Lists a specified user is a member of.
  ///
  /// The value returned when the [paging] callback is specified is
  /// the first object obtained that started the paging process. The value
  /// obtained in the paging process is passed to the [paging] callback
  /// function as a `PagingEvent` object.
  ///
  /// ## Parameters
  ///
  /// - [userId]: The user ID whose List memberships you would like to retrieve.
  ///
  /// - [maxResults]: The maximum number of results to be returned per page.
  ///                 This can be a number between 1 and 100. By default, each
  ///                 page will return 100 results.
  ///
  /// - [paginationToken]: Used to request the next page of results if all
  ///                      results weren't returned with the latest request,
  ///                      or to go back to the previous page of results. To
  ///                      return the next page, pass the next_token returned
  ///                      in your previous response. To go back one page, pass
  ///                      the previous_token returned in your previous
  ///                      response.
  ///
  /// - [expansions]: Expansions enable you to request additional data objects
  ///                 that relate to the originally returned List. The ID that
  ///                 represents the expanded data object will be included
  ///                 directly in the List data object, but the expanded object
  ///                 metadata will be returned within the includes response
  ///                 object, and will also include the ID so that you can match
  ///                 this data object to the original user object.
  ///
  /// - [userFields]: This fields parameter enables you to select which specific
  ///               user fields will deliver with the users object. The user
  ///               fields will only be returned if you have included
  ///               expansions=owner_id query parameter in your request. You
  ///               will find this ID and all additional user fields in the
  ///               included data object.
  ///
  /// - [listFields]: This fields parameter enables you to select which specific
  ///                 List fields will deliver with each returned List objects.
  ///                 Specify the desired fields in a comma-separated list
  ///                 without spaces between commas and fields. These specified
  ///                 List fields will display directly in the List data
  ///                 objects.
  ///
  /// - [paging]: If this callback function is specified, paging is
  ///             performed continuously until certain conditions are met.
  ///             This paging function is bi-directional,
  ///             both forward and backward, and allows for safe paging.
  ///             The response and other metadata obtained when paging is
  ///             performed is passed to the callback function as
  ///             `PagingEvent` object. So you can get the result of paging
  ///             from `PagingEvent` object. Also, the direction and continuity
  ///             of paging can be controlled by returning
  ///             `PaginationControl` object in the `paging` callback function.
  ///             Please use `PaginationControl.forward()` to continue paging
  ///             and move forward, or use `PaginationControl.backward()`
  ///             to move backward. And be sure to return
  ///             `PaginationControl.stop()` to terminate paging on
  ///             arbitrary conditions, otherwise paging continues until the
  ///             next page runs out.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/users/:id/list_memberships
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 Authorization Code with PKCE
  /// - OAuth 2.0 App-only
  /// - OAuth 1.0a
  ///
  /// ## Required Scopes
  ///
  /// - tweet.read
  /// - users.read
  /// - list.read
  ///
  /// ## Rate Limits
  ///
  /// - **User rate limit (OAuth 2.0 user Access Token)**:
  ///    75 requests per 15-minute window per each authenticated user
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    75 requests per 15-minute window shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-users-id-list_memberships
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupMemberships({
    required String userId,
    int? maxResults,
    String? paginationToken,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
    Paging<List<ListData>, ListMeta>? paging,
  });
}

class _ListsService extends BaseService implements ListsService {
  /// Returns the new instance of [_ListsService].
  _ListsService({required super.context});

  @override
  Future<TwitterResponse<ListData, void>> lookupById({
    required String listId,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
  }) async =>
      super.transformSingleDataResponse(
        await super.get(
          UserContext.oauth2OrOAuth1,
          '/2/lists/$listId',
          queryParameters: {
            'expansions': expansions,
            'user.fields': userFields,
            'list.fields': listFields,
          },
        ),
        dataBuilder: ListData.fromJson,
      );

  @override
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupOwnedBy({
    required String userId,
    int? maxResults,
    String? paginationToken,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
    Paging<List<ListData>, ListMeta>? paging,
  }) async =>
      await super.executePaginationIfNecessary(
        UserContext.oauth2OrOAuth1,
        '/2/users/$userId/owned_lists',
        {
          'max_results': maxResults,
          'pagination_token': paginationToken,
          'expansions': expansions,
          'user.fields': userFields,
          'list.fields': listFields,
        },
        paging: paging,
        dataBuilder: ListData.fromJson,
        metaBuilder: ListMeta.fromJson,
      );

  @override
  Future<TwitterResponse<PinnedStateData, void>> createPinnedList({
    required String userId,
    required String listId,
  }) async =>
      super.transformSingleDataResponse(
        await super.post(
          UserContext.oauth2OrOAuth1,
          '/2/users/$userId/pinned_lists',
          body: {'list_id': listId},
        ),
        dataBuilder: PinnedStateData.fromJson,
      );

  @override
  Future<TwitterResponse<PinnedStateData, void>> destroyPinnedList({
    required String userId,
    required String listId,
  }) async =>
      super.transformSingleDataResponse(
        await super.delete(
          UserContext.oauth2OrOAuth1,
          '/2/users/$userId/pinned_lists/$listId',
        ),
        dataBuilder: PinnedStateData.fromJson,
      );

  @override
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupPinnedLists({
    required String userId,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
  }) async =>
      super.transformMultiDataResponse(
        await super.get(
          UserContext.oauth2OrOAuth1,
          '/2/users/$userId/pinned_lists',
          queryParameters: {
            'expansions': expansions,
            'user.fields': userFields,
            'list.fields': listFields,
          },
        ),
        dataBuilder: ListData.fromJson,
        metaBuilder: ListMeta.fromJson,
      );

  @override
  Future<TwitterResponse<List<TweetData>, TweetMeta>> lookupTweets({
    required String listId,
    int? maxResults,
    String? paginationToken,
    List<TweetExpansion>? expansions,
    List<TweetField>? tweetFields,
    List<UserField>? userFields,
    Paging<List<TweetData>, TweetMeta>? paging,
  }) async =>
      await super.executePaginationIfNecessary(
        UserContext.oauth2OrOAuth1,
        '/2/lists/$listId/tweets',
        {
          'max_results': maxResults,
          'pagination_token': paginationToken,
          'expansions': expansions,
          'tweet.fields': tweetFields,
          'user.fields': userFields,
        },
        paging: paging,
        dataBuilder: TweetData.fromJson,
        metaBuilder: TweetMeta.fromJson,
      );

  @override
  Future<TwitterResponse<ListData, void>> createPublicList({
    required String name,
    String? description,
  }) async =>
      await _createList(
        name: name,
        description: description,
        private: false,
      );

  @override
  Future<TwitterResponse<ListData, void>> createPrivateList({
    required String name,
    String? description,
  }) async =>
      await _createList(
        name: name,
        description: description,
        private: true,
      );

  @override
  Future<TwitterResponse<DeleteStateData, void>> destroyList(
          {required String listId}) async =>
      super.transformSingleDataResponse(
        await super.delete(
          UserContext.oauth2OrOAuth1,
          '/2/lists/$listId',
        ),
        dataBuilder: DeleteStateData.fromJson,
      );

  @override
  Future<TwitterResponse<UpdateStateData, void>> updateListAsPublic({
    required String listId,
    String? name,
    String? description,
  }) async =>
      await _updateList(
        listId: listId,
        name: name,
        description: description,
        private: false,
      );

  @override
  Future<TwitterResponse<UpdateStateData, void>> updateListAsPrivate({
    required String listId,
    String? name,
    String? description,
  }) async =>
      await _updateList(
        listId: listId,
        name: name,
        description: description,
        private: true,
      );

  @override
  Future<TwitterResponse<FollowStateData, void>> createFollow({
    required String userId,
    required String listId,
  }) async =>
      super.transformSingleDataResponse(
        await super.post(
          UserContext.oauth2OrOAuth1,
          '/2/users/$userId/followed_lists',
          body: {
            'list_id': listId,
          },
        ),
        dataBuilder: FollowStateData.fromJson,
      );

  @override
  Future<TwitterResponse<FollowStateData, void>> destroyFollow({
    required String userId,
    required String listId,
  }) async =>
      super.transformSingleDataResponse(
        await super.delete(
          UserContext.oauth2OrOAuth1,
          '/2/users/$userId/followed_lists/$listId',
        ),
        dataBuilder: FollowStateData.fromJson,
      );

  @override
  Future<TwitterResponse<List<UserData>, UserMeta>> lookupFollowers({
    required String listId,
    int? maxResults,
    String? paginationToken,
    List<UserExpansion>? expansions,
    List<UserField>? userFields,
    Paging<List<UserData>, UserMeta>? paging,
  }) async =>
      await super.executePaginationIfNecessary(
        UserContext.oauth2OrOAuth1,
        '/2/lists/$listId/followers',
        {
          'max_results': maxResults,
          'pagination_token': paginationToken,
          'expansions': expansions,
          'user.fields': userFields,
        },
        paging: paging,
        dataBuilder: UserData.fromJson,
        metaBuilder: UserMeta.fromJson,
      );

  @override
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupFollowedLists({
    required String userId,
    int? maxResults,
    String? paginationToken,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
    Paging<List<ListData>, ListMeta>? paging,
  }) async =>
      await super.executePaginationIfNecessary(
        UserContext.oauth2OrOAuth1,
        '/2/users/$userId/followed_lists',
        {
          'max_results': maxResults,
          'pagination_token': paginationToken,
          'expansions': expansions,
          'user.fields': userFields,
          'list.fields': listFields,
        },
        paging: paging,
        dataBuilder: ListData.fromJson,
        metaBuilder: ListMeta.fromJson,
      );

  @override
  Future<TwitterResponse<MemberStateData, void>> createMember({
    required String listId,
    required String userId,
  }) async =>
      super.transformSingleDataResponse(
        await super.post(
          UserContext.oauth2OrOAuth1,
          '/2/lists/$listId/members',
          body: {
            'user_id': userId,
          },
        ),
        dataBuilder: MemberStateData.fromJson,
      );

  @override
  Future<TwitterResponse<MemberStateData, void>> destroyMember({
    required String listId,
    required String userId,
  }) async =>
      super.transformSingleDataResponse(
        await super.delete(
          UserContext.oauth2OrOAuth1,
          '/2/lists/$listId/members/$userId',
        ),
        dataBuilder: MemberStateData.fromJson,
      );

  @override
  Future<TwitterResponse<List<UserData>, UserMeta>> lookupMembers({
    required String listId,
    int? maxResults,
    String? paginationToken,
    List<UserExpansion>? expansions,
    List<TweetField>? tweetFields,
    List<UserField>? userFields,
    Paging<List<UserData>, UserMeta>? paging,
  }) async =>
      await super.executePaginationIfNecessary(
        UserContext.oauth2OrOAuth1,
        '/2/lists/$listId/members',
        {
          'max_results': maxResults,
          'pagination_token': paginationToken,
          'expansions': expansions,
          'tweet.fields': tweetFields,
          'user.fields': userFields,
        },
        paging: paging,
        dataBuilder: UserData.fromJson,
        metaBuilder: UserMeta.fromJson,
      );

  @override
  Future<TwitterResponse<List<ListData>, ListMeta>> lookupMemberships({
    required String userId,
    int? maxResults,
    String? paginationToken,
    List<ListExpansion>? expansions,
    List<UserField>? userFields,
    List<ListField>? listFields,
    Paging<List<ListData>, ListMeta>? paging,
  }) async =>
      await super.executePaginationIfNecessary(
        UserContext.oauth2OrOAuth1,
        '/2/users/$userId/list_memberships',
        {
          'max_results': maxResults,
          'pagination_token': paginationToken,
          'expansions': expansions,
          'user.fields': userFields,
          'list.fields': listFields,
        },
        paging: paging,
        dataBuilder: ListData.fromJson,
        metaBuilder: ListMeta.fromJson,
      );

  Future<TwitterResponse<ListData, void>> _createList({
    required String name,
    String? description,
    required bool private,
  }) async =>
      super.transformSingleDataResponse(
        await super.post(
          UserContext.oauth2OrOAuth1,
          '/2/lists',
          body: {
            'name': name,
            'description': description,
            'private': private,
          },
        ),
        dataBuilder: ListData.fromJson,
      );

  Future<TwitterResponse<UpdateStateData, void>> _updateList({
    required String listId,
    String? name,
    String? description,
    required bool private,
  }) async =>
      super.transformSingleDataResponse(
        await super.put(
          UserContext.oauth2OrOAuth1,
          '/2/lists/$listId',
          body: {
            'name': name,
            'description': description,
            'private': private,
          },
        ),
        dataBuilder: UpdateStateData.fromJson,
      );
}
