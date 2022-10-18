import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/common/widgets/svg_icon_button.dart';
import 'package:plano/features/create_task/manager/create_task_manager.dart';
import 'package:plano/features/create_task/view/create_task_dialog.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../models/types.dart';

//We use consumer stateful widget here, because we do not need to
//application logic here and state is only responsive for focus color
class TypeHeader extends ConsumerStatefulWidget {
  const TypeHeader({
    Key? key,
    this.height = 56,
    required this.type,
    this.count = 0,
  }) : super(key: key);
  final double height;
  final Types type;
  final int count;

  @override
  ConsumerState<TypeHeader> createState() => _TypeHeaderState();
}

class _TypeHeaderState extends ConsumerState<TypeHeader> {
  Color? plusColor;

  @override
  Widget build(BuildContext context) {
    plusColor ??= context.colors.unfocusColor;
    return Container(
      padding: const EdgeInsets.only(
        right: 22.0,
        left: 18.0,
      ),
      height: widget.height,
      color: context.colors.headerColor,
      child: Row(
        children: [
          SvgPicture.asset(widget.type.iconPath),
          const SizedBox(width: 18.0),
          Text(
            widget.type.label,
            style: context.textStyles.regular,
          ),
          const SizedBox(width: 8.0),
          Text(
            widget.count.toString(),
            style: context.textStyles.regularSecondary,
          ),
          const Spacer(),
          SvgIconButton(
            svgPath: 'assets/vector/plus.svg',
            onTap: () {
              ref.read(createTaskManagerProvider).updateTaskParams(
                    type: widget.type,
                  );
              showDialog(
                context: context,
                builder: (context) => const CreateTaskDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
