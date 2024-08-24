import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import 'package:lock_doctors/features/doctor_materials/presentation/bloc/doctor_materials_bloc.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    context.read<DoctorMaterialsBloc>().add(
          DoctorMaterialsGetStudentTotalAttendTimeForOneMaterial(
              materialId: "4", studentId: '2'),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorMaterialsBloc, DoctorMaterialsState>(
      listener: (context, state) {
        if (state
            is DoctorMaterialGetStudentTotalAttendTimeForOneMaterialSuccess) {
          print(state.totalAttendTimes);
        } else if (state is DoctorMaterialFailed) {
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
