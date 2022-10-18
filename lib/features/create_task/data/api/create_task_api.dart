import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:plano/features/auth/states/auth_token_state_holder.dart';
import 'package:plano/proto/generated/issue.pbgrpc.dart';

import '../../../common/models/task_model.dart';

Provider<CreateTaskAPI> createTaskAPIProvider =
    Provider<CreateTaskAPI>((ref) => CreateTaskAPI(
          token: ref.watch(authTokenStateHolder),
        ));

class CreateTaskAPI {
  CreateTaskAPI({this.token});

  final String? token;
  IssueServiceClient tasksService = IssueServiceClient(
    ClientChannel(
      'plano.ru',
      port: 9090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    ),
  );

  Future<void> createTask(TaskModel task) async {
    try {
      await tasksService.create(
        IssueCreateRequest(
          workspaceId: Int64(task.id),
          name: task.title,
          description: task.description,
          status: task.type.status,
          priority: task.priority.priority,
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
