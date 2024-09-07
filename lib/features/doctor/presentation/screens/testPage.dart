import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import 'package:lock_doctors/features/doctor/presentation/bloc/doctor_bloc.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    context.read<DoctorBloc>().add(
          DoctorGetStudentTotalAttendTimeForOneMaterial(
              materialId: "4", studentId: '2'),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorBloc, DoctorState>(
      listener: (context, state) {
        if (state is DoctorGetStudentTotalAttendTimeForOneMaterialSuccess) {
          print(state.totalAttendTimes);
        } else if (state is DoctorFailed) {
          showSnackBar(context, state.message);
          print("fail");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text("$state"),
          ),
        );
      },
    );
  }
}
