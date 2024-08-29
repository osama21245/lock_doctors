import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_doctor_profile.dart';
import 'package:lock_doctors/features/home/presentation/widgets/custom_home_categories.dart';

import '../../../../core/helpers/spacer.dart';
import '../widgets/custom_slider_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> sliderImages = [
      "assets/image/blue_Card.png",
      "assets/image/green_card.png",
      "assets/image/red_card.png"
    ];

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/background.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              verticalSpace(10),
              const CustomDoctorProfile(),
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
                        items: const [
                          CustomSliderCard(
                            materialName: "Computer Security",
                            image: "assets/image/blue_Card.png",
                          ),
                          CustomSliderCard(
                            materialName: "Computer Security",
                            image: "assets/image/red_card.png",
                          ),
                          CustomSliderCard(
                            materialName: "Computer Security",
                            image: "assets/image/green_card.png",
                          ),
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
                        )),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const SizedBox(height: 24),
                    //     const Text(
                    //       'Today Sessions',
                    //       style:
                    //           TextStyle(color: Color(0xff60708F), fontSize: 22),
                    //     ),
                    //     const SizedBox(height: 16),
                    //     _buildSessionListItem('Computer Security',
                    //         '15 April - 11:02', Icons.computer, Colors.blue),
                    //     _buildSessionListItem('Database Management',
                    //         '12 April - 22:50', Icons.lock, Colors.red),
                    //     _buildSessionListItem('Mathematics', '11 April - 18:44',
                    //         Icons.school, Colors.green),
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _buildSessionListItem(
      String title, String date, IconData icon, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        date,
        style: const TextStyle(color: Colors.white60),
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('Add Session'),
      ),
    );
  }
}
