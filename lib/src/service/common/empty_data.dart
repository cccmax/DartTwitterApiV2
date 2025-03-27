// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'data.dart';

/// This class indicates that the response from Twitter API does not include
/// data field.
class EmptyData implements Data {
  /// Returns the new instance of [EmptyData].
  const EmptyData();
}
