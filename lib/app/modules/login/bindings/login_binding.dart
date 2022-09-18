import 'package:get/get.dart';
import 'package:zodrac/app/modules/login/controllers/login_controller.dart';
import 'package:zodrac/app/modules/login/services/login_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LoginService.new)
      ..lazyPut(
        () => LoginController(
          loginService: Get.find<LoginService>(),
        ),
      );
  }
}
