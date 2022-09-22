import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zodrac/app/components/custom_app_bar.dart';
import 'package:zodrac/app/components/gradient_button.dart';
import 'package:zodrac/app/enums/toast_enum.dart';
import 'package:zodrac/app/modules/character_form/controllers/character_form_controller.dart';
import 'package:zodrac/app/modules/character_form/models/character_form_model.dart';
import 'package:zodrac/app/services/language_service.dart';
import 'package:zodrac/app/themes/colors_theme.dart';
import 'package:zodrac/app/utils/data_constant.dart';
import 'package:zodrac/app/utils/functions.dart';

class CharacterFormPage extends StatelessWidget {
  const CharacterFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CharacterFormModel characterForm = CharacterFormModel();
    final CharacterFormController controller =
        Get.find<CharacterFormController>();

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Criar Personagem'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 3,
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.cardBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: characterForm.setName,
                                  validator: (value) =>
                                      characterForm.name.validate(),
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Nome',
                                    errorMaxLines: 2,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Obx(
                                  () => Row(
                                    children: genders.map((gender) {
                                      return Expanded(
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: 2,
                                          runSpacing: 2,
                                          children: [
                                            Radio<String>(
                                                value: gender,
                                                groupValue:
                                                    controller.gender.value,
                                                onChanged: (value) => {
                                                      controller.gender.value =
                                                          value,
                                                      characterForm.setGender(
                                                          value.toString()),
                                                    }),
                                            InkWell(
                                              onTap: () => {
                                                controller.gender.value =
                                                    gender,
                                                characterForm.setGender(gender),
                                              },
                                              child: Text(toGender(gender)),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  readOnly: true,
                                  controller: controller.birthDateController,
                                  validator: (value) =>
                                      characterForm.birthDate.validate(),
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Data de nascimento',
                                  ),
                                  onTap: () async {
                                    await showDatePicker(
                                      locale: LanguageService.getLocale(),
                                      initialDatePickerMode:
                                          DatePickerMode.year,
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: Colors
                                                  .black, // <-- SEE HERE// <-- SEE HERE
                                              onSurface: Colors
                                                  .blueAccent, // <-- SEE HERE
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors
                                                    .white, // button text color
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    ).then((selectedDate) {
                                      if (selectedDate != null) {
                                        characterForm.setBirthDate(
                                            selectedDate.toIso8601String());
                                        final DateFormat formatter =
                                            DateFormat.yMMMd(LanguageService()
                                                .getLocaleString());
                                        controller.birthDateController.text =
                                            formatter.format(selectedDate);
                                        controller.birthDate.value =
                                            selectedDate;
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(height: 20),
                                GradientButton(
                                  title: 'Criar',
                                  callback: () async {
                                    final String? validate =
                                        characterForm.validate();
                                    if (validate == null) {
                                      await controller.create(characterForm);
                                      return;
                                    }
                                    showToast(validate, ToastEnum.error);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      IconButton(
                        onPressed: Get.back<dynamic>,
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Spacer(),
                    ],
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
