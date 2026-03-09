import 'package:flutter/material.dart';

/// In here this contains the constants that have beed manually added to use with the context
/// to use use it with context.{variable_name} ex.: context.screenWidth
extension ContextExtensions on BuildContext {

  /// Screen width
  double get kScreenWidth => MediaQuery.of(this).size.width;

  /// Screen height
  double get kScreenHeight => MediaQuery.of(this).size.height;

  /// Status bar height
  double get kStatusBarHeight => MediaQuery.of(this).padding.top;

  /// Bottom padding (notch / gesture area)
  double get kBottomPadding => MediaQuery.of(this).padding.bottom;

  /// Orientation
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Device type helpers
  bool get isTablet => kScreenWidth >= 600;

}
