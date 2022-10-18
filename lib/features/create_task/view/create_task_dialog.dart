import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/common/widgets/type_dropdown.dart';
import 'package:plano/features/create_task/manager/create_task_manager.dart';
import 'package:plano/features/create_task/state/create_task_state.dart';
import 'package:plano/features/create_task/view/widgets/modal_button.dart';
import 'package:plano/features/create_task/view/widgets/modal_text_field.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../../navigation/navigation_manager.dart';
import '../../common/models/task_model.dart';
import '../../common/widgets/svg_icon_button.dart';
import '../../tasks_list/models/global_types.dart';
import '../../tasks_list/models/priority_types.dart';
import '../../tasks_list/models/types.dart';

class CreateTaskDialog extends ConsumerWidget {
  const CreateTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TaskModel task = ref.watch(createTaskStateProvider);
    TextEditingController titleController =
        TextEditingController(text: task.title);
    TextEditingController descriptionController =
        TextEditingController(text: task.description);
    return WillPopScope(
      onWillPop: () async {
        ref.read(createTaskManagerProvider).clearTaskParams();
        return true;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.23,
          vertical: 80,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.colors.textFieldColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              'Новая задача',
                              style: context.textStyles.regular,
                            ),
                          ),
                          const Spacer(),
                          SvgIconButton(
                            svgPath: 'assets/vector/cross.svg',
                            onTap: () {
                              ref
                                  .read(createTaskManagerProvider)
                                  .clearTaskParams();
                              ref.read(navigationProvider).pop();
                            },
                          ),
                          const SizedBox(width: 6.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ModalTextField(
                        controller: titleController,
                        hint: 'Задача',
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ModalTextField(
                        controller: descriptionController,
                        style: context.textStyles.large,
                        minLines: 5,
                        maxLines: null,
                        hint: 'Добавить описание',
                        hintStyle: context.textStyles.large!.copyWith(
                          color: const Color(0x66FFFFFF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: TypeDropdown(
                              task: task,
                              hoverColor:
                                  context.colors.focusedButtonSecondaryColor,
                              onSelected: (GlobalTypes value) {
                                if (value is Types) {
                                  ref
                                      .read(createTaskManagerProvider)
                                      .updateTaskParams(
                                        title: titleController.value.text,
                                        description:
                                            descriptionController.value.text,
                                        type: value,
                                      );
                                }
                              },
                              child: ModalButton(
                                width: null,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        task.type.iconPath,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        task.type.label,
                                        style: context.textStyles.small,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: TypeDropdown(
                              isPriority: true,
                              task: task,
                              hoverColor:
                                  context.colors.focusedButtonSecondaryColor,
                              onSelected: (GlobalTypes value) {
                                if (value is PriorityTypes) {
                                  ref
                                      .read(createTaskManagerProvider)
                                      .updateTaskParams(
                                        title: titleController.value.text,
                                        description:
                                            descriptionController.value.text,
                                        priority: value,
                                      );
                                }
                              },
                              child: ModalButton(
                                width: 36,
                                child: SvgPicture.asset(
                                  task.priority.iconPath,
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: context.colors.modalDividerColor,
                    ),
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                          right: 26.0,
                        ),
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              if (titleController.value.text.isNotEmpty) {
                                ref
                                    .read(createTaskManagerProvider)
                                    .updateTaskParams(
                                      title: titleController.value.text,
                                      description:
                                          descriptionController.value.text,
                                    );
                                ref
                                    .read(createTaskManagerProvider)
                                    .createTask();
                                ref
                                    .read(createTaskManagerProvider)
                                    .clearTaskParams();
                                ref.read(navigationProvider).pop();
                              }
                            },
                            child: Text(
                              'Создать',
                              style: context.textStyles.small,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
