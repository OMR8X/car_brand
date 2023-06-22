import 'package:shared_preferences/shared_preferences.dart';

class LangCashHelper {
  final String langSpKey = 'LOCAL';
  Future<void> cashLanguageCode(String langCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(langSpKey, langCode);
  }

  Future<String> getCashedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cashedLangCode = sharedPreferences.getString(langSpKey);
    if (cashedLangCode != null) {
      return cashedLangCode;
    } else {
      return "ar";
    }
  }
}
