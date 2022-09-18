import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:zodrac/app/utils/constants.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: 200,
              child: Image.asset(
                splashScreenImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
