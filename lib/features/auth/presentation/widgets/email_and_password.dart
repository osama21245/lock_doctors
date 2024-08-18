import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lock_doctors/features/auth/presentation/widgets/auth_field.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacer.dart';

class CustomEmailAndPassword extends StatefulWidget {
  const CustomEmailAndPassword({super.key});

  @override
  State<CustomEmailAndPassword> createState() => _CustomEmailAndPasswordState();
}

class _CustomEmailAndPasswordState extends State<CustomEmailAndPassword> {
  bool isObscureText = true;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<AuthBloc>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthBloc>().formKey,
      child: Column(
        children: [
          AuthField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            hintText: 'Email',
            controller: context.read<AuthBloc>().emailController,
          ),
          verticalSpace(18),
          AuthField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
            hintText: 'Password',
            controller: context.read<AuthBloc>().passwordController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
