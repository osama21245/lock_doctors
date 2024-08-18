import 'package:lock_doctors/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/features/auth/presentation/widgets/email_and_password.dart';
import 'package:lock_doctors/features/auth/presentation/widgets/login_state_controller.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomLoginState(
      widget: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const CustomEmailAndPassword(),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign in',
                onPressed: () {
                  if (context
                      .read<AuthBloc>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignUp(""),
                        );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ));
  }
}
