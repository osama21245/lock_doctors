import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lock_doctors/features/student/presentation/bloc/student_bloc.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomSearchBarForStudentsSearchScreen extends StatefulWidget {
  const CustomSearchBarForStudentsSearchScreen({super.key});

  @override
  State<CustomSearchBarForStudentsSearchScreen> createState() =>
      _CustomSearchBarForStudentsSearchScreenState();
}

class _CustomSearchBarForStudentsSearchScreenState
    extends State<CustomSearchBarForStudentsSearchScreen> {
  TextEditingController? _searchInputController;
  final formKey = GlobalKey<FormState>();
  int limit = 5;

  final Timer _timer =
      Timer.periodic(const Duration(seconds: 5), (timer) async {});

  void _search(int limit, String searchInput) {
    context.read<StudentBloc>().add(StudentSearchForStudent(
        limit: limit.toString(), searchInput: searchInput));
  }

  void addListner() {
    context.read<StudentBloc>().searchScrollController.addListener(() {
      bool isReachToEndOfTheList = context
              .read<StudentBloc>()
              .searchScrollController
              .position
              .maxScrollExtent ==
          context.read<StudentBloc>().searchScrollController.offset;
      if (isReachToEndOfTheList) {
        limit += 2;
        _search(limit, _searchInputController!.text);
      }
    });
  }

  @override
  void initState() {
    _searchInputController = TextEditingController();
    addListner();
    _search(5, "o");
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _searchInputController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: 320.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppPallete.whiteColor),
          borderRadius: BorderRadius.circular(40.r)),
      child: Form(
        key: formKey,
        child: Row(
          children: [
            horizontalSpace(22),
            Image.asset(
              "assets/image/Search_Image.png",
              width: 18.75.w,
              height: 18.72.w,
            ),
            horizontalSpace(12),
            Expanded(
              child: TextFormField(
                controller: _searchInputController,
                onChanged: (value) {
                  _search(limit, value);
                },
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "Search for student",
                  hintStyle: TextStyles.font10WhiteRegular,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyles.font10WhiteRegular,
              ),
            ),
            horizontalSpace(12),
          ],
        ),
      ),
    );
  }
}
