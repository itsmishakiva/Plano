import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/auth/repository/auth_repository.dart';
import 'package:plano/features/auth/states/auth_error_state_holder.dart';
import 'package:plano/navigation/navigation_manager.dart';

Provider<AuthManager> authManagerProvider = Provider<AuthManager>(
  (ref) => AuthManager(
    navigator: ref.read(navigationProvider),
    errorStateHolder: ref.read(authErrorStateHolder.notifier),
    repository: ref.read(authRepositoryProvider),
  ),
);

//Here we describe all state management logic of auth page
class AuthManager {
  final NavigationManager navigator;
  final AuthErrorStateHolder errorStateHolder;
  final AuthRepository repository;

  AuthManager({
    required this.navigator,
    required this.errorStateHolder,
    required this.repository,
  });

  void auth({String? email, String? password}) {
    errorStateHolder.clearState();
    if ((email == null || email.isEmpty || !_validateEmail(email)) &&
        (password == null || password.isEmpty)) {
      errorStateHolder.updateState(
        email: 'Неправильный email',
        password: 'Неправильный пароль',
      );
    }
    if (email == null || email.isEmpty || !_validateEmail(email)) {
      errorStateHolder.updateState(email: 'Неправильный email');
    } else if (password == null || password.isEmpty) {
      errorStateHolder.updateState(password: 'Неправильный пароль');
    } else {
      repository.auth(email: email, password: password);
    }
  }

  bool _validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
