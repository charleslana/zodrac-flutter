import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/components/custom_app_bar.dart';

class CharacterFormPage extends StatelessWidget {
  const CharacterFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Criar Personagem'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: Get.back<dynamic>,
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
