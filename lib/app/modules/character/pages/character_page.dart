import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zodrac/app/components/custom_app_bar.dart';
import 'package:zodrac/app/components/custom_shader_mask.dart';
import 'package:zodrac/app/components/gradient_button.dart';
import 'package:zodrac/app/modules/character/controllers/character_controller.dart';
import 'package:zodrac/app/modules/character/models/character_model.dart';
import 'package:zodrac/app/modules/login/controllers/login_controller.dart';
import 'package:zodrac/app/utils/constants.dart';

class CharacterPage extends GetView<CharacterController> {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Personagens'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.obx(
                    (state) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            clipBehavior: Clip.none,
                            shrinkWrap: true,
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (state!.length > index) {
                                final CharacterModel character = state[index];
                                return Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: CustomShaderMask(
                                            image: getCharacterImage(
                                              character.gender,
                                              character.image,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        Positioned(
                                          top: -25,
                                          right: -25,
                                          child: SizedBox(
                                            height: 40,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black45
                                                        .withOpacity(0.2),
                                                    BlendMode.srcATop,
                                                  ),
                                                  child: Image.asset(
                                                      getElementImage('EARTH')),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: const Text(
                                                    '99',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(character.name),
                                            const SizedBox(height: 5),
                                            SizedBox(
                                              width: double.infinity,
                                              child: LinearPercentIndicator(
                                                barRadius:
                                                    const Radius.circular(50),
                                                lineHeight: 14,
                                                percent: 0.5,
                                                backgroundColor: Colors.grey,
                                                progressColor: Colors.redAccent,
                                                center: const Text(
                                                  '300/300',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            GradientButton(
                                              title: 'Jogar',
                                              fontSize: 13,
                                              callback: () {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: GradientButton(
                                        title: 'Criar',
                                        fontSize: 13,
                                        callback: () {},
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            radius: 20,
                            child: IconButton(
                              onPressed: loginController.logout,
                              icon: const Icon(
                                Icons.logout,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
      ),
    );
  }
}
