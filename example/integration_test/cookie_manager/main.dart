import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_test/flutter_test.dart';
import '../constants.dart';
import '../util.dart';

part 'set_get_delete.dart';

void main() {
  final shouldSkip = !CygnusCookieManager.isClassSupported();

  skippableGroup('CygnusCookie Manager', () {
    setGetDelete();
  }, skip: shouldSkip);
}
