import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/tasks_list/data/api/task_list_api.dart';
import 'package:plano/features/tasks_list/states/tasks_list_state_holder.dart';

Provider<TaskListRepository> taskListProvider = Provider<TaskListRepository>(
  (ref) => TaskListRepository(
    api: ref.watch(taskAPIProvider),
    listStateHolder: ref.watch(tasksListStateHolder.notifier),
  ),
);

class TaskListRepository {
  TaskListRepository({
    required this.api,
    required this.listStateHolder,
  });

  final TaskListAPI api;
  final TasksListStateHolder listStateHolder;

  Future<void> deleteTask(int id) async {
    await api.deleteTask(id);
  }

  Future<void> getListOfTasks() async {
    listStateHolder.setList(
      await api.getListOfTasks(),
    );
  }
}
