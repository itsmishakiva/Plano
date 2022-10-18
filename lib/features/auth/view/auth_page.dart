import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/auth/manager/auth_manager.dart';
import 'package:plano/features/auth/states/auth_error_state_holder.dart';
import 'package:plano/features/auth/view/widgets/auth_text_field.dart';
import 'package:plano/themes/build_context_extension.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  //Method that draws the ui of the AuthScreen
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordFocus = FocusNode();
    final authError = ref.watch(authErrorStateHolder);
    //Width of buttons, text fields, etc. on this screen
    const double contentWidth = 312;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //Spacer is required at the top and bottom of the column
            //for content adaptivity.
            //Flex parameter takes part of unused screen space equal to
            //flexN/(flex1 + flex2 + ... + flexN)
            const Spacer(
              flex: 229,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 64,
            ),
            const SizedBox(
              height: 32,
            ),
            AuthTextField(
              controller: emailController,
              width: contentWidth,
              height: 38,
              errorText: authError.emailError,
              labelText: 'Email',
              onSubmitted: (val) {
                passwordFocus.requestFocus();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            AuthTextField(
              controller: passwordController,
              focusNode: passwordFocus,
              width: contentWidth,
              errorText: authError.passwordError,
              height: 38,
              labelText: 'Пароль',
              obscureText: true,
              onSubmitted: (val) {
                ref.read(authManagerProvider).auth(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: contentWidth,
              height: 30,
              child: TextButton(
                onPressed: () {
                  ref.read(authManagerProvider).auth(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                child: Text(
                  'Войти',
                  style: context.textStyles.small,
                ),
              ),
            ),
            const Spacer(
              flex: 335,
            ),
          ],
        ),
      ),
    );
  }
}
