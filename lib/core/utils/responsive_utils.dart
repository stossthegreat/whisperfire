import 'package:flutter/material.dart';

/// Utility class for responsive design calculations
class ResponsiveUtils {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static bool _initialized = false;

  /// Initialize the responsive utils with current screen dimensions
  static void init(BuildContext context) {
    if (!_initialized) {
      final mediaQuery = MediaQuery.of(context);
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _initialized = true;
    }
  }

  /// Get responsive width based on percentage of screen width
  static double w(double percentage) {
    return _screenWidth * (percentage / 100);
  }

  /// Get responsive height based on percentage of screen height
  static double h(double percentage) {
    return _screenHeight * (percentage / 100);
  }

  /// Get responsive font size based on screen width
  static double fontSize(double baseSize) {
    return _screenWidth * (baseSize / 100);
  }

  /// Get responsive spacing based on screen height
  static double spacing(double baseSpacing) {
    return _screenHeight * (baseSpacing / 100);
  }

  /// Get responsive padding based on screen dimensions
  static EdgeInsets padding({
    double horizontal = 4,
    double vertical = 4,
  }) {
    return EdgeInsets.symmetric(
      horizontal: w(horizontal),
      vertical: h(vertical),
    );
  }

  /// Get responsive margin based on screen dimensions
  static EdgeInsets margin({
    double horizontal = 4,
    double vertical = 4,
  }) {
    return EdgeInsets.symmetric(
      horizontal: w(horizontal),
      vertical: h(vertical),
    );
  }

  /// Get responsive sized box height
  static SizedBox sizedBoxHeight(double percentage) {
    return SizedBox(height: h(percentage));
  }

  /// Get responsive sized box width
  static SizedBox sizedBoxWidth(double percentage) {
    return SizedBox(width: w(percentage));
  }

  /// Check if screen is small (width < 400)
  static bool get isSmallScreen => _screenWidth < 400;

  /// Check if screen is medium (400 <= width < 600)
  static bool get isMediumScreen => _screenWidth >= 400 && _screenWidth < 600;

  /// Check if screen is large (width >= 600)
  static bool get isLargeScreen => _screenWidth >= 600;

  /// Get responsive cross axis count for grids
  static int getGridCrossAxisCount(BuildContext context) {
    if (isSmallScreen) return 1;
    if (isMediumScreen) return 2;
    return 3;
  }

  /// Get responsive child aspect ratio for grids
  static double getGridChildAspectRatio(BuildContext context) {
    if (isSmallScreen) return 1.2;
    if (isMediumScreen) return 1.0;
    return 0.9;
  }
}

/// Extension methods for easier responsive design
extension ResponsiveExtension on BuildContext {
  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get responsive width percentage
  double w(double percentage) => screenWidth * (percentage / 100);

  /// Get responsive height percentage
  double h(double percentage) => screenHeight * (percentage / 100);

  /// Get responsive font size
  double fs(double percentage) => screenWidth * (percentage / 100);

  /// Get responsive spacing
  double sp(double percentage) => screenHeight * (percentage / 100);

  /// Check if screen is small
  bool get isSmallScreen => screenWidth < 400;

  /// Check if screen is medium
  bool get isMediumScreen => screenWidth >= 400 && screenWidth < 600;

  /// Check if screen is large
  bool get isLargeScreen => screenWidth >= 600;
}
