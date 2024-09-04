import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCourses extends StatelessWidget {
  const CustomCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(115, 141, 141, 141),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                "assets/image/app_rounded_logo.png",
                width: 84.w,
                height: 84.h,
                fit: BoxFit.cover,
              )),
          const Column(
            children: [
              Text("title"),
              Text("Subtitle"),
              Text("Total Sessions"),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right))
        ],
      ),
    );
  }
}
