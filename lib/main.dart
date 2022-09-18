import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zodrac/app/i18n/i18n.dart';
import 'package:zodrac/app/routes/app_pages.dart';
import 'package:zodrac/app/routes/app_routes.dart';
import 'package:zodrac/app/services/auth_service.dart';
import 'package:zodrac/app/services/language_service.dart';
import 'package:zodrac/app/themes/colors_theme.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => AuthService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zodrac',
      theme: ThemeColor().themeData,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: I18n.translationsKeys,
      locale: LanguageService.getLocale(),
    );
  }
}
