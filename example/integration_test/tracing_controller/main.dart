import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import '../constants.dart';
import '../util.dart';

part 'start_and_stop.dart';

void main() {
  final shouldSkip = !CygnusTracingController.isClassSupported();

  skippableGroup('Tracing Controller', () {
    startAndStop();
  }, skip: shouldSkip);
}
