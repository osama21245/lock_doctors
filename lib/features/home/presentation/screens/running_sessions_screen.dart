import 'package:flutter/material.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/common/widget/custom_top_bar.dart';

import '../widgets/running_sessions/custom_running_sessions.dart';

class RunningSessionsScreen extends StatelessWidget {
  const RunningSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
        children: [
          CustomTopBar(text: "Running Sessions"),
          CustomRunningSessions()
        ],
      ))),
    );
  }
}
