import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/edit_task/data/repository/edit_task_repository.dart';

import '../../common/models/task_model.dart';
import '../state/edit_task_state.dart';

Provider<EditTaskManager> editTaskManagerProvider = Provider<EditTaskManager>(
  (ref) => EditTaskManager(
    editTaskState: ref.watch(editTaskStateProvider.notifier),
    repository: ref.watch(editTaskRepositoryProvider),
  ),
);

class EditTaskManager {
  EditTaskManager({
    required this.editTaskState,
    required this.repository,
  });

  final EditTaskState editTaskState;
  final EditTaskRepository repository;

  Future<void> editTask(TaskModel task) async {
    await repository.editTask(task);
  }

  void openEditTask(TaskModel model) {
    editTaskState.setState(model);
  }

  void updateEditingTask(TaskModel task) {
    editTaskState.updateState(task: task);
  }

  void closeEditing() {
    editTaskState.setState(null);
  }
}
