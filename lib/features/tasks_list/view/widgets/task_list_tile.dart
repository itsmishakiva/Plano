import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/edit_task/manager/edit_task_manager.dart';
import 'package:plano/features/tasks_list/models/priority_types.dart';
import 'package:plano/features/tasks_list/models/types.dart';
import 'package:plano/navigation/navigation_manager.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../../common/models/task_model.dart';
import '../../../common/widgets/type_dropdown.dart';
import '../../manager/task_list_manager.dart';

//Task UI in ListView
class TaskListTile extends ConsumerWidget {
  const TaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);
  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onSecondaryTapUp: (details) {
        double left =
            details.globalPosition.dx > MediaQuery.of(context).size.width - 208
                ? details.globalPosition.dx - 208
                : details.globalPosition.dx;
        double top =
            details.globalPosition.dy > MediaQuery.of(context).size.height - 32
                ? details.globalPosition.dy - 32
                : details.globalPosition.dy;
        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          barrierDismissible: true,
          builder: (context) => Stack(
            children: [
              Positioned(
                left: left,
                top: top,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colors.textFieldColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(14, 2),
                            blurRadius: 77,
                            blurStyle: BlurStyle.inner),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        hoverColor: context.colors.textFieldBorderColor,
                        onHover: (details) {},
                        onTap: () {
                          ref.read(taskListManagerProvider).deleteTask(task.id);
                          ref.read(navigationProvider).pop();
                        },
                        child: Container(
                          height: 32,
                          width: 208,
                          padding: const EdgeInsets.symmetric(horizontal: 18.4),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/vector/trash.svg',
                                width: 12,
                                color: context.colors.textColor,
                              ),
                              const SizedBox(width: 14.4),
                              Text(
                                'Удалить',
                                style: context.textStyles.regular,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: InkWell(
        onHover: (event) {},
        onTap: () {
          ref.read(editTaskManagerProvider).openEditTask(
                TaskModel(
                  id: task.id,
                  title: task.title,
                  type: task.type,
                  priority: task.priority,
                  description: task.description,
                ),
              );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: SizedBox(
            height: 56.0,
            child: Row(
              children: [
                TypeDropdown(
                  isPriority: true,
                  task: task,
                  onSelected: (value) async {
                    if (value is PriorityTypes) {
                      await ref.read(editTaskManagerProvider).editTask(
                            task.copyWith(
                              priority: value,
                            ),
                          );
                      ref.read(taskListManagerProvider).getListData();
                    }
                  },
                ),
                const SizedBox(
                  width: 18,
                ),
                SizedBox(
                  width: 52.0,
                  child: Text(
                    task.id.toString(),
                    style: context.textStyles.regularSecondary,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                TypeDropdown(
                  task: task,
                  onSelected: (value) async {
                    if (value is Types) {
                      await ref.read(editTaskManagerProvider).editTask(
                            task.copyWith(
                              type: value,
                            ),
                          );
                      ref.read(taskListManagerProvider).getListData();
                    }
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    task.title,
                    style: context.textStyles.regular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
