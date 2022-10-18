import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../../../../proto/generated/auth.pbgrpc.dart';
import '../../states/auth_error_state_holder.dart';

Provider<AuthAPI> authAPIProvider = Provider<AuthAPI>(
  (ref) => AuthAPI(
    errorStateHolder: ref.read(authErrorStateHolder.notifier),
  ),
);

class AuthAPI {
  AuthAPI({
    required this.errorStateHolder,
  });

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://api.plano.ru',
    ),
  );

  final AuthErrorStateHolder errorStateHolder;

  AuthServiceClient authService = AuthServiceClient(
    ClientChannel(
      'plano.ru',
      port: 9090,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  Future<String?> authAPI(
      {required String email, required String password}) async {
    try {
      await dio.post(
        '/api/v1/auth/signup/',
        data: {
          "email": email,
          "password": password,
          'username': email,
        },
      );
    } on DioError catch (e) {
      if (e.response?.statusCode != 400) {
        errorStateHolder.updateState(email: e.message);
      }
    }

    try {
      var result = await authService.login(
        LoginRequest(
          username: email,
          password: password,
        ),
      );
      return result.token;
    } on GrpcError catch (e) {
      errorStateHolder.updateState(password: e.message);
    }
    return null;
  }
}
