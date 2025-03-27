// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:

// 🌎 Project imports:
import '../../core/client/client_context.dart';
import '../../core/client/user_context.dart';
import '../base_service.dart';
import '../response/twitter_response.dart';
import 'batch_compliance_data.dart';
import 'job_status.dart';
import 'job_type.dart';

/// This class provides methods to easily access endpoints based on Compliance.
abstract class ComplianceService {
  /// Returns the new instance of [ComplianceService].
  factory ComplianceService({required ClientContext context}) =>
      _ComplianceService(context: context);

  /// Returns  a single compliance job with the specified ID.
  ///
  /// ## Parameters
  ///
  /// - [jobId]: The unique identifier for the compliance job you want to
  ///            retrieve.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/compliance/jobs/:id
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 App-only
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    150 requests per 15-minute window shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs-id
  Future<TwitterResponse<BatchComplianceData, void>> lookupJob(
      {required String jobId});

  /// Returns a list of recent compliance jobs.
  ///
  /// ## Parameters
  ///
  /// - [jobType]: Allows to filter by job type - either by tweets or user ID.
  ///              Only one filter (tweets or users) can be specified per
  ///              request.
  ///
  /// - [jobStatus]: Allows to filter by job status. Only one filter can be
  ///                specified per request. Default: `all`.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/compliance/jobs
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 App-only
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    150 requests per 15-minute window shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs
  Future<TwitterResponse<List<BatchComplianceData>, void>> lookupJobs(
      {required JobType jobType, JobStatus? jobStatus});

  /// Creates a new compliance job for Tweet IDs or user IDs.
  ///
  /// A compliance job will contain an ID and a destination URL.
  /// The destination URL represents the location that contains the list of IDs
  /// consumed by your App.
  ///
  /// You can run one batch job at a time.
  ///
  /// ## Parameters
  ///
  /// - [jobType]: Specify whether you will be uploading tweet or user IDs.
  ///              You can either specify tweets or users.
  ///
  /// - [jobName]: A name for this job, useful to identify multiple jobs
  ///              using a label you define.
  ///
  /// - [resumable]: Specifies whether to enable the upload URL with support
  ///                for resumable uploads. If true, this endpoint will return
  ///                a pre-signed URL with resumable uploads enabled.
  ///
  /// ## Endpoint Url
  ///
  /// - https://api.twitter.com/2/compliance/jobs
  ///
  /// ## Authentication Methods
  ///
  /// - OAuth 2.0 App-only
  ///
  /// ## Rate Limits
  ///
  /// - **App rate limit (OAuth 2.0 App Access Token)**:
  ///    150 requests per 15-minute window shared among all users of your app
  ///
  /// ## Reference
  ///
  /// - https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/post-compliance-jobs
  Future<TwitterResponse<BatchComplianceData, void>> createJob(
      {required JobType jobType, String? jobName, bool? resumable});
}

class _ComplianceService extends BaseService implements ComplianceService {
  /// Returns the new instance of [_ComplianceService].
  _ComplianceService({required super.context});

  @override
  Future<TwitterResponse<BatchComplianceData, void>> lookupJob({
    required String jobId,
  }) async =>
      super.transformSingleDataResponse(
        await super.get(
          UserContext.appOnly,
          '/2/compliance/jobs/$jobId',
        ),
        dataBuilder: BatchComplianceData.fromJson,
      );

  @override
  Future<TwitterResponse<List<BatchComplianceData>, void>> lookupJobs({
    required JobType jobType,
    JobStatus? jobStatus,
  }) async =>
      super.transformMultiDataResponse(
        await super.get(
          UserContext.appOnly,
          '/2/compliance/jobs',
          queryParameters: {
            'type': jobType.name,
            'status': jobStatus?.value,
          },
        ),
        dataBuilder: BatchComplianceData.fromJson,
      );

  @override
  Future<TwitterResponse<BatchComplianceData, void>> createJob({
    required JobType jobType,
    String? jobName,
    bool? resumable,
  }) async =>
      super.transformSingleDataResponse(
        await super.post(
          UserContext.appOnly,
          '/2/compliance/jobs',
          body: {
            'type': jobType.name,
            'name': jobName,
            'resumable': resumable,
          },
        ),
        dataBuilder: BatchComplianceData.fromJson,
      );
}
