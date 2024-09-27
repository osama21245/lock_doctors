import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/spacer.dart';
import 'package:lock_doctors/core/theme/font_weight_helper.dart';
import 'package:lock_doctors/features/home/domain/usecases/cancel_doctor_session.dart';

import '../../bloc/home_bloc.dart';
import 'package:lock_doctors/features/home/domain/entity/running_sessions.dart';

class CustomRunningSessions extends StatefulWidget {
  const CustomRunningSessions({super.key});

  @override
  State<CustomRunningSessions> createState() => _CustomRunningSessionsState();
}

class _CustomRunningSessionsState extends State<CustomRunningSessions> {
  void cancelSession({required String timeTableID, required String sessionID}) {
    context.read<HomeBloc>().add(HomeCancelDoctorSession(
        doctorId: '4', timeTableID: timeTableID, sessionID: sessionID));
  }

  void finishSession({required String timeTableID}) {
    context
        .read<HomeBloc>()
        .add(HomeFinishDoctorSession(timeTableID: timeTableID));
  }

  void getRunningSessions() {
    context.read<HomeBloc>().add(HomeGetDoctorRunningSession(doctorId: '4'));
  }

  @override
  void initState() {
    getRunningSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeGetDoctorRunningSessionSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.runningSessions.length,
              itemBuilder: (context, index) {
                final session = state.runningSessions[index];
                return runningSessionsCard(
                    index,
                    session,
                    () => cancelSession(
                        timeTableID: session.sessionTimetable.toString(),
                        sessionID: session.sessionId.toString()),
                    () => finishSession(
                        timeTableID: session.sessionTimetable.toString()));
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  runningSessionsCard(int index, RunningSessions session,
      void Function() onCancel, void Function() onFinish) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 366.57.w,
        height: 174.h,
        child: Center(
          child: Stack(
            children: [
              Image.asset("assets/image/lock_live_sessions_card.png",
                  width: 366.57.w, height: 174.h, fit: BoxFit.fill),
              SizedBox(
                width: 366.57.w,
                height: 174.h,
                child: Column(
                  children: [
                    const Spacer(),
                    customSessionText(
                        "Material Name:", session.materialName.toString()),
                    customSessionText("Room:", session.room.toString()),
                    customSessionText("Time:", session.sessionTime.toString()),
                    customSessionText("ID:", session.sessionId.toString()),
                    Row(
                      children: [
                        const Spacer(),
                        customElevatedButton(
                          onpress: onCancel,
                          borderColor: const Color(0xff05543E),
                          backgroundColor: const Color(0xff05543E),
                          text: "cancle",
                          textColor: const Color(0xffffffff),
                        ),
                        horizontalSpace(10),
                        customElevatedButton(
                          onpress: onFinish,
                          borderColor: const Color(0xff05543E),
                          backgroundColor: const Color(0xffEDEBEB),
                          text: "finish",
                          textColor: const Color(0xff05543E),
                        ),
                        const Spacer()
                      ],
                    ),
                    verticalSpace(10)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton customElevatedButton(
      {required void Function() onpress,
      required Color borderColor,
      required Color backgroundColor,
      required Color textColor,
      required String text}) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        side: BorderSide(
          color: borderColor,
          width: 2.0,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 10.w,
            color: textColor),
      ),
    );
  }

  customSessionText(
    String title,
    String subTitle,
  ) {
    return Container(
      constraints: BoxConstraints(maxWidth: 332.w), // Maximum width set to 332
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeightHelper.regular,
                    fontSize: 11.h,
                    color: const Color(0xff383838),
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflowing text
                ),
              ),
              Flexible(
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 11.h,
                    color: const Color(0xff383838),
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflowing text
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
