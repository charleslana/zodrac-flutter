import 'package:get/get.dart';
import 'package:zodrac/app/controllers/language_controller.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(LanguageController.new);
  }
}
