import 'dart:ui';

import 'package:zodrac/app/i18n/app_translation.dart';
import 'package:zodrac/app/i18n/language_model.dart';

class I18n {
  I18n._();

  static final Map<String, Map<String, String>> translationsKeys = {
    'en_US': AppTranslation.enUS,
    'pt_BR': AppTranslation.ptBR,
    'es_ES': AppTranslation.esES,
  };

  static final List<LanguageModel> languages = [
    LanguageModel('en-US', const Locale('en', 'US')),
    LanguageModel('pt-BR', const Locale('pt', 'BR')),
    LanguageModel('es-ES', const Locale('es', 'ES')),
  ];
}
