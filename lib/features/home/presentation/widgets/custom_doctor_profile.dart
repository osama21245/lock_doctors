import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorProfile extends StatelessWidget {
  const CustomDoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3).r,
          width: 50.w,
          height: 47.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(221, 37, 37, 37),
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10.r)),
          child: Image.asset(
            "assets/image/lock-removebg-preview.png",
            width: 50.w,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          width: 100.w,
          height: 47.h,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Good evening,",
              style: TextStyle(
                  color: const Color(0xff60708F),
                  fontWeight: FontWeight.w400,
                  fontSize: 9.sp),
            ),
            Text(
              "Osama Gamil",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
          ]),
        )
      ],
    );
  }
}
