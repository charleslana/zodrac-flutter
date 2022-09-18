import 'package:get/get.dart';
import 'package:zodrac/app/modules/register/controllers/register_controller.dart';
import 'package:zodrac/app/modules/register/services/register_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(RegisterService.new)
      ..lazyPut(
        () => RegisterController(
          registerService: Get.find<RegisterService>(),
        ),
      );
  }
}
