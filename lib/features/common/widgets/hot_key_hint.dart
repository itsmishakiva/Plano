import 'package:flutter/material.dart';
import 'package:plano/themes/build_context_extension.dart';

class HotKeyHint extends StatelessWidget {
  const HotKeyHint({
    Key? key,
    required this.hint,
    required this.keySymbol,
  }) : super(key: key);
  final String hint;
  final String keySymbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 28.0,
      decoration: BoxDecoration(
        color: context.colors.borderSideColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            hint,
            style: context.textStyles.regularSecondary,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Container(
            width: 2.0,
            height: 2.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.textColor,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Container(
            height: 16.0,
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: context.colors.unfocusColor,
            ),
            child: Center(
              child: Text(
                keySymbol,
                style: context.textStyles.small,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
