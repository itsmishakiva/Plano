import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/common/models/task_model.dart';
import 'package:plano/features/create_task/data/api/create_task_api.dart';

Provider<CreateTaskRepository> createTaskRepositoryProvider =
    Provider<CreateTaskRepository>(
  (ref) => CreateTaskRepository(
    api: ref.read(createTaskAPIProvider),
  ),
);

class CreateTaskRepository {
  CreateTaskRepository({
    required this.api,
  });

  final CreateTaskAPI api;

  Future<void> createTask(TaskModel task) async {
    await api.createTask(task);
  }
}
