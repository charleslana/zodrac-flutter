import 'package:get/get.dart';
import 'package:zodrac/app/modules/character_form/controllers/character_form_controller.dart';
import 'package:zodrac/app/modules/character_form/services/character_form_service.dart';

class CharacterFormBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(CharacterFormService.new)
      ..lazyPut(
        () => CharacterFormController(
          characterFormService: Get.find<CharacterFormService>(),
        ),
      );
  }
}
