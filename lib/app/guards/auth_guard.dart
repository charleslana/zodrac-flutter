import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodrac/app/routes/app_routes.dart';
import 'package:zodrac/app/services/auth_service.dart';

class AuthGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isAuthenticated.value
        ? null
        : const RouteSettings(name: AppRoutes.login);
  }
}
