import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';
import 'package:lock_doctors/core/theme/style.dart';
import 'package:lock_doctors/features/home/presentation/bloc/home_bloc.dart';

class CustomDoctorProfile extends StatefulWidget {
  const CustomDoctorProfile({super.key});

  @override
  State<CustomDoctorProfile> createState() => _CustomDoctorProfileState();
}

class _CustomDoctorProfileState extends State<CustomDoctorProfile> {
  int? selectedSemesterId;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeGetSemesters());
  }

  @override
  Widget build(BuildContext context) {
    final semesters = context.watch<HomeBloc>().semesters;

    // Initialize the selectedSemesterId with the last semester's id when the semesters list is loaded
    if (semesters.isNotEmpty && selectedSemesterId == null) {
      selectedSemesterId = semesters.last.semesterId;
    }

    return Padding(
      padding: const EdgeInsets.all(17.0).r,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3).r,
            width: 51.w,
            height: 51.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(221, 43, 43, 43),
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(11.91.r),
            ),
            child: Image.asset(
              "assets/image/lock-removebg-preview.png",
              width: 50.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          horizontalSpace(12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            verticalSpace(2),
            Text(
              "Good evening,",
              style: TextStyles.font12GrayMedium,
            ),
            verticalSpace(3),
            Text("Osama Gamil", style: TextStyles.font16WhiteExtraBold),
          ]),
          const Spacer(),
          semesters.isEmpty
              ? const CircularProgressIndicator()
              : DropdownButton<String>(
                  underline: const SizedBox(),
                  value: selectedSemesterId.toString(),
                  items: semesters
                      .map((semester) => DropdownMenuItem<String>(
                          value: semester.semesterId.toString(),
                          child: Text(semester.semesterName)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSemesterId = int.parse(value!);
                      context.read<HomeBloc>().selectedSemesterId =
                          selectedSemesterId;
                      debugPrint(
                          "${context.read<HomeBloc>().selectedSemesterId}");
                    });
                  },
                ),
        ],
      ),
    );
  }
}
