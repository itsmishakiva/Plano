import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<AuthTokenStateHolder, String?> authTokenStateHolder =
    StateNotifierProvider<AuthTokenStateHolder, String?>(
  (ref) => AuthTokenStateHolder(null),
);

class AuthTokenStateHolder extends StateNotifier<String?> {
  AuthTokenStateHolder(super.state);

  void setToken(String token) {
    state = token;
  }

  void removeToken() {
    state = null;
  }
}
