import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/show_snack_bar.dart';
import '../../bloc/home_bloc.dart';

class CustomRunningSessionsStateController extends StatelessWidget {
  final Widget child;
  const CustomRunningSessionsStateController({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    void getRunningSessions() {
      context.read<HomeBloc>().add(HomeGetDoctorRunningSession(doctorId: '4'));
    }

    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is HomeCancleDoctorSessionSuccess ||
          state is HomeFinishDoctorSessionSuccess) {
        getRunningSessions();
      } else if (state is HomeFailed) {
        showSnackBar(context, state.message);
      }
    }, builder: (context, state) {
      return RefreshIndicator(
          child: child,
          onRefresh: () async {
            getRunningSessions();
          });
    });
  }
}
