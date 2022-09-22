import 'package:get/get.dart';
import 'package:zodrac/app/models/response_model.dart';
import 'package:zodrac/app/modules/character_form/models/character_form_model.dart';
import 'package:zodrac/app/services/request_service.dart';

class CharacterFormService extends RequestService {
  Future<ResponseModel> create(CharacterFormModel characterForm) async {
    final response = await post<dynamic>('/character', characterForm.toMap());
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return ResponseModel.fromMap(response.body);
  }
}
