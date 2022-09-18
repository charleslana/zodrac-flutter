import 'package:get/get.dart';
import 'package:zodrac/app/modules/model/controllers/model_controller.dart';
import 'package:zodrac/app/modules/model/services/model_service.dart';

class ModelBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(ModelService.new)
      ..lazyPut(
        () => ModelController(
          modelService: Get.find<ModelService>(),
        ),
      );
  }
}
