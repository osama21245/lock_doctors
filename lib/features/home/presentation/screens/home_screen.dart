import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_doctor_profile.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_home_categories.dart';

import '../../../../core/helpers/spacer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/background.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              const CustomDoctorProfile(),
              verticalSpace(20),
              const CustomHomeCategories(),
              const Spacer(),
              Container(
                height: 527.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff272B40),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.r),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CarouselSlider(
                        items: [
                          Image.asset("assets/image/blue_Card.png"),
                          Image.asset("assets/image/green_card.png"),
                          Image.asset("assets/image/red_card.png")
                        ],
                        options: CarouselOptions(
                          height: 300.h,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
