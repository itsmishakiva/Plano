import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/common/models/task_model.dart';
import 'package:plano/features/common/widgets/custom_popup_menu.dart' as custom;
import 'package:plano/features/tasks_list/models/global_types.dart';
import 'package:plano/features/tasks_list/models/priority_types.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../tasks_list/models/types.dart';

class TypeDropdown extends StatelessWidget {
  const TypeDropdown({
    Key? key,
    this.isPriority = false,
    this.task,
    this.child,
    this.hoverColor,
    this.color,
    this.focusedBorder,
    this.unfocusedBorder,
    this.borderRadius,
    this.onSelected,
  }) : super(key: key);
  final bool isPriority;
  final TaskModel? task;
  final Widget? child;
  final Color? hoverColor;
  final Color? color;
  final Border? focusedBorder;
  final Border? unfocusedBorder;
  final BorderRadius? borderRadius;
  final void Function(GlobalTypes value)? onSelected;

  @override
  Widget build(BuildContext context) {
    final List<GlobalTypes> types = isPriority
        ? [
            PriorityTypes.none(),
            PriorityTypes.urgently(),
            PriorityTypes.high(),
            PriorityTypes.mid(),
            PriorityTypes.low(),
          ]
        : [
            Types.backlog(),
            Types.waiting(),
            Types.inWork(),
            Types.review(),
            Types.done(),
            Types.cancelled(),
          ];
    return custom.CustomPopupMenuButton<GlobalTypes>(
      focusedBorder: focusedBorder,
      unfocusedBorder: unfocusedBorder,
      borderRadius: borderRadius,
      offset: Offset(
        0,
        getOffset(
          isPriority
              ? (task?.priority ?? PriorityTypes.none())
              : (task?.type ?? Types.backlog()),
        ),
      ),
      padding: EdgeInsets.zero,
      hoverColor: hoverColor,
      position: custom.PopupMenuPosition.over,
      color: color ?? context.colors.textFieldColor,
      initialValue: isPriority
          ? (task?.priority ?? PriorityTypes.none())
          : (task?.type ?? Types.backlog()),
      tooltip: '',
      itemBuilder: (context) => List.generate(
        types.length,
        (index) => custom.CustomPopupMenuItem<GlobalTypes>(
          height: 32,
          value: types[index],
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: isPriority ? 163 : 208,
            child: Row(
              children: [
                const SizedBox(width: 18),
                SvgPicture.asset(
                  types[index].iconPath,
                  width: 16,
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  types[index].label,
                  style: context.textStyles.regular,
                ),
              ],
            ),
          ),
        ),
      ),
      onSelected: onSelected ?? (value) {},
      child: child ??
          SvgPicture.asset(
            isPriority
                ? (task?.priority.iconPath ?? PriorityTypes.none().iconPath)
                : (task?.type.iconPath ?? Types.backlog().iconPath),
            color: isPriority && task != null && task!.priority.isImportant
                ? const Color(0xFFF97316)
                : null,
            width: 16,
          ),
    );
  }

  double getOffset(GlobalTypes globalType) {
    return (globalType.padding - 1) * 32;
  }
}
