import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/create_task/view/create_task_dialog.dart';
import 'package:plano/themes/build_context_extension.dart';

class AddTaskButton extends StatefulWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(color: Colors.transparent),
      color: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        showDialog(
          context: context,
          barrierColor: const Color(0x66252525),
          builder: (context) => const CreateTaskDialog(),
        );
      },
      onHover: (hovered) {
        if (hovered) {
          setState(() {
            decoration = decoration.copyWith(
                border: Border.all(color: context.colors.unfocusColor!),
                color: context.colors.headerColor);
          });
        } else {
          setState(() {
            decoration = decoration.copyWith(
                border: Border.all(color: Colors.transparent),
                color: Colors.transparent);
          });
        }
      },
      child: Container(
        decoration: decoration,
        height: 40.0,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 8.0,
            ),
            SizedBox(
              child: SvgPicture.asset(
                'assets/vector/plus.svg',
                width: 16,
                height: 16,
                color: decoration.color == Colors.transparent
                    ? context.colors.unfocusColor
                    : context.colors.textColor,
              ),
            ),
            const SizedBox(
              width: 19.0,
            ),
            Text(
              'Создать',
              style: context.textStyles.regularSecondary!.copyWith(
                color: decoration.color == Colors.transparent
                    ? context.colors.textSecondaryColor
                    : context.colors.textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
