import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widget/loader.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../bloc/auth_bloc.dart';

class CustomLoginState extends StatelessWidget {
  final Widget widget;
  const CustomLoginState({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context
              .read<AuthBloc>()
              .add(AuthSetUserDataToLocalStorage(user: state.userModel));
          print("Auth succes");
        } else if (state is AuthSetUserDataToLocalStorageSuccess) {
          context.read<AuthBloc>().add(AuthGetUserDataFromLocalStorage());
          print("Store succes");
        } else if (state is AuthGetUserDataFromLocalStorageSuccess) {
          navigationTo(context, const HomeScreen());
          print("Get Sucess");
        } else if (state is AuthFail) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }
        return widget;
      },
    );
  }
}
