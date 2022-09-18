import 'package:get/get.dart';
import 'package:zodrac/app/modules/model/services/model_service.dart';

class ModelController extends GetxController with StateMixin<String> {
  ModelController({
    required this.modelService,
  });

  ModelService modelService = ModelService();
}
