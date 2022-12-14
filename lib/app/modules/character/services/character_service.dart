import 'package:get/get.dart';
import 'package:zodrac/app/models/response_model.dart';
import 'package:zodrac/app/modules/character/models/character_model.dart';
import 'package:zodrac/app/services/request_service.dart';

class CharacterService extends RequestService {
  Future<List<CharacterModel>> getAll() async {
    final response = await get<dynamic>('/character');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return CharacterModel.listFromJson(response.body);
  }

  Future<ResponseModel> deleteCharacter(int id) async {
    final response = await delete<dynamic>('/character/$id');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection.error'.tr);
      }
      return Future.error(response.body);
    }
    return ResponseModel.fromMap(response.body);
  }
}
