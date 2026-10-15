import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'memory_usage_target_level.g.dart';

///Constants that describe memory usage target levels.
@ExchangeableEnum()
class CygnusMemoryUsageTargetLevel_ {
  // ignore: unused_field
  final int _value;
  const CygnusMemoryUsageTargetLevel_._internal(this._value);

  ///Normal memory usage target level.
  static const NORMAL = CygnusMemoryUsageTargetLevel_._internal(0);

  ///Low memory usage target level.
  static const LOW = CygnusMemoryUsageTargetLevel_._internal(1);
}
