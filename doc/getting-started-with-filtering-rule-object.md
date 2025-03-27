# Let's build filtering rules with FilteringRule object 🐦

## Summary 🌎

Some endpoints in [Twitter API v2.0](https://developer.twitter.com/en/docs/twitter-api/data-dictionary/introduction) supports a number of operators for advanced searches, not just `keywords` and `hashtags`.

- [Filtered Stream: Build a Rule](https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/integrate/build-a-rule)

For example, if you want to extract tweets with the hashtag "#ElonMusk" and the language of the tweeted content is English, you would create the following rule:

- `#ElonMusk lang:en`

Generating these filtering rules is simple at first glance, but the number of supported operators is so large that it's quite a painstaking task to look at the references for each rule you create. Also, there is a syntax specific to this filtering rule, and typos may occur when entering the rules manually.

So, [twitter_api_v2](https://github.com/twitter-dart/twitter-api-v2) provides [FilteringRule](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/FilteringRule-class.html) object that allows this filtering rule to be constructed safely and easily.

The previous filtering rule example would look like following with FilteringRule object.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

void main() {
  final rule = v2.FilteringRule.of()
      .matchHashtag('ElonMusk')
      .and()
      .matchLanguage(v2.Language.english);

  // -> #ElonMusk lang:en
  print(rule.build());
}
```

## How It Works 🧐

The **FilteringRule object is not a simple builder object**. **FilteringRule** object is also aware of the syntax of filtering rules and has a mechanism that prevents developers from creating filtering rules with incorrect syntax.

For example, **you can write** like:

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

void main() {
  // ✅ because it's correct syntax.
  final rule = v2.FilteringRule.of()
      .matchHashtag('ElonMusk')
      .and()
      .matchLanguage(v2.Language.english);

  // -> #ElonMusk lang:en
  print(rule.build());
}
```

But, **you can't write** like:

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

void main() {
  // ❌ because it has no logical operator ("and" or "or") between matchers.
  v2.FilteringRule.of()
      .matchHashtag('ElonMusk')
      .matchLanguage(v2.Language.english);

  // ❌ because you can't start with conjunction required operators.
  v2.FilteringRule.of()
      .matchLanguage(v2.Language.english)
      .matchHashtag('ElonMusk');
}
```

## Tips 🏄

### How to Create Instance

There are 2 options for creating an instance of **FilteringRule** object.

The only difference between the following 2 options is whether or not parameters can be specified when creating the instance, and there is no difference in behavior after the instance is created.

| Constructor  | Description                                                                                                                 |
| ------------ | --------------------------------------------------------------------------------------------------------------------------- |
| **of**       | This is the most basic method for creating **FilteringRule** instance.                                                      |
| **ofSample** | When creating an instance of **FilteringRule** object, you can specify a value (percentage) for the **`sample:`** operator. |

### Method Names

The names of the methods corresponding to each matcher supported by the **FilteringRule** object are standardized with following prefixes.

| Prefix       | Description                                                            |
| ------------ | ---------------------------------------------------------------------- |
| **match**    | Methods beginning with this prefix can add **not negated** conditions. |
| **notMatch** | Methods beginning with this prefix can add **negated** conditions.     |

### How to Negate specific Conditions

While the negation operator provided by the official Twitter is provided as a **logical**, **twitter_api_v2** provides this operator with a different approach.

If you want to use the negation operator, use one of the methods corresponding to a specific `Standalone operator` or `Conjunction Required operator` that begins with **`notMatch`**.

So, you can write like below.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

void main() {
  final rule = v2.FilteringRule.of()
      .notMatchHashtag('ElonMusk')
      .and()
      .matchLanguage(v2.Language.english);

  // -> -#ElonMusk lang:en
  print(rule.build());
}
```

### How to Build a Grouped Rule

Multiple rules can be grouped together to create advanced query strings. This grouping could also be used to control the priority of search criteria.

This grouping of filtering rules is very simple and can be accomplished by using the **`group`** method to nest **FilteringRule** object.

So, you can write like below.

```dart
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

void main() {
  final rule = v2.FilteringRule.of()
        .matchHashtag('ElonMusk')
        .and()
        .group(
            v2.FilteringRule.of()
                .matchHashtag('SpaceX')
                .and()
                .matchLanguage(v2.Language.english),
      );

  // -> #ElonMusk (#SpaceX lang:en)
  print(rule.build());
}
```

## Supported Operators 👀

**twitter_api_v2** Supports all official Twitter-supported filtering rule operators.

### Logical

| Operator  | Method Name                                                                                         | Availability |
| --------- | --------------------------------------------------------------------------------------------------- | ------------ |
| **AND**   | [and](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/LogicalChannel/and.html)   | Essential    |
| **OR**    | [or](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/LogicalChannel/or.html)     | Essential    |
| **GROUP** | [group](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/group.html) | Essential    |

### Standalone

| Operator                  | Method Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Availability |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **keyword**               | [matchKeyword](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchKeyword.html)</br>[notMatchKeyword](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchKeyword.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **#**                     | [matchHashtag](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchHashtag.html)</br>[notMatchHashtag](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchHashtag.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **@**                     | [matchCashtag](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchCashtag.html)</br>[notMatchCashtag](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchCashtag.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **$**                     | [matchCashtag](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchCashtag.html)</br>[notMatchCashtag](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchCashtag.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **from:**                 | [matchTweetFrom](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchTweetFrom.html)</br>[notNatchTweetFrom](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notNatchTweetFrom.html)                                                                                                                                                                                                                                                                                                                                                       | Essential    |
| **to:**                   | [matchTweetTo](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchTweetTo.html)</br>[notMatchTweetTo](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchTweetTo.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **url:**                  | [matchUrl](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUrl.html)</br>[notMatchUrl](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUrl.html)                                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **retweets_of:**          | [matchRetweetedBy](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchRetweetedBy.html)</br>[notMatchRetweetedBy](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchRetweetedBy.html)                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **context:**              | [matchContext](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchContext.html)</br>[notMatchContext](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchContext.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **entity:**               | [matchEntity](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchEntity.html)</br>[notMatchEntity](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchEntity.html)                                                                                                                                                                                                                                                                                                                                                                   | Essential    |
| **conversation_id:**      | [matchConversation](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchConversation.html)</br>[notMatchConversation](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchConversation.html)                                                                                                                                                                                                                                                                                                                                           | Essential    |
| **bio:**                  | [matchUserBio](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUserBio.html)</br>[notMatchUserBio](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUserBio.html)                                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **bio_name:**             | [matchUserBioName](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUserBioName.html)</br>[notMatchUserBioName](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUserBioName.html)                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **bio_location:**         | [matchUserBioLocation](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUserBioLocation.html)</br>[notMatchUserBioLocation](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUserBioLocation.html)                                                                                                                                                                                                                                                                                                                               | Essential    |
| **place:**                | [matchPlace](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchPlace.html)</br>[notMatchPlace](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchPlace.html)                                                                                                                                                                                                                                                                                                                                                                       | Elevated     |
| **place_country:**        | [matchCountry](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchCountry.html)</br>[notMatchCountry](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchCountry.html)                                                                                                                                                                                                                                                                                                                                                               | Elevated     |
| **point_radius:**         | [matchPointRadiusInMiles](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchPointRadiusInMiles.html)</br>[notMatchPointRadiusInMiles](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchPointRadiusInMiles.html)</br>[matchPointRadiusInKilometers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchPointRadiusInKilometers.html)</br>[notMatchPointRadiusInKilometers](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchPointRadiusInKilometers.html) | Elevated     |
| **bounding_box:**         | [matchBoundingBox](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchBoundingBox.html)</br>[notMatchBoundingBox](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchBoundingBox.html)                                                                                                                                                                                                                                                                                                                                               | Elevated     |
| **followers_count:**      | [matchFollowersCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchFollowersCount.html)</br>[notMatchFollowersCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchFollowersCount.html)                                                                                                                                                                                                                                                                                                                                   | Essential    |
| **tweets_count:**         | [matchTweetsCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchTweetsCount.html)</br>[notMatchTweetsCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchTweetsCount.html)                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **following_count:**      | [matchFollowingCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchFollowingCount.html)</br>[notMatchFollowingCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchFollowingCount.html)                                                                                                                                                                                                                                                                                                                                   | Essential    |
| **listed_count:**         | [matchListedCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchListedCount.html)</br>[notMatchListedCount](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchListedCount.html)                                                                                                                                                                                                                                                                                                                                               | Essential    |
| **url_title:**            | [matchUrlTitle](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUrlTitle.html)</br>[notMatchUrlTitle](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUrlTitle.html)                                                                                                                                                                                                                                                                                                                                                           | Essential    |
| **url_description:**      | [matchUrlDescription](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUrlDescription.html)</br>[notMatchUrlDescription](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUrlDescription.html)                                                                                                                                                                                                                                                                                                                                   | Essential    |
| **url_contains:**         | [matchUrlPartially](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchUrlPartially.html)</br>[notMatchUrlPartially](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchUrlPartially.html)                                                                                                                                                                                                                                                                                                                                           | Essential    |
| **in_reply_to_tweet_id:** | [matchRepliesTo](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchRepliesTo.html)</br>[notMatchRepliesTo](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchRepliesTo.html)                                                                                                                                                                                                                                                                                                                                                       | Essential    |
| **retweets_of_tweet_id:** | [matchRetweetOf](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/matchRetweetOf.html)</br>[notMatchRetweetOf](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/EntryChannel/notMatchRetweetOf.html)                                                                                                                                                                                                                                                                                                                                                       | Essential    |

### Conjunction Required

| Operator           | Method Name                                                                                                                                                                                                                                                                                                           | Availability |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **is:retweet**     | [matchRetweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchRetweet.html)</br>[notMatchRetweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchRetweet.html)                                                             | Essential    |
| **is:reply**       | [matchReply](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchReply.html)</br>[notMatchReply](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchReply.html)                                                                     | Essential    |
| **is:quote**       | [matchQuote](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchQuote.html)</br>[notMatchQuote](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchQuote.html)                                                                     | Essential    |
| **is:verified**    | [matchVerifiedUser](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchVerifiedUser.html)</br>[notMatchVerifiedUser](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchVerifiedUser.html)                                         | Essential    |
| **-is:nullcast**   | [notMatchNullcastTweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchNullcastTweet.html)                                                                                                                                                                             | Elevated     |
| **has:hashtags**   | [matchTweetContainsHashtags](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsHashtags.html)</br>[notMatchTweetContainsHashtags](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchRetweet.html)                   | Essential    |
| **has:cashtags**   | [matchTweetContainsCashtags](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsCashtags.html)</br>[notMatchTweetContainsCashtags](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsCashtags.html)     | Essential    |
| **has:links**      | [matchTweetContainsLinks](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsLinks.html)</br>[notMatchTweetContainsLinks](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsLinks.html)                 | Essential    |
| **has:mentions**   | [matchTweetContainsMentions](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsMentions.html)</br>[notMatchTweetContainsMentions](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsMentions.html)     | Essential    |
| **has:media**      | [matchTweetContainsMedia](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsMedia.html)</br>[notMatchTweetContainsMedia](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsMedia.html)                 | Essential    |
| **has:images**     | [matchRematchTweetContainsImagestweet](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsImages.html)</br>[notMatchTweetContainsImages](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsImages.html) | Essential    |
| **has:video_link** | [matchTweetContainsVideoLink](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsVideoLink.html)</br>[notMatchTweetContainsVideoLink](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsVideoLink.html) | Essential    |
| **has:geo**        | [matchTweetContainsGeo](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchTweetContainsGeo.html)</br>[notMatchTweetContainsGeo](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchTweetContainsGeo.html)                         | Essential    |
| **lang**           | [matchLanguage](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchLanguage.html)</br>[notMatchLanguage](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchRetweet.html)                                                          | Essential    |
| **source**         | [matchSource](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/matchSource.html)</br>[notMatchSource](https://pub.dev/documentation/twitter_api_v2/latest/twitter_api_v2/PostLogicalChannel/notMatchSource.html)                                                                 | Essential    |

## Any Questions or Suggestions?

If you have any questions or suggestions for improvement, please mention them in [Issues](https://github.com/twitter-dart/twitter-api-v2/issues) in [twitter_api_v2](https://github.com/twitter-dart/twitter-api-v2) :)
