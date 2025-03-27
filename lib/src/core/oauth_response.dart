// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import 'scope.dart';

part 'oauth_response.freezed.dart';
part 'oauth_response.g.dart';

@freezed
class OAuthResponse with _$OAuthResponse {
  // ignore: unused_element
  const OAuthResponse._();

  const factory OAuthResponse({
    required String accessToken,
    required String refreshToken,
    @JsonKey(name: 'scope') @ScopeConverter() required List<Scope> scopes,
    @JsonKey(name: 'expires_in')
    @DateTimeConverter()
        required DateTime expiresAt,
  }) = _OAuthResponse;

  factory OAuthResponse.fromJson(Map<String, Object?> json) =>
      _$OAuthResponseFromJson(json);

  /// Returns true if the access token is expired, otherwise false.
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Returns true if the access token is valid, otherwise false.
  bool get isNotExpired => !isExpired;
}

class ScopeConverter implements JsonConverter<List<Scope>, String> {
  const ScopeConverter();

  @override
  List<Scope> fromJson(final String scope) =>
      scope.split(' ').map((e) => Scope.valueOf(e)).toList();

  @override
  String toJson(final List<Scope> scopes) =>
      scopes.map((e) => e.value).toList().join(' ');
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(final int json) => DateTime.now().add(
        Duration(seconds: json),
      );

  @override
  int toJson(final DateTime json) => 7200;
}
