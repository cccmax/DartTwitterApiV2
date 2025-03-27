// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum ComplianceStreamPartition {
  section1(1),
  section2(2),
  section3(3),
  section4(4);

  /// The value
  final int value;

  const ComplianceStreamPartition(this.value);
}
