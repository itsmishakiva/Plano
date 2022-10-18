import 'package:flutter/material.dart';
import 'package:plano/themes/build_context_extension.dart';

class ModalTextField extends StatelessWidget {
  const ModalTextField({
    Key? key,
    this.hint,
    this.initText,
    this.filled = true,
    this.style,
    this.hintStyle,
    this.minLines,
    this.maxLines,
    this.focusedBorder,
    this.padding,
    this.controller,
  }) : super(key: key);

  final String? hint;
  final String? initText;
  final bool? filled;
  final InputBorder? focusedBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? padding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        controller: controller,
        initialValue: initText,
        style: style ?? context.textStyles.headline,
        cursorColor: context.colors.textColor,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: filled,
          contentPadding: padding ?? EdgeInsets.zero,
          hoverColor: Colors.transparent,
          hintText: hint,
          hintStyle: hintStyle ??
              context.textStyles.headline!.copyWith(
                color: const Color(0x66FFFFFF),
              ),
          border: InputBorder.none,
          focusedBorder: focusedBorder ?? InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
