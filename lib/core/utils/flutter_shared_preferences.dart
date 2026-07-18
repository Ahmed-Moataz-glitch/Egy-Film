import 'package:egy_film/core/view_model/language_cubit/language_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterSharedPreferences {
  FlutterSharedPreferences._();
  static final FlutterSharedPreferences instance = FlutterSharedPreferences._();
  static final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  final languageKey = 'language';

  Future<SharedPreferences> get() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveLanguage(String language) async {
    final prefs = await _sharedPreferences;
    prefs.setString(languageKey, language);
  }

  Future<LanguageModeState> getLanguage() async {
    final prefs = await _sharedPreferences;
    final language = prefs.getString(languageKey);
    if (language != null) {
      return LanguageModeState.values.firstWhere(
        (e) => e.toString() == language,
        orElse: () => LanguageModeState.english,
      );
    }
    return LanguageModeState.english;
  }

  Future<void> removeLanguage() async {
    final prefs = await _sharedPreferences;
    await prefs.remove(languageKey);
  }
}
