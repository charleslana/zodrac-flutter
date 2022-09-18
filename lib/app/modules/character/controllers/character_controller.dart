import 'package:get/get.dart';
import 'package:zodrac/app/models/response_model.dart';
import 'package:zodrac/app/modules/character/models/character_model.dart';
import 'package:zodrac/app/modules/character/services/character_service.dart';

class CharacterController extends GetxController
    with StateMixin<List<CharacterModel>> {
  CharacterController({
    required this.charactersService,
  });

  CharacterService charactersService = CharacterService();

  @override
  void onInit() {
    _fetchAllCharacters();
    super.onInit();
  }

  Future<void> _fetchAllCharacters() async {
    change(null, status: RxStatus.loading());
    await charactersService.getAll().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic error) {
      if (error is Map<String, dynamic>) {
        final ResponseModel response = ResponseModel.fromMap(error);
        change(null, status: RxStatus.error(response.message));
        return;
      }
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
