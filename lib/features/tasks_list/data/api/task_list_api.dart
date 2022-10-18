import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:plano/features/auth/states/auth_token_state_holder.dart';
import 'package:plano/features/tasks_list/models/priority_types.dart';
import 'package:plano/proto/generated/issue.pbgrpc.dart';

import '../../../common/models/task_model.dart';
import '../../models/types.dart';

Provider<TaskListAPI> taskAPIProvider = Provider<TaskListAPI>(
  (ref) => TaskListAPI(
    token: ref.watch(authTokenStateHolder),
  ),
);

class TaskListAPI {
  TaskListAPI({required this.token});

  final String? token;
  IssueServiceClient tasksService = IssueServiceClient(
    ClientChannel(
      'plano.ru',
      port: 9090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    ),
  );

  Future<void> deleteTask(int id) async {
    try {
      await tasksService.delete(
        IssueDeleteRequest(
          id: Int64(id),
        ),
        options: CallOptions(metadata: {
          'Authorization': 'Bearer ${token!}',
        }),
      );
    } catch (e) {
      return;
    }
  }

  Future<List<TaskModel>> getListOfTasks() async {
    try {
      final response = await tasksService.search(
        IssueSearchRequest(
          workspaceId: Int64(1),
        ),
        options: CallOptions(metadata: {
          'Authorization': 'Bearer ${token!}',
        }),
      );
      final issues = response.issues;
      return issues
          .map(
            (e) => TaskModel(
              id: e.id.toInt(),
              title: e.name,
              type: Types.fromStatus(e.status),
              priority: PriorityTypes.fromPriority(e.priority),
              description: e.description,
            ),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }
}
