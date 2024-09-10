import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../core/theme/app_pallete.dart';
import '../bloc/student_bloc.dart';

class UserTimeLine extends StatefulWidget {
  const UserTimeLine({super.key});

  @override
  State<UserTimeLine> createState() => _UserTimeLineState();
}

class _UserTimeLineState extends State<UserTimeLine> {
  late bool isShowingMainData = true;

  @override
  void initState() {
    super.initState();
    getStudentData();
  }

  void getStudentData() async {
    context.read<StudentBloc>().add(StudentGetStudentTimelineForOneMaterial(
          materialId: "3",
          studentId: "4",
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is StudentGetStudentTimelineForOneMaterialSuccess) {
            return Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 37,
                    ),
                    const Text(
                      'Time Line',
                      style: TextStyle(
                        color: AppPallete.greyFontColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.timeLineAttendance.length,
                          itemBuilder: (context, index) {
                            final attendance = state.timeLineAttendance[index];
                            return TimelineTile(
                              indicatorStyle: IndicatorStyle(
                                padding: const EdgeInsets.all(10),
                                width: 20,
                                color: attendance.attend == 1
                                    ? AppPallete.primaryColor
                                    : Colors.red,
                              ),
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              endChild: ListTile(
                                title: Text(attendance.materialName),
                                subtitle: Text(attendance.userName),
                                trailing: Text(attendance.sessionDateTime),
                              ),
                              startChild: Container(
                                color: attendance.attend == 1
                                    ? const Color.fromARGB(140, 63, 221, 97)
                                    : const Color.fromARGB(111, 244, 67, 54),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            );
          }
          return SizedBox(
            child: Text("$state"),
          );
        },
      ),
    );
  }
}
