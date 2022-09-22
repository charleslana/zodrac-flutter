import 'package:get/get.dart';
import 'package:zodrac/app/enums/toast_enum.dart';
import 'package:zodrac/app/models/response_model.dart';
import 'package:zodrac/app/modules/character/models/character_model.dart';
import 'package:zodrac/app/modules/character/services/character_service.dart';
import 'package:zodrac/app/utils/functions.dart';

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

  Future<void> deleteCharacter(int id) async {
    showLoading();
    await charactersService.deleteCharacter(id).then(
      (result) {
        Get.back<dynamic>();
        showToast(result.message, ToastEnum.success);
        _fetchAllCharacters();
      },
      onError: (dynamic error) {
        Get.back<dynamic>();
        if (error is Map<String, dynamic>) {
          final ResponseModel response = ResponseModel.fromMap(error);
          showToast(response.message, ToastEnum.error);
          return;
        }
        showToast(error, ToastEnum.error);
      },
    );
  }
}
