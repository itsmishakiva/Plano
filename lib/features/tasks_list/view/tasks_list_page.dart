import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/edit_task/state/edit_task_state.dart';
import 'package:plano/features/side_menu/view/side_menu.dart';
import 'package:plano/features/tasks_list/manager/task_list_manager.dart';
import 'package:plano/features/tasks_list/states/tasks_list_state_holder.dart';
import 'package:plano/features/tasks_list/view/widgets/task_list_tile.dart';
import 'package:plano/features/tasks_list/view/widgets/tasks_empty.dart';
import 'package:plano/features/tasks_list/view/widgets/type_header.dart';
import 'package:plano/themes/build_context_extension.dart';

import '../../common/models/task_model.dart';
import '../../create_task/view/create_task_dialog.dart';
import '../../edit_task/view/edit_task_page.dart';
import '../models/types.dart';

class TasksListPage extends ConsumerWidget {
  TasksListPage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    node.requestFocus();
    final editingTaskState = ref.watch(editTaskStateProvider);
    final listOfTasks = ref.watch(tasksListStateHolder);
    final listOfTasksInfo = ref.watch(tasksListStateHolder.notifier);
    if (listOfTasks == null) {
      ref.read(taskListManagerProvider).getListData();
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return KeyboardListener(
      autofocus: true,
      focusNode: node,
      onKeyEvent: (event) {
        if (event.physicalKey == PhysicalKeyboardKey.keyC &&
            ref.watch(editTaskStateProvider) == null) {
          showDialog(
            context: context,
            barrierColor: const Color(0x66252525),
            builder: (context) => const CreateTaskDialog(),
          );
        }
        /*if (event.physicalKey == PhysicalKeyboardKey.keyA) {
            var entry = OverlayEntry(
              builder: (context) => Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            );
            Overlay.of(context)!.insert(
              entry,
            );
            Future.delayed(Duration(seconds: 3), () {
              entry.remove();
            });
          }*/
      },
      child: Scaffold(
        body: Scrollbar(
          controller: _scrollController,
          child: Row(
            children: [
              const SideMenu(),
              VerticalDivider(
                color: context.colors.borderSideColor,
                width: 1,
                thickness: 1,
              ),
              if (listOfTasks.isEmpty) const Expanded(child: TasksEmpty()),
              if (listOfTasks.isNotEmpty)
                Expanded(
                  child: Stack(
                    children: [
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: ListView.separated(
                          controller: _scrollController,
                          itemCount: listOfTasks.length + 7,
                          itemBuilder: (context, index) {
                            return _getListViewContent(
                                context, listOfTasks, listOfTasksInfo, index);
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: context.colors.borderSideColor,
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                      ),
                      if (editingTaskState != null)
                        Container(
                          color: context.colors.backPageColor,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: EditTaskPage(),
                          ),
                        ),
                    ],
                  ),
                ),
              if (editingTaskState == null) const SizedBox(width: 17.0),
            ],
          ),
        ),
      ),
    );
  }

  //This function is responsible for parsing array on ListView by statuses
  Widget _getListViewContent(
    BuildContext context,
    List<TaskModel> listOfTasks,
    TasksListStateHolder listOfTasksInfo,
    int index,
  ) {
    if (index == 0) {
      return SizedBox(
        height: 64,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text('Активные задачи', style: context.textStyles.regular),
            const SizedBox(width: 8),
            Text(
              listOfTasks.length.toString(),
              style: context.textStyles.regularSecondary,
            ),
          ],
        ),
      );
    }
    if (index == 1) {
      return TypeHeader(
        type: Types.review(),
        count: listOfTasksInfo.getReviewLength(),
      );
    }
    if (index == 2 + listOfTasksInfo.getReviewLength()) {
      return TypeHeader(
        type: Types.inWork(),
        count: listOfTasksInfo.getInWorkLength(),
      );
    }
    if (index ==
        3 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength()) {
      return TypeHeader(
        type: Types.waiting(),
        count: listOfTasksInfo.getWaitingLength(),
      );
    }
    if (index ==
        4 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength() +
            listOfTasksInfo.getWaitingLength()) {
      return TypeHeader(
        type: Types.backlog(),
        count: listOfTasksInfo.getBacklogLength(),
      );
    }
    if (index ==
        5 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength() +
            listOfTasksInfo.getWaitingLength() +
            listOfTasksInfo.getBacklogLength()) {
      return TypeHeader(
        type: Types.done(),
        count: listOfTasksInfo.getDoneLength(),
      );
    }
    if (index ==
        6 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength() +
            listOfTasksInfo.getWaitingLength() +
            listOfTasksInfo.getBacklogLength() +
            listOfTasksInfo.getDoneLength()) {
      return TypeHeader(
        type: Types.cancelled(),
        count: listOfTasksInfo.getCancelledLength(),
      );
    }
    if (index >
        6 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength() +
            listOfTasksInfo.getWaitingLength() +
            listOfTasksInfo.getBacklogLength() +
            listOfTasksInfo.getDoneLength()) {
      return TaskListTile(
        task: listOfTasks[index - 7],
      );
    }
    if (index >
        5 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength() +
            listOfTasksInfo.getWaitingLength() +
            listOfTasksInfo.getBacklogLength()) {
      return TaskListTile(
        task: listOfTasks[index - 6],
      );
    }
    if (index >
        4 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength() +
            listOfTasksInfo.getWaitingLength()) {
      return TaskListTile(
        task: listOfTasks[index - 5],
      );
    }
    if (index >
        3 +
            listOfTasksInfo.getReviewLength() +
            listOfTasksInfo.getInWorkLength()) {
      return TaskListTile(
        task: listOfTasks[index - 4],
      );
    }
    if (index > 2 + listOfTasksInfo.getReviewLength()) {
      return TaskListTile(
        task: listOfTasks[index - 3],
      );
    }
    if (index > 1) {
      return TaskListTile(
        task: listOfTasks[index - 2],
      );
    }
    return const SizedBox(height: 20);
  }
}
