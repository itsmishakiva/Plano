import 'package:flutter/material.dart';
import 'package:plano/themes/plano_colors.dart';
import 'package:plano/themes/plano_text_styles.dart';

//App themes are described here
class PlanoThemes {
  static const _darkThemeColors = PlanoDarkColors();
  static final _darkThemeTextStyles = PlanoDarkTextStyles(_darkThemeColors);
  static final darkThemeData = ThemeData(
    scaffoldBackgroundColor: _darkThemeColors.backgroundColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _darkThemeColors.enabledButtonColor,
        ),
        overlayColor: MaterialStateProperty.all(
          _darkThemeColors.focusedButtonColor,
        ),
        foregroundColor: MaterialStateProperty.all(
          _darkThemeColors.buttonForegroundColor,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 13.0,
        vertical: 14.0,
      ),
      isDense: true,
      filled: true,
      hintStyle: const TextStyle(color: Color(0xFFF3F4F6)),
      fillColor: _darkThemeColors.textFieldColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: _darkThemeColors.textFieldBorderColor!,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: _darkThemeColors.textFieldBorderColor!,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: _darkThemeColors.textFieldBorderColor!,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: _darkThemeColors.errorBorderColor!,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.dragged)) {
            return true;
          }
          return false;
        },
      ),
      thumbColor: MaterialStateProperty.all(_darkThemeColors.unfocusColor),
    ),
    hoverColor: _darkThemeColors.headerColor,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    extensions: [
      _darkThemeColors,
      _darkThemeTextStyles,
    ],
  );
}
