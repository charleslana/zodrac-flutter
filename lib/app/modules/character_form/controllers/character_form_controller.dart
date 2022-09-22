import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/enums/toast_enum.dart';
import 'package:zodrac/app/models/response_model.dart';
import 'package:zodrac/app/modules/character_form/models/character_form_model.dart';
import 'package:zodrac/app/modules/character_form/services/character_form_service.dart';
import 'package:zodrac/app/routes/app_routes.dart';
import 'package:zodrac/app/utils/data_constant.dart';
import 'package:zodrac/app/utils/functions.dart';

class CharacterFormController extends GetxController {
  CharacterFormController({
    required this.characterFormService,
  });

  CharacterFormService characterFormService = CharacterFormService();

  RxnString gender = RxnString();
  Rxn<DateTime> birthDate = Rxn<DateTime>();
  final TextEditingController birthDateController = TextEditingController();

  @override
  void onInit() {
    gender.value = genders.first;
    super.onInit();
  }

  Future<void> create(CharacterFormModel characterForm) async {
    closeKeyboard();
    showLoading();
    await characterFormService.create(characterForm).then(
      (result) {
        Get.back<dynamic>();
        showToast(result.message, ToastEnum.success);
        Get.offAllNamed<dynamic>(AppRoutes.character);
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
