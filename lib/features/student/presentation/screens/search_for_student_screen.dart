import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import 'package:lock_doctors/features/student/presentation/widget/search_for_student_screen/custom_search_result.dart';

import '../../../../core/common/widget/custom_top_bar.dart';
import '../../../../core/helpers/spacer.dart';
import '../bloc/student_bloc.dart';
import '../widget/search_for_student_screen/custom_search_bar_for_students_search_screen.dart';

class SearchForStudentScreen extends StatelessWidget {
  const SearchForStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state is StudentFailed) {
            showSnackBar(context, state.message);
          }
        },
        child: AppBackgroundColor(
            screenContent: SafeArea(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(20),
            const CustomTopBar(
              text: "Search",
            ),
            const CustomSearchBarForStudentsSearchScreen(),
            verticalSpace(10),
            const CustomSearchResult()
          ],
        ))),
      ),
    );
  }
}
