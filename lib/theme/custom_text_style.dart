import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumRubikPrimaryContainer =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w400,
      );
  // Display text style
  static get displayMediumGray900 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.gray900,
      );
  // Label text style
  static get labelLargeMontserratPrimaryContainer =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 12.fSize,
      );
  static get labelLargeMontserratRedA400 =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: appTheme.redA400,
        fontSize: 12.fSize,
      );
  static get labelLargeMontserratTeal500 =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: appTheme.teal500,
        fontSize: 12.fSize,
      );
  // Title text style
  static get titleLargePlusJakartaSansBlack900 =>
      theme.textTheme.titleLarge!.plusJakartaSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumMontserratGray600 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMontserratGray600_1 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.gray600,
      );
  static get titleMediumMontserratGray600_2 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.gray600,
      );
  static get titleMediumMontserratOnPrimaryContainer =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleMediumMontserratPrimary =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumMontserratPrimaryContainer =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleMediumMontserratTeal500 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.teal500,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumMontserratWhiteA700 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumRubikPrimaryContainer =>
      theme.textTheme.titleMedium!.rubik.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 18.fSize,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}
