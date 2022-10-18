import 'package:plano/features/tasks_list/models/priority_types.dart';

import '../../tasks_list/models/types.dart';

class TaskModel {
  final int id;
  final String title;
  final String? description;
  final PriorityTypes priority;
  final Types type;

  TaskModel({
    required this.id,
    required this.title,
    required this.type,
    required this.priority,
    this.description,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    Types? type,
    PriorityTypes? priority,
    String? description,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      description: description ?? this.description,
    );
  }
}
