import 'package:flutter/material.dart';
import 'package:plano/themes/plano_text_styles.dart';

import 'plano_colors.dart';

//This helps us to get colors of current theme
//using context.colors or context.textStyles
extension ThemePicker on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
}
