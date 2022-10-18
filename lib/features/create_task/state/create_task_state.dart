import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/common/models/task_model.dart';

import '../../tasks_list/models/priority_types.dart';
import '../../tasks_list/models/types.dart';

StateNotifierProvider<CreateTaskState, TaskModel> createTaskStateProvider =
    StateNotifierProvider<CreateTaskState, TaskModel>(
  (ref) => CreateTaskState(
    TaskModel(
      id: 1,
      title: '',
      description: '',
      priority: PriorityTypes.none(),
      type: Types.backlog(),
    ),
  ),
);

class CreateTaskState extends StateNotifier<TaskModel> {
  CreateTaskState(super.state);

  void clearState() {
    state = TaskModel(
      id: 1,
      title: '',
      description: '',
      priority: PriorityTypes.none(),
      type: Types.backlog(),
    );
  }

  void updateState({
    int? id,
    String? title,
    Types? type,
    PriorityTypes? priority,
    String? description,
  }) {
    state = state.copyWith(
      id: id,
      title: title,
      type: type,
      priority: priority,
      description: description,
    );
  }
}
