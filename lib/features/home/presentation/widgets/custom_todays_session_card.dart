import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/core/theme/style.dart';
import 'package:lock_doctors/features/home/presentation/helpers/todays_sessions_lists.dart';
import '../bloc/home_bloc.dart';

class CustomTodaysSessionsCard extends StatelessWidget {
  const CustomTodaysSessionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeGetTodaysSessionsSuccess) {
          final todaysSessions = state.todaysSessions;
          return Expanded(
            child: ListView.builder(
                itemCount: state.todaysSessions.length,
                itemBuilder: (context, i) => ListTile(
                    leading: Container(
                      height: 53.19.h,
                      width: 53.19.w,
                      decoration: BoxDecoration(
                        color: i % 3 == 0
                            ? todaySessionsCardColors[2]
                            : i % 2 == 0
                                ? todaySessionsCardColors[1]
                                : todaySessionsCardColors[0],
                        borderRadius: BorderRadius.circular(14.89.r),
                      ),
                      child: Center(
                        child: Image.asset(
                          i % 3 == 0
                              ? todaySessionsCardimages[2]
                              : i % 2 == 0
                                  ? todaySessionsCardimages[1]
                                  : todaySessionsCardimages[0],
                          width: 48.w,
                          height: 44.h,
                        ),
                      ),
                    ),
                    title: Text(todaysSessions[i].materialName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14GreyExtraBold),
                    subtitle: Text(
                        "${todaysSessions[i].room} - ${todaysSessions[i].time}",
                        maxLines: 1,
                        style: TextStyles.font14LightGreyExtraBold),
                    trailing: OutlinedButton(
                        style: ButtonStyle(
                          side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: Color(0xffB7FDF4),
                                width: 2.0), // Change color and width here
                          ),
                          overlayColor: WidgetStateProperty.all<Color>(
                              AppPallete.lightBlueColor),
                        ),
                        onPressed: () {},
                        child: Text("Start",
                            style: TextStyles.font11LigtBlueMedium)))),
          );
        }
        return const SizedBox();
      },
    );
  }
}
