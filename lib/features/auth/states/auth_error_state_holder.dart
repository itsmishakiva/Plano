import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/error_model.dart';

StateNotifierProvider<AuthErrorStateHolder, ErrorModel> authErrorStateHolder =
    StateNotifierProvider<AuthErrorStateHolder, ErrorModel>(
  (ref) => AuthErrorStateHolder(ErrorModel()),
);

class AuthErrorStateHolder extends StateNotifier<ErrorModel> {
  AuthErrorStateHolder(super.state);

  void updateState({String? email, String? password}) {
    state = state.copyWith(
      email: email,
      password: password,
    );
  }

  void clearState() {
    state = ErrorModel();
  }
}
