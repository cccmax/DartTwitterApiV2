// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

abstract class ObjectAdaptor {
  /// Returns the JSON object converted as v2 format.
  Map<String, dynamic> execute(final Map<String, dynamic> source);
}
