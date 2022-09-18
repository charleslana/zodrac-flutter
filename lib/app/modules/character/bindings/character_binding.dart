import 'package:get/get.dart';
import 'package:zodrac/app/modules/character/controllers/character_controller.dart';
import 'package:zodrac/app/modules/character/services/character_service.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(CharacterService.new)
      ..lazyPut(
        () => CharacterController(
          charactersService: Get.find<CharacterService>(),
        ),
      );
  }
}
