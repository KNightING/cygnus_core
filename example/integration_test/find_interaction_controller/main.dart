import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_test/flutter_test.dart';
import '../util.dart';

part 'find_interactions.dart';

void main() {
  final shouldSkip = !CygnusFindInteractionController.isClassSupported();

  skippableGroup('CygnusFindInteractionController', () {
    findInteractions();
  }, skip: shouldSkip);
}
