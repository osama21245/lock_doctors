import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lock_doctors/core/common/widget/app_background_color.dart';

import '../../../../core/common/widget/custom_top_bar.dart';
import '../../../../core/helpers/spacer.dart';
import '../widget/search_for_student_screen/custom_search_bar_for_students_search_screen.dart';

class SearchForStudentScreen extends StatelessWidget {
  const SearchForStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundColor(
          screenContent: SafeArea(
              child: Column(
        children: [
          verticalSpace(20),
          const CustomTopBar(
            text: "Student Info",
          ),
          const CustomSearchBarForStudentsSearchScreen()
        ],
      ))),
    );
  }
}
