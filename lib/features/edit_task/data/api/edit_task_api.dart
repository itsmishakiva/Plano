import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:plano/features/auth/states/auth_token_state_holder.dart';

import '../../../../proto/generated/issue.pbgrpc.dart';
import '../../../common/models/task_model.dart';

Provider<EditTaskAPI> editTaskAPIProvider = Provider<EditTaskAPI>(
  (ref) => EditTaskAPI(
    token: ref.watch(authTokenStateHolder),
  ),
);

class EditTaskAPI {
  EditTaskAPI({required this.token});

  final String? token;
  IssueServiceClient tasksService = IssueServiceClient(
    ClientChannel(
      'plano.ru',
      port: 9090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    ),
  );

  Future<void> updateTask(TaskModel task) async {
    try {
      await tasksService.edit(
        IssueEditRequest(
          id: Int64(task.id),
          name: task.title,
          description: task.description,
          priority: task.priority.priority,
          status: task.type.status,
        ),
        options: CallOptions(metadata: {
          'Authorization': 'Bearer ${token!}',
        }),
      );
    } catch (e) {
      return;
    }
  }
}
