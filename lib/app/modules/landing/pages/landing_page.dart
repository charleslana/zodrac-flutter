import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/components/gradient_button.dart';
import 'package:zodrac/app/modules/landing/controllers/landing_controller.dart';
import 'package:zodrac/app/themes/app_text_theme.dart';
import 'package:zodrac/app/utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController controller = Get.find<LandingController>();

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgLargeImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Align(
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.isLoading.value) ...[
                                  const LinearProgressIndicator(),
                                  const SizedBox(height: 10),
                                ],
                                Text(
                                  controller.text.value,
                                  textAlign: TextAlign.center,
                                  style: sFUIDisplay()
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          if (controller.isConnectionFailed.value) ...[
                            const SizedBox(height: 10),
                            GradientButton(
                              title: 'Tentar novamente',
                              callback: controller.tryAgain,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'By Charles Lana',
                      style: sFUIDisplay().copyWith(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'v.$appVersion',
                      style: sFUIDisplay().copyWith(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
