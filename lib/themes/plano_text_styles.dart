import 'package:flutter/material.dart';
import 'package:plano/themes/plano_colors.dart';

//Describing text styles for themes here.
//It should extend AppTextStyles for using extension in PianoThemes

class PlanoDarkTextStyles extends AppTextStyles {
  PlanoDarkTextStyles(AppColors colors)
      : super(
          headline: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          headlineSecondary: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: colors.textSecondaryColor,
          ),
          large: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          regular: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.textColor,
          ),
          regularSecondary: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.textSecondaryColor,
          ),
          small: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
          smallSecondary: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.textSecondaryColor,
          ),
        );
}

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.headline,
    required this.headlineSecondary,
    required this.large,
    required this.regular,
    required this.regularSecondary,
    required this.small,
    required this.smallSecondary,
  });

  final TextStyle? headline;
  final TextStyle? headlineSecondary;
  final TextStyle? large;
  final TextStyle? regular;
  final TextStyle? regularSecondary;
  final TextStyle? small;
  final TextStyle? smallSecondary;

  @override
  AppTextStyles copyWith({
    TextStyle? headline,
    TextStyle? headlineSecondary,
    TextStyle? large,
    TextStyle? regular,
    TextStyle? regularSecondary,
    TextStyle? small,
    TextStyle? smallSecondary,
  }) {
    return AppTextStyles(
      headline: headline ?? this.headline,
      headlineSecondary: headlineSecondary ?? this.headlineSecondary,
      large: large ?? this.large,
      regular: regular ?? this.regular,
      regularSecondary: regularSecondary ?? this.regularSecondary,
      small: small ?? this.small,
      smallSecondary: smallSecondary ?? this.smallSecondary,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      headline: TextStyle.lerp(headline, other.headline, t),
      headlineSecondary:
          TextStyle.lerp(headlineSecondary, other.headlineSecondary, t),
      large: TextStyle.lerp(large, other.large, t),
      regular: TextStyle.lerp(regular, other.regular, t),
      regularSecondary:
          TextStyle.lerp(regularSecondary, other.regularSecondary, t),
      small: TextStyle.lerp(small, other.small, t),
      smallSecondary: TextStyle.lerp(smallSecondary, other.smallSecondary, t),
    );
  }
}
