import 'package:get/get.dart';
import 'package:zodrac/app/modules/login/models/login_credential_model.dart';
import 'package:zodrac/app/modules/login/services/login_service.dart';
import 'package:zodrac/app/services/encrypt_service.dart';
import 'package:zodrac/app/services/language_service.dart';
import 'package:zodrac/app/utils/constants.dart';

class RequestService extends GetConnect {
  final LanguageService _languageService = LanguageService();
  final EncryptService _encryptService = EncryptService();
  final LoginCredentialModel _credential = LoginCredentialModel();

  final LoginService _loginService = Get.put(LoginService());

  @override
  void onInit() {
    httpClient
      ..baseUrl = apiBaseUrl
      ..addAuthenticator<dynamic>((request) async {
        final Map<String, dynamic>? getLoginStorage = _loginService.readLogin();
        if (getLoginStorage != null) {
          _credential
            ..fromMap(getLoginStorage)
            ..setEmail(_encryptService.decrypt(_credential.email.value))
            ..setPassword(_encryptService.decrypt(_credential.password.value));
          final result = await _loginService.login(_credential);
          _loginService.saveAuth(result);
        }
        return request;
      })
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = _languageService.getLocaleString();
        request.headers['Authorization'] =
            'Bearer ${_loginService.getAuth().accessToken}';
        request.headers['cookie'] = _loginService.getAuth().cookie;
        return request;
      })
      ..maxAuthRetries = 2;
    super.onInit();
  }
}
