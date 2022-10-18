import 'package:flutter/material.dart';
import 'package:plano/themes/build_context_extension.dart';

class ModalButton extends StatelessWidget {
  const ModalButton({
    Key? key,
    required this.child,
    this.width = 80,
  }) : super(key: key);

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: context.colors.enabledButtonSecondaryColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
