import 'package:flutter/material.dart';
import 'package:plano/themes/build_context_extension.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    this.width,
    this.height,
    this.labelText,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: context.colors.textColor,
        focusNode: focusNode,
        style: context.textStyles.regular,
        //TODO change to UI kit
        decoration: InputDecoration(
          hintText: errorText ?? labelText,
          suffixIcon: errorText != null
              ? Icon(Icons.info, color: context.colors.errorColor)
              : null,
          border: errorText != null
              ? Theme.of(context).inputDecorationTheme.errorBorder
              : null,
          enabledBorder: errorText != null
              ? Theme.of(context).inputDecorationTheme.errorBorder
              : null,
          focusedBorder: errorText != null
              ? Theme.of(context).inputDecorationTheme.errorBorder
              : null,
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
