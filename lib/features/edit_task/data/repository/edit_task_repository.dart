import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/edit_task/data/api/edit_task_api.dart';

import '../../../common/models/task_model.dart';

Provider<EditTaskRepository> editTaskRepositoryProvider =
    Provider<EditTaskRepository>(
  (ref) => EditTaskRepository(
    api: ref.read(editTaskAPIProvider),
  ),
);

class EditTaskRepository {
  EditTaskRepository({
    required this.api,
  });

  final EditTaskAPI api;

  Future<void> editTask(TaskModel task) async {
    await api.updateTask(task);
  }
}
