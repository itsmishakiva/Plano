import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plano/features/common/widgets/type_dropdown.dart';
import 'package:plano/features/edit_task/manager/edit_task_manager.dart';
import 'package:plano/features/edit_task/state/edit_task_state.dart';
import 'package:plano/features/tasks_list/manager/task_list_manager.dart';
import 'package:plano/features/tasks_list/models/priority_types.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/svg_icon_button.dart';
import '../../create_task/view/widgets/modal_text_field.dart';
import '../../tasks_list/models/types.dart';

class EditTaskPage extends ConsumerWidget {
  EditTaskPage({Key? key}) : super(key: key);
  final FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    node.requestFocus();
    final task = ref.watch(editTaskStateProvider);
    final TextEditingController titleController =
        TextEditingController(text: task?.title);
    final TextEditingController descriptionController =
        TextEditingController(text: task?.description);
    return KeyboardListener(
      focusNode: node,
      onKeyEvent: (key) async {
        if (key.physicalKey == PhysicalKeyboardKey.escape) {
          await ref.read(editTaskManagerProvider).editTask(
                task.copyWith(
                  title: titleController.value.text,
                  description: descriptionController.value.text,
                ),
              );
          ref.read(taskListManagerProvider).getListData();
          ref.read(editTaskManagerProvider).closeEditing();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: context.colors.backgroundColor,
          child: Column(
            children: [
              Container(
                height: 56,
                color: context.colors.headerSecondaryColor,
                child: Row(
                  children: [
                    const SizedBox(width: 24.0),
                    SvgIconButton(
                      svgPath: 'assets/vector/cross.svg',
                      onTap: () async {
                        await ref.read(editTaskManagerProvider).editTask(
                              task!.copyWith(
                                title: titleController.value.text,
                                description: descriptionController.value.text,
                              ),
                            );
                        ref.read(taskListManagerProvider).getListData();
                        ref.read(editTaskManagerProvider).closeEditing();
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: MediaQuery.of(context).size.width < 1230
                          ? (MediaQuery.of(context).size.width < 930 ? 1 : 3)
                          : 900,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16.0),
                                  Text(
                                    task!.id.toString(),
                                    style: context.textStyles.regular,
                                  ),
                                  const Spacer(),
                                  CustomTextButton(
                                    onTap: () {},
                                    text: 'Удалить',
                                    textStyle:
                                        context.textStyles.regularSecondary!,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: context.colors.modalDividerColor,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ModalTextField(
                                controller: titleController,
                                filled: false,
                                hint: 'Задача',
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ModalTextField(
                              controller: descriptionController,
                              style: context.textStyles.large,
                              padding: const EdgeInsets.all(16.0),
                              filled: false,
                              minLines: 9,
                              maxLines: null,
                              hint: 'Добавить описание',
                              hintStyle: context.textStyles.large!.copyWith(
                                color: const Color(0x66FFFFFF),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: context.colors.enabledButtonColor!,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: context.colors.modalDividerColor,
                    ),
                    Expanded(
                      flex: MediaQuery.of(context).size.width < 1230
                          ? (MediaQuery.of(context).size.width < 930 ? 1 : 2)
                          : 340,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                task.id.toString(),
                                style: context.textStyles.regularSecondary,
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: context.colors.modalDividerColor,
                            ),
                            const SizedBox(height: 26.0),
                            Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    'Статус',
                                    style: context.textStyles.smallSecondary!,
                                  ),
                                ),
                                const Spacer(
                                  flex: 32,
                                ),
                                Expanded(
                                  flex: 260,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: TypeDropdown(
                                      task: task,
                                      unfocusedBorder:
                                          Border.all(color: Colors.transparent),
                                      focusedBorder: Border.all(
                                        color: context
                                            .colors.textFieldBorderColor!,
                                      ),
                                      hoverColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.0),
                                      onSelected: (value) {
                                        if (value is Types) {
                                          ref
                                              .read(editTaskManagerProvider)
                                              .updateEditingTask(
                                                task.copyWith(
                                                  type: value,
                                                  title: titleController
                                                      .value.text,
                                                  description:
                                                      descriptionController
                                                          .value.text,
                                                ),
                                              );
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              task.type.iconPath,
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                child: Text(
                                                  task.type.label,
                                                  style: context
                                                      .textStyles.regular!,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 26.0),
                            Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    'Приоритет',
                                    style: context.textStyles.smallSecondary!,
                                  ),
                                ),
                                const Spacer(
                                  flex: 32,
                                ),
                                Expanded(
                                  flex: 260,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: TypeDropdown(
                                      task: task,
                                      isPriority: true,
                                      unfocusedBorder:
                                          Border.all(color: Colors.transparent),
                                      focusedBorder: Border.all(
                                        color: context
                                            .colors.textFieldBorderColor!,
                                      ),
                                      hoverColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.0),
                                      onSelected: (value) {
                                        if (value is PriorityTypes) {
                                          ref
                                              .read(editTaskManagerProvider)
                                              .updateEditingTask(
                                                task.copyWith(
                                                  priority: value,
                                                  title: titleController
                                                      .value.text,
                                                  description:
                                                      descriptionController
                                                          .value.text,
                                                ),
                                              );
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              task.priority.iconPath,
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                child: Text(
                                                  task.priority.label,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .textStyles.regular!,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
