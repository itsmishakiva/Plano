import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/common/models/task_model.dart';
import 'package:plano/features/create_task/state/create_task_state.dart';
import 'package:plano/features/tasks_list/manager/task_list_manager.dart';

import '../../tasks_list/models/priority_types.dart';
import '../../tasks_list/models/types.dart';
import '../data/repository/create_task_repository.dart';

Provider<CreateTaskManager> createTaskManagerProvider =
    Provider<CreateTaskManager>(
  (ref) => CreateTaskManager(
    repository: ref.read(createTaskRepositoryProvider),
    state: ref.watch(createTaskStateProvider.notifier),
    stateValue: ref.watch(createTaskStateProvider),
    taskListManager: ref.watch(taskListManagerProvider),
  ),
);

class CreateTaskManager {
  CreateTaskManager({
    required this.repository,
    required this.state,
    required this.stateValue,
    required this.taskListManager,
  });

  final CreateTaskRepository repository;
  final CreateTaskState state;
  final TaskModel stateValue;
  final TaskListManager taskListManager;

  void createTask() async {
    await repository.createTask(stateValue);
    taskListManager.getListData();
  }

  void clearTaskParams() {
    state.clearState();
  }

  void updateTaskParams({
    int? id,
    String? title,
    Types? type,
    PriorityTypes? priority,
    String? description,
  }) {
    state.updateState(
      id: id,
      title: title,
      type: type,
      priority: priority,
      description: description,
    );
  }
}
