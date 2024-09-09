import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGetTotalStudents extends StatelessWidget {
  const CustomGetTotalStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: const Row(
        children: [Text("Total Students: 225 ")],
      ),
    );
  }
}
