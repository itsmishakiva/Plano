import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/common/models/task_model.dart';

StateNotifierProvider<EditTaskState, TaskModel?> editTaskStateProvider =
    StateNotifierProvider<EditTaskState, TaskModel?>(
  (ref) => EditTaskState(null),
);

class EditTaskState extends StateNotifier<TaskModel?> {
  EditTaskState(super.state);

  void setState(TaskModel? model) {
    state = model;
  }

  void updateState({
    required TaskModel task,
  }) {
    state = state?.copyWith(
      id: task.id,
      title: task.title,
      type: task.type,
      priority: task.priority,
      description: task.description,
    );
  }
}
