import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

class AppDecoration {
  // Bg decorations
  static BoxDecoration get bg => BoxDecoration(
        color: appTheme.gray200,
        border: Border.all(
          color: appTheme.deepPurpleA400,
          width: 1.h,
          strokeAlign: strokeAlignCenter,
        ),
      );

  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Gradient decorations
  static BoxDecoration get gradientOnPrimaryToDeepPurpleA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.26, -0.36),
          end: Alignment(-0.22, 1.43),
          colors: [
            theme.colorScheme.onPrimary,
            appTheme.deepPurpleA200,
          ],
        ),
      );

  // Main decorations
  static BoxDecoration get mainTheme => BoxDecoration(
        color: appTheme.deepPurpleA400,
      );

  // Outline decorations
  static BoxDecoration get outlineDeepPurpleA => BoxDecoration(
        color: appTheme.gray200,
        border: Border.all(
          color: appTheme.deepPurpleA400,
          width: 2.h,
          strokeAlign: strokeAlignCenter,
        ),
      );
  static BoxDecoration get outlineDeeppurpleA20001 => BoxDecoration(
        border: Border.all(
          color: appTheme.deepPurpleA20001,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder42 => BorderRadius.circular(
        42.h,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get circleBorder9 => BorderRadius.circular(
        9.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
        top: Radius.circular(24.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
