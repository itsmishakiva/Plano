import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/themes/build_context_extension.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        height: 24,
        width: 232,
        decoration: BoxDecoration(
          color: context.colors.textFieldColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/vector/lightning.svg'),
            const SizedBox(width: 6.4),
            Text(
              'Нет соединения с интернетом',
              style: context.textStyles.regular,
            ),
          ],
        ),
      ),
    );
  }
}
