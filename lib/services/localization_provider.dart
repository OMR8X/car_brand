import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization.dart';

class LocalizationProvider {
  Locale? localeResolutionCallback(
    Locale? deviceLocale,
    Iterable<Locale> supportedLocales,
  ) {
    for (var local in supportedLocales) {
      if (deviceLocale != null &&
          deviceLocale.languageCode == local.languageCode) {
        return deviceLocale;
      }
    }
    return supportedLocales.first;
  }

  get localizationsDelegates => const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
}
