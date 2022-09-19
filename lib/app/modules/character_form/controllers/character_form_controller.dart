import 'package:get/get.dart';
import 'package:zodrac/app/modules/character_form/services/character_form_service.dart';

class CharacterFormController extends GetxController {
  CharacterFormController({
    required this.characterFormService,
  });

  CharacterFormService characterFormService = CharacterFormService();
}
