import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/common/models/task_model.dart';
import 'package:plano/features/tasks_list/data/repository/task_list_repository.dart';
import 'package:plano/features/tasks_list/states/tasks_list_state_holder.dart';

Provider<TaskListManager> taskListManagerProvider = Provider<TaskListManager>(
  (ref) => TaskListManager(
    tasksListState: ref.watch(tasksListStateHolder.notifier),
    taskListRepository: ref.watch(taskListProvider),
    tasksListValue: ref.watch(tasksListStateHolder),
  ),
);

class TaskListManager {
  TaskListManager({
    required this.tasksListState,
    required this.taskListRepository,
    required this.tasksListValue,
  });

  final TasksListStateHolder tasksListState;
  final TaskListRepository taskListRepository;
  final List<TaskModel>? tasksListValue;

  Future<void> deleteTask(int id) async {
    await taskListRepository.deleteTask(id);
    getListData();
  }

  Future<void> getListData() async {
    await taskListRepository.getListOfTasks();
  }
}
