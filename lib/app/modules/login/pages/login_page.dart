import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/components/app_bar_language.dart';
import 'package:zodrac/app/components/gradient_button.dart';
import 'package:zodrac/app/enums/toast_enum.dart';
import 'package:zodrac/app/modules/login/controllers/login_controller.dart';
import 'package:zodrac/app/modules/login/models/login_credential_model.dart';
import 'package:zodrac/app/routes/app_routes.dart';
import 'package:zodrac/app/themes/colors_theme.dart';
import 'package:zodrac/app/utils/constants.dart';
import 'package:zodrac/app/utils/functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginCredentialModel credential = LoginCredentialModel();
    final LoginController controller = Get.find<LoginController>();

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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: Image.asset(
                                logoImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          GradientButton(
                            title: 'Registrar',
                            callback: () =>
                                Get.toNamed<dynamic>(AppRoutes.register),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            flex: 4,
                            child: Card(
                              elevation: 0,
                              color: ThemeColor.cardBackground,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: credential.setEmail,
                                      validator: (value) =>
                                          credential.email.validate(),
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Email',
                                        errorMaxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(
                                      () => TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onChanged: credential.setPassword,
                                        validator: (value) =>
                                            credential.password.validate(),
                                        obscureText:
                                            controller.isObscured.value,
                                        decoration: InputDecoration(
                                          border: const UnderlineInputBorder(),
                                          labelText: 'Senha',
                                          errorMaxLines: 2,
                                          suffixIcon: IconButton(
                                            onPressed: () => controller
                                                    .isObscured.value =
                                                !controller.isObscured.value,
                                            icon: Icon(
                                              controller.isObscured.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    GradientButton(
                                      title: 'login.page.button.login'.tr,
                                      callback: () async {
                                        final String? validate =
                                            credential.validate();
                                        if (validate == null) {
                                          await controller.login(credential);
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
                          const TextButton(
                            onPressed: launchDiscord,
                            child: Text(
                              'Visite o Discord',
                              textAlign: TextAlign.center,
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
