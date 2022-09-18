import 'package:get/get.dart';
import 'package:zodrac/app/modules/landing/controllers/landing_controller.dart';
import 'package:zodrac/app/modules/landing/services/landing_service.dart';
import 'package:zodrac/app/modules/login/services/login_service.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LandingService.new)
      ..lazyPut(
        () => LandingController(
          landingService: Get.find<LandingService>(),
          loginService: Get.find<LoginService>(),
        ),
      );
  }
}
