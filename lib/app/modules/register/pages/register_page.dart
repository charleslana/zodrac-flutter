import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/components/app_bar_language.dart';
import 'package:zodrac/app/components/gradient_button.dart';
import 'package:zodrac/app/enums/toast_enum.dart';
import 'package:zodrac/app/modules/register/controllers/register_controller.dart';
import 'package:zodrac/app/modules/register/models/register_model.dart';
import 'package:zodrac/app/themes/colors_theme.dart';
import 'package:zodrac/app/utils/constants.dart';
import 'package:zodrac/app/utils/functions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterModel register = RegisterModel();
    final RegisterController controller = Get.find<RegisterController>();

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgLargeImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const AppBarLanguage(),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: register.setEmail,
                                      validator: (value) =>
                                          register.email.validate(),
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'E-mail',
                                        errorMaxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(
                                      () => TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onChanged: register.setPassword,
                                        validator: (value) =>
                                            register.password.validate(),
                                        keyboardType: TextInputType.name,
                                        obscureText:
                                            controller.isObscuredPassword.value,
                                        decoration: InputDecoration(
                                          border: const UnderlineInputBorder(),
                                          labelText: 'Senha',
                                          errorMaxLines: 2,
                                          suffixIcon: IconButton(
                                            onPressed: () => controller
                                                    .isObscuredPassword.value =
                                                !controller
                                                    .isObscuredPassword.value,
                                            icon: Icon(
                                              controller
                                                      .isObscuredPassword.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(
                                      () => TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onChanged: register.setConfirmPassword,
                                        validator: (value) => register
                                            .confirmPassword
                                            .validate(register.password.value),
                                        keyboardType: TextInputType.name,
                                        obscureText: controller
                                            .isObscuredConfirmPassword.value,
                                        decoration: InputDecoration(
                                          border: const UnderlineInputBorder(),
                                          labelText: 'Confirme a senha',
                                          errorMaxLines: 3,
                                          suffixIcon: IconButton(
                                            onPressed: () => controller
                                                    .isObscuredConfirmPassword
                                                    .value =
                                                !controller
                                                    .isObscuredConfirmPassword
                                                    .value,
                                            icon: Icon(
                                              controller
                                                      .isObscuredConfirmPassword
                                                      .value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: InkWell(
                                        onTap: () {},
                                        child: const Text.rich(
                                          TextSpan(
                                            text:
                                                'Ao criar uma conta você aceita todos os ',
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Termos de Serviço e Regras',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    GradientButton(
                                      title: 'Registrar',
                                      callback: () async {
                                        final String? validate =
                                            register.validate();
                                        if (validate == null) {
                                          await controller.register(register);
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
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            radius: 20,
                            child: IconButton(
                              onPressed: Get.back<dynamic>,
                              icon: const Icon(Icons.arrow_back),
                            ),
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
        ),
      ),
    );
  }
}
