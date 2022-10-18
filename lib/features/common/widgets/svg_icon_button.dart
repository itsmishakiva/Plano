import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plano/themes/build_context_extension.dart';

class SvgIconButton extends StatefulWidget {
  const SvgIconButton({Key? key, required this.svgPath, required this.onTap})
      : super(key: key);
  final String svgPath;
  final void Function() onTap;

  @override
  State<SvgIconButton> createState() => _SvgIconButtonState();
}

class _SvgIconButtonState extends State<SvgIconButton> {
  Color? plusColor;
  @override
  Widget build(BuildContext context) {
    plusColor ??= context.colors.unfocusColor;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onHover: (event) {
          if (event) {
            setState(() {
              plusColor = context.colors.textColor;
            });
          }
          if (!event) {
            setState(() {
              plusColor = context.colors.unfocusColor;
            });
          }
        },
        onTap: widget.onTap,
        child: SvgPicture.asset(
          widget.svgPath,
          width: 12,
          color: plusColor,
        ),
      ),
    );
  }
}
