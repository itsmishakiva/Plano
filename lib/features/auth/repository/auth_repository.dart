import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/tasks_list/data/api/task_list_api.dart';
import 'package:plano/navigation/navigation_manager.dart';

import '../data/api/auth_api.dart';
import '../states/auth_token_state_holder.dart';

Provider<AuthRepository> authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    api: ref.read(authAPIProvider),
    navigator: ref.read(navigationProvider),
    tokenStateHolder: ref.read(authTokenStateHolder.notifier),
    taskAPI: ref.read(taskAPIProvider),
  ),
);

//We will have data management logic here
//Whether to send/get data to/from API or DB etc.
class AuthRepository {
  AuthRepository({
    required this.api,
    required this.tokenStateHolder,
    required this.navigator,
    required this.taskAPI,
  });

  final AuthAPI api;
  final AuthTokenStateHolder tokenStateHolder;
  final NavigationManager navigator;
  final TaskListAPI taskAPI;

  void auth({
    required String email,
    required String password,
  }) async {
    final token = await api.authAPI(email: email, password: password);
    if (token == null) return;
    tokenStateHolder.setToken(token);
    navigator.navigateFromAuth();
  }
}
