import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/common/models/task_model.dart';

import '../models/types.dart';

StateNotifierProvider<TasksListStateHolder, List<TaskModel>?>
    tasksListStateHolder =
    StateNotifierProvider<TasksListStateHolder, List<TaskModel>?>(
  (ref) => TasksListStateHolder(null),
);

class TasksListStateHolder extends StateNotifier<List<TaskModel>?> {
  TasksListStateHolder(state) : super(state);

  void setList(List<TaskModel> list) {
    list.sort(
        (first, second) => first.type.hashCode.compareTo(second.type.hashCode));
    state = list;
  }

  void addToList(List<TaskModel> list) {
    List<TaskModel> newList = [];
    for (TaskModel item in state!) {
      newList.add(item);
    }
    for (TaskModel item in list) {
      newList.add(item);
    }
    newList.sort(
        (first, second) => first.type.hashCode.compareTo(second.type.hashCode));
    state = newList;
  }

  //All length methods are needed to have array parsed in list normally
  //We call them in TasksListPage

  int getReviewLength() {
    if (state == null) return 0;
    int len = 0;
    for (var task in state!) {
      if (task.type == Types.review()) len++;
    }
    return len;
  }

  int getInWorkLength() {
    if (state == null) return 0;
    int len = 0;
    for (var task in state!) {
      if (task.type == Types.inWork()) len++;
    }
    return len;
  }

  int getWaitingLength() {
    if (state == null) return 0;
    int len = 0;
    for (var task in state!) {
      if (task.type == Types.waiting()) len++;
    }
    return len;
  }

  int getBacklogLength() {
    if (state == null) return 0;
    int len = 0;
    for (var task in state!) {
      if (task.type == Types.backlog()) len++;
    }
    return len;
  }

  int getDoneLength() {
    if (state == null) return 0;
    int len = 0;
    for (var task in state!) {
      if (task.type == Types.done()) len++;
    }
    return len;
  }

  int getCancelledLength() {
    if (state == null) return 0;
    int len = 0;
    for (var task in state!) {
      if (task.type == Types.cancelled()) len++;
    }
    return len;
  }

  void clearList() {
    state = null;
  }
}
