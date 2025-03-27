// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:test/test.dart';

// 🌎 Project imports:
import 'package:twitter_api_v2/src/core/client/client_context.dart';
import 'package:twitter_api_v2/src/core/client/user_context.dart';
import 'package:twitter_api_v2/src/core/exception/twitter_exception.dart';
import 'package:twitter_api_v2/src/core/exception/unauthorized_exception.dart';
import 'package:twitter_api_v2/src/service/compliance/batch_compliance_data.dart';
import 'package:twitter_api_v2/src/service/compliance/compliance_service.dart';
import 'package:twitter_api_v2/src/service/compliance/job_status.dart';
import 'package:twitter_api_v2/src/service/compliance/job_type.dart';
import 'package:twitter_api_v2/src/service/response/twitter_response.dart';
import '../../../mocks/client_context_stubs.dart' as context;

void main() {
  group('.lookupJob', () {
    test('normal case', () async {
      final complianceService = ComplianceService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/compliance/jobs/5555',
          'test/src/service/compliance/data/lookup_job.json',
          {},
        ),
      );

      final response = await complianceService.lookupJob(jobId: '5555');

      expect(response, isA<TwitterResponse>());
      expect(response.data, isA<BatchComplianceData>());
    });

    test('throws UnauthorizedException', () async {
      final complianceService = ComplianceService(
        context: ClientContext(
          bearerToken: '',
          timeout: const Duration(seconds: 10),
        ),
      );

      expect(
        () async => await complianceService.lookupJob(
            jobId: 'Throw UnauthorizedException'),
        throwsA(
          allOf(isA<UnauthorizedException>(),
              predicate((e) => e.toString().isNotEmpty)),
        ),
      );
    });

    test('throws TwitterException due to no data', () async {
      final complianceService = ComplianceService(
        context: context.buildGetStub(
          UserContext.appOnly,
          '/2/compliance/jobs/5555',
          'test/src/service/compliance/data/no_data.json',
          {},
        ),
      );

      expect(
        () async => await complianceService.lookupJob(jobId: '5555'),
        throwsA(
          allOf(isA<TwitterException>(),
              predicate((e) => e.toString().isNotEmpty)),
        ),
      );
    });
  });

  test('.lookupJobs', () async {
    final complianceService = ComplianceService(
      context: context.buildGetStub(
        UserContext.appOnly,
        '/2/compliance/jobs',
        'test/src/service/compliance/data/lookup_jobs.json',
        {'type': 'tweets', 'status': 'complete'},
      ),
    );

    final response = await complianceService.lookupJobs(
      jobType: JobType.tweets,
      jobStatus: JobStatus.complete,
    );

    expect(response, isA<TwitterResponse>());
    expect(response.data, isA<List<BatchComplianceData>>());
    expect(response.data.length, 2);
  });

  test('.createJob', () async {
    final complianceService = ComplianceService(
      context: context.buildPostStub(
        UserContext.appOnly,
        '/2/compliance/jobs',
        'test/src/service/compliance/data/create_job.json',
      ),
    );

    final response = await complianceService.createJob(
      jobType: JobType.tweets,
      jobName: 'test',
      resumable: true,
    );

    expect(response, isA<TwitterResponse>());
    expect(response.data, isA<BatchComplianceData>());
  });
}
