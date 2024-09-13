import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/common/entities/user_model.dart';
import 'package:lock_doctors/core/theme/app_pallete.dart';
import 'package:lock_doctors/features/student/presentation/bloc/student_bloc.dart';
import '../../../../../core/theme/style.dart';

class CustomSearchResult extends StatelessWidget {
  const CustomSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [];
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is StudentSearchForStudentSuccess) {
          users = state.users;
        } else if (state is StudentFailed) {
          users.clear();
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            controller: context.read<StudentBloc>().searchScrollController,
            itemCount: users.length + 1,
            itemBuilder: (context, index) {
              if (index < users.length) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0.h),
                    child: searchCard(user: users[index]));
              }
              if (state is StudentFailed) {
                return const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: Text("There is no result"),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
    );
  }

  Padding searchCard({required UserModel user}) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: SizedBox(
        width: 343.08.w,
        height: 176.h,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.asset(
              "assets/image/search_card.png",
            ),
            Padding(
              padding: EdgeInsets.only(left: 90.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cardText("Name", user.name),
                  cardText("ID", user.id.toString()),
                  cardText("Email", user.email),
                  cardText("Round", user.round.toString()),
                  cardText("Level", user.level.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  AppPallete.lightGreenAndGrey70Transparent)),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Icon(
                                Icons.av_timer_outlined,
                                color: AppPallete.lightBlackColor,
                              ),
                              Text(
                                "more info",
                                style: TextStyles.font11SemiBoldlightBlack,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding cardText(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title: ',
              style: TextStyles.font13SemiBold80White,
            ),
            TextSpan(
              text: content,
              style: TextStyles.font10SemiBold50white,
            ),
          ],
        ),
      ),
    );
  }
}
