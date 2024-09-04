import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/core/theme/style.dart';
import 'package:lock_doctors/core/const/helping_lists.dart';
import '../../../../core/utils/get_data_from_static_lists.dart';
import '../bloc/home_bloc.dart';
import 'package:lock_doctors/features/home/domain/entity/todays_sessions.dart';

class CustomTodaysSessions extends StatelessWidget {
  const CustomTodaysSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeGetTodaysSessionsSuccess) {
          final todaysSessions = state.todaysSessions;
          return Expanded(
            child: ListView.builder(
                itemCount: state.todaysSessions.length,
                itemBuilder: (context, i) =>
                    todaySessionsCard(i, todaysSessions)),
          );
        }
        return const SizedBox();
      },
    );
  }

  ListTile todaySessionsCard(int i, List<TodaysSessions> todaysSessions) {
    return ListTile(
        leading: Container(
          height: 53.19.h,
          width: 53.19.w,
          decoration: BoxDecoration(
            color: getTodayesSessionsCardColors(i),
            borderRadius: BorderRadius.circular(14.89.r),
          ),
          child: Center(
            child: Image.asset(
              getTodaysSessionsCardImages(i),
              width: 48.w,
              height: 44.h,
            ),
          ),
        ),
        title: Text(todaysSessions[i].materialName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font14GreyExtraBold),
        subtitle: Text("${todaysSessions[i].room} - ${todaysSessions[i].time}",
            maxLines: 1, style: TextStyles.font14LightGreyExtraBold),
        trailing: OutlinedButton(
            style: ButtonStyle(
              side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(
                    color: Color(0xffB7FDF4),
                    width: 2.0), // Change color and width here
              ),
              overlayColor:
                  WidgetStateProperty.all<Color>(AppPallete.lightBlueColor),
            ),
            onPressed: () {},
            child: Text("Start", style: TextStyles.font11LigtBlueMedium)));
  }
}
