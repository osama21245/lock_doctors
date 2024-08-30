import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_doctor_profile.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_home_categories.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_slider.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/style.dart';
import '../bloc/home_bloc.dart';
import '../widgets/custom_todays_session_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void getTodaySessions() {
      context.read<HomeBloc>().add(HomeGetTodaysSessions(
          doctorId: "4", day: DateFormat.E().format(DateTime.now())));
    }

    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeGetSemesterSuccess) {
            getTodaySessions();
          } else if (state is HomeFailed) {
            showSnackBar(context, state.message);
          }
        },
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/background.png'),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                verticalSpace(19),
                const CustomDoctorProfile(),
                verticalSpace(7),
                const CustomHomeCategories(),
                const Spacer(),
                Container(
                  height: 570.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff272B40),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.r),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      verticalSpace(25),
                      const CustomSlider(
                        doctorId: '4',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0.h, horizontal: 25.0.w),
                            child: Text(
                              "Today Sessions",
                              textAlign: TextAlign.left,
                              style: TextStyles.font15GreyMedium,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(2),
                      const CustomTodaysSessionsCard()
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
