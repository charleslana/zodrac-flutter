import 'package:get/get.dart';
import 'package:zodrac/app/bindings/language_binding.dart';
import 'package:zodrac/app/guards/auth_guard.dart';
import 'package:zodrac/app/modules/character/bindings/character_binding.dart';
import 'package:zodrac/app/modules/character/pages/character_page.dart';
import 'package:zodrac/app/modules/character_form/bindings/character_form_binding.dart';
import 'package:zodrac/app/modules/character_form/pages/character_form_page.dart';
import 'package:zodrac/app/modules/landing/bindings/landing_binding.dart';
import 'package:zodrac/app/modules/landing/pages/landing_page.dart';
import 'package:zodrac/app/modules/login/bindings/login_binding.dart';
import 'package:zodrac/app/modules/login/pages/login_page.dart';
import 'package:zodrac/app/modules/register/bindings/register_binding.dart';
import 'package:zodrac/app/modules/register/pages/register_page.dart';
import 'package:zodrac/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:zodrac/app/modules/splash_screen/pages/splash_screen_page.dart';
import 'package:zodrac/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingPage(),
      bindings: [
        LandingBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      bindings: [
        LoginBinding(),
        LanguageBinding(),
      ],
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.character,
      page: () => const CharacterPage(),
      bindings: [
        CharacterBinding(),
        LoginBinding(),
      ],
      transition: Transition.leftToRight,
      middlewares: [
        AuthGuard(),
      ],
    ),
    GetPage(
      name: AppRoutes.characterForm,
      page: () => const CharacterFormPage(),
      binding: CharacterFormBinding(),
      transition: Transition.rightToLeft,
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}
