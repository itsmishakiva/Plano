import 'package:flutter/material.dart';

//Describing colors for themes here.
//It should extend AppColors for using extension in PianoThemes

class PlanoDarkColors extends AppColors {
  const PlanoDarkColors()
      : super(
          textColor: const Color(0xFFF4F4F4),
          textSecondaryColor: const Color(0xFF9A9A9A),
          backgroundColor: const Color(0xFF1D1E22),
          headerColor: const Color(0xFF222325),
          headerSecondaryColor: const Color(0xFF28292D),
          borderSideColor: const Color(0xFF272727),
          enabledButtonColor: const Color(0xFF6366F1),
          focusedButtonColor: const Color(0xFF5247DE),
          enabledButtonSecondaryColor: const Color(0xFF313236),
          focusedButtonSecondaryColor: const Color(0xFF37383B),
          buttonForegroundColor: const Color(0xFFFFFFFF),
          textFieldColor: const Color(0xFF2C2D2F),
          textFieldBorderColor: const Color(0xFF37373C),
          errorBorderColor: const Color(0xFF7F1D1D),
          errorColor: const Color(0xFFEF4444),
          unfocusColor: const Color(0xFF6A6A6A),
          modalDividerColor: const Color(0xFF414244),
          backPageColor: const Color(0xFF19191C),
        );
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.textColor,
    required this.textSecondaryColor,
    required this.backgroundColor,
    required this.headerColor,
    required this.headerSecondaryColor,
    required this.borderSideColor,
    required this.enabledButtonColor,
    required this.focusedButtonColor,
    required this.enabledButtonSecondaryColor,
    required this.focusedButtonSecondaryColor,
    required this.buttonForegroundColor,
    required this.textFieldColor,
    required this.textFieldBorderColor,
    required this.errorBorderColor,
    required this.errorColor,
    required this.unfocusColor,
    required this.modalDividerColor,
    required this.backPageColor,
  });

  final Color? textColor;
  final Color? backgroundColor;
  final Color? headerColor;
  final Color? headerSecondaryColor;
  final Color? borderSideColor;
  final Color? enabledButtonColor;
  final Color? focusedButtonColor;
  final Color? enabledButtonSecondaryColor;
  final Color? focusedButtonSecondaryColor;
  final Color? buttonForegroundColor;
  final Color? textFieldColor;
  final Color? textFieldBorderColor;
  final Color? errorBorderColor;
  final Color? errorColor;
  final Color? unfocusColor;
  final Color? textSecondaryColor;
  final Color? modalDividerColor;
  final Color? backPageColor;

  @override
  AppColors copyWith({
    Color? textColor,
    Color? textSecondaryColor,
    Color? backgroundColor,
    Color? headerColor,
    Color? headerSecondaryColor,
    Color? borderSideColor,
    Color? enabledButtonColor,
    Color? focusedButtonColor,
    Color? enabledButtonSecondaryColor,
    Color? focusedButtonSecondaryColor,
    Color? buttonForegroundColor,
    Color? textFieldColor,
    Color? textFieldBorderColor,
    Color? errorBorderColor,
    Color? errorColor,
    Color? unfocusColor,
    Color? modalDividerColor,
    Color? backPageColor,
  }) {
    return AppColors(
      textColor: textColor ?? this.textColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerColor: headerColor ?? this.headerColor,
      headerSecondaryColor: headerSecondaryColor ?? this.headerSecondaryColor,
      borderSideColor: borderSideColor ?? this.borderSideColor,
      enabledButtonColor: enabledButtonColor ?? this.enabledButtonColor,
      focusedButtonColor: focusedButtonColor ?? this.focusedButtonColor,
      enabledButtonSecondaryColor:
          enabledButtonSecondaryColor ?? this.enabledButtonSecondaryColor,
      focusedButtonSecondaryColor:
          focusedButtonSecondaryColor ?? this.focusedButtonSecondaryColor,
      buttonForegroundColor:
          buttonForegroundColor ?? this.buttonForegroundColor,
      textFieldColor: textFieldColor ?? this.textFieldColor,
      textFieldBorderColor: textFieldBorderColor ?? this.textFieldBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      errorColor: errorColor ?? this.errorColor,
      unfocusColor: unfocusColor ?? this.unfocusColor,
      modalDividerColor: modalDividerColor ?? this.modalDividerColor,
      backPageColor: backPageColor ?? this.backPageColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      textColor: Color.lerp(textColor, other.textColor, t),
      textSecondaryColor:
          Color.lerp(textSecondaryColor, other.textSecondaryColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      headerColor: Color.lerp(headerColor, other.headerColor, t),
      headerSecondaryColor:
          Color.lerp(headerSecondaryColor, other.headerSecondaryColor, t),
      borderSideColor: Color.lerp(borderSideColor, other.borderSideColor, t),
      enabledButtonColor:
          Color.lerp(enabledButtonColor, other.enabledButtonColor, t),
      focusedButtonColor:
          Color.lerp(focusedButtonColor, other.focusedButtonColor, t),
      enabledButtonSecondaryColor: Color.lerp(
          enabledButtonSecondaryColor, other.enabledButtonSecondaryColor, t),
      focusedButtonSecondaryColor: Color.lerp(
          focusedButtonSecondaryColor, other.focusedButtonSecondaryColor, t),
      buttonForegroundColor:
          Color.lerp(buttonForegroundColor, other.buttonForegroundColor, t),
      textFieldColor: Color.lerp(textFieldColor, other.textFieldColor, t),
      textFieldBorderColor:
          Color.lerp(textFieldBorderColor, other.textFieldBorderColor, t),
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      unfocusColor: Color.lerp(unfocusColor, other.unfocusColor, t),
      modalDividerColor: Color.lerp(modalDividerColor, modalDividerColor, t),
      backPageColor: Color.lerp(backPageColor, backPageColor, t),
    );
  }
}
