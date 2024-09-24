import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/common/widget/custom_top_bar.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import 'package:lock_doctors/features/home/presentation/widgets/running_sessions/custom_home_running_state_controller.dart';

import '../bloc/home_bloc.dart';
import '../widgets/running_sessions/custom_running_sessions.dart';

class RunningSessionsScreen extends StatelessWidget {
  const RunningSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            child: const CustomRunningSessionsStateController(
              child: AppBackgroundColor(
                  screenContent: SafeArea(
                      child: Column(
                children: [
                  CustomTopBar(text: "Running Sessions"),
                  CustomRunningSessions()
                ],
              ))),
            ),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1), () {});
              context
                  .read<HomeBloc>()
                  .add(HomeGetDoctorRunningSession(doctorId: '4'));
            }));
  }
}
