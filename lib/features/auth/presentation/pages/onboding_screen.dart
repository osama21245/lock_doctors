import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lock_doctors/core/helpers/extension.dart';
import 'package:rive/rive.dart';

import '../../../../core/const/image_links.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/auth_gradient_button.dart';

class OnbodingScreen extends StatelessWidget {
  const OnbodingScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            fit: BoxFit.cover,
            "assets/rive/training3.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      ImageLinks.appLogo,
                      width: 60,
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Access our comprehensive courses app to learn design and coding, featuring Flutter and Swift for practical application development.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AuthGradientButton(
                      buttonText: 'Start',
                      onPressed: () {
                        context.pushNamed(Routes.loginScreen);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
