import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/common/widgets/hot_key_hint.dart';

//This is screen that is shown when there are no tasks instead of list of tasks
class TasksEmpty extends StatelessWidget {
  const TasksEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/vector/backlog.svg',
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              'assets/vector/waiting.svg',
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              'assets/vector/in_work.svg',
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              'assets/vector/review.svg',
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              'assets/vector/done.svg',
            ),
          ],
        ),
        const SizedBox(height: 30),
        const HotKeyHint(
          hint: 'Создать новую задачу',
          keySymbol: 'C',
        ),
      ],
    );
  }
}
