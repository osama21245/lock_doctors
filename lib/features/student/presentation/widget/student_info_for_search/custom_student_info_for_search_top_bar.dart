import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/core/helpers/extension.dart';
import 'package:lock_doctors/core/utils/show_snack_bar.dart';
import 'package:lock_doctors/features/doctor/presentation/bloc/doctor_bloc.dart';

import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/font_weight_helper.dart';
import '../../../../../core/theme/style.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../bloc/student_bloc.dart';

class CustomStudentInfoForSearchTopBar extends StatefulWidget {
  final String studentName;
  const CustomStudentInfoForSearchTopBar(
      {super.key, required this.studentName});

  @override
  State<CustomStudentInfoForSearchTopBar> createState() =>
      _CustomStudentInfoForSearchTopBarState();
}

class _CustomStudentInfoForSearchTopBarState
    extends State<CustomStudentInfoForSearchTopBar> {
  int? selectedMaterialsId;

  void getStudentTotalAttendTimeForOneMaterial() {
    final materialId = context.read<DoctorBloc>().selectedMaterialId;
    context.read<StudentBloc>().add(
        StudentGetStudentTotalAttendTimeForOneMaterial(
            materialId: materialId.toString(), studentId: "4"));
  }

  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(DoctorGetDoctorMaterials(doctorId: "4"));
  }

  @override
  Widget build(BuildContext context) {
    final materials = context.watch<DoctorBloc>().materials;

    // Initialize the selectedMaterialsId with the last semester's id when the semesters list is loaded
    if (materials.isNotEmpty && selectedMaterialsId == null) {
      selectedMaterialsId = materials.last.materialId;
    }
    return BlocListener<DoctorBloc, DoctorState>(
      listener: (context, state) {
        if (state is DoctorFailed) {
          showSnackBar(context, state.message);
        } else if (state is DoctorGetMaterialsSuccess) {
          getStudentTotalAttendTimeForOneMaterial();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(17.0).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back,
                  size: 25.sp,
                  color: AppPallete.whiteColor,
                )),
            Text("${widget.studentName}'s Info",
                style: TextStyles.font20WhiteBold),
            materials.isEmpty
                ? const CircularProgressIndicator()
                : DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selectedMaterialsId.toString(),
                    items: materials
                        .map((material) => DropdownMenuItem<String>(
                            value: material.materialId.toString(),
                            child: Text(
                              material.materialName,
                              style: TextStyle(
                                  color: AppPallete.whiteColor,
                                  fontSize: 8.53.h,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeightHelper.regular),
                            )))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMaterialsId = int.parse(value!);
                        context.read<DoctorBloc>().selectedMaterialId =
                            selectedMaterialsId;
                        debugPrint(
                            "${context.read<DoctorBloc>().selectedMaterialId}");
                      });
                      getStudentTotalAttendTimeForOneMaterial();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
