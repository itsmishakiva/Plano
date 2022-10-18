import 'package:flutter/material.dart';
import 'package:plano/themes/build_context_extension.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.textStyle,
      required this.onTap})
      : super(key: key);
  final String text;
  final TextStyle textStyle;
  final void Function() onTap;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    foregroundColor ??= context.colors.textSecondaryColor;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.transparent,
        onHover: (event) {
          if (event) {
            setState(() {
              foregroundColor = context.colors.textColor;
            });
          }
          if (!event) {
            setState(() {
              foregroundColor = context.colors.textSecondaryColor;
            });
          }
        },
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: widget.textStyle.copyWith(color: foregroundColor),
        ),
      ),
    );
  }
}
