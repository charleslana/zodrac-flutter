import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/modules/model/controllers/model_controller.dart';

class ModelPage extends GetView<ModelController> {
  const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.obx(
                  (state) {
                    return const Text('Model');
                  },
                  onEmpty: const Center(
                    child: Text('empty'),
                  ),
                  onError: (error) => Center(
                    child: Text(error.toString()),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
