import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'pull_to_refresh_size.g.dart';

///Class representing the size of the refresh indicator.
@ExchangeableEnum()
class CygnusPullToRefreshSize_ {
  // ignore: unused_field
  final int _value;
  const CygnusPullToRefreshSize_._internal(this._value);

  ///Default size.
  static const DEFAULT = const CygnusPullToRefreshSize_._internal(1);

  ///Large size.
  static const LARGE = const CygnusPullToRefreshSize_._internal(0);
}

///Android-specific class representing the size of the refresh indicator.
///Use [CygnusPullToRefreshSize] instead.
@Deprecated("Use CygnusPullToRefreshSize instead")
@ExchangeableEnum()
class CygnusAndroidPullToRefreshSize_ {
  // ignore: unused_field
  final int _value;
  const CygnusAndroidPullToRefreshSize_._internal(this._value);

  ///Default size.
  static const DEFAULT = const CygnusAndroidPullToRefreshSize_._internal(1);

  ///Large size.
  static const LARGE = const CygnusAndroidPullToRefreshSize_._internal(0);
}
