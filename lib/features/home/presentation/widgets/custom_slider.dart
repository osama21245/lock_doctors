import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lock_doctors/core/const/helping_lists.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_slider_card.dart';

import '../bloc/home_bloc.dart';

class CustomSlider extends StatelessWidget {
  final String doctorId;
  const CustomSlider({super.key, required this.doctorId});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeGetTodaysSessionsSuccess) {
          final todaysSessions = state.todaysSessions;
          return SizedBox(
            height: 240.72.h,
            child: CarouselSlider(
                items: List.generate(
                  todaysSessions.length > 3 ? 3 : todaysSessions.length,
                  (i) => CustomSliderCard(
                    materialName: todaysSessions[i].materialName,
                    image: todaysSessionsSliderImages[i],
                  ),
                ),
                options: carouselOptions()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  CarouselOptions carouselOptions() {
    return CarouselOptions(
      height: 300.h,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    );
  }
}
