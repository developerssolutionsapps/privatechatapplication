import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray50001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  // Display text style
  static get displayMediumDeeppurpleA400 =>
      theme.textTheme.displayMedium!.copyWith(
        color: appTheme.deepPurpleA400,
      );
  static get displayMediumOnPrimary => theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 44.fSize,
        fontWeight: FontWeight.w900,
      );
  static get displaySmallDeeppurpleA400 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.deepPurpleA400,
      );
  // Headline text style
  static get headlineMediumDeeppurpleA400 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.deepPurpleA400,
      );
  static get headlineSmallGray200 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray200,
      );
  static get headlineSmallGray700 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray700,
      );
  static get headlineSmallGray70001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray70001,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Label text style
  static get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelMediumDeeppurpleA400 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.deepPurpleA400,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumDeeppurpleA400_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.deepPurpleA400,
      );
  // Title text style
  static get titleLargeAlibabaPuHuiTi20Gray700 =>
      theme.textTheme.titleLarge!.alibabaPuHuiTi20.copyWith(
        color: appTheme.gray700,
      );
  static get titleLargeAlibabaPuHuiTi20Gray800 =>
      theme.textTheme.titleLarge!.alibabaPuHuiTi20.copyWith(
        color: appTheme.gray800,
      );
  static get titleLargeAlibabaPuHuiTi20Gray800_1 =>
      theme.textTheme.titleLarge!.alibabaPuHuiTi20.copyWith(
        color: appTheme.gray800,
      );
  static get titleLargeAlibabaPuHuiTi20OnPrimary =>
      theme.textTheme.titleLarge!.alibabaPuHuiTi20.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w900,
      );
  static get titleLargeAlibabaPuHuiTi20Primary =>
      theme.textTheme.titleLarge!.alibabaPuHuiTi20.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumDeeppurpleA400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.deepPurpleA400,
      );
  static get titleMediumGray200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray200,
      );
  static get titleMediumGray200_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray200,
      );
  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get titleMediumSFProGray50001 =>
      theme.textTheme.titleMedium!.sFPro.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );
  static get titleSmallGray800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray800,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
}

extension on TextStyle {
  TextStyle get alibabaPuHuiTi20 {
    return copyWith(
      fontFamily: 'Alibaba PuHuiTi 2.0',
    );
  }

  TextStyle get sFPro {
    return copyWith(
      fontFamily: 'SF Pro',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
