// ignore_for_file: constant_identifier_names

class LanguagesManager {
  static const Arabic = 'ar';
  static const English = 'en';

  static const appLanguages = [Arabic, English,];

  static String getLanguageText(String code) {
     switch (code) {
      case Arabic:
        return 'العربية';

      case English:
        return 'English';


      default:
        return '';
    }
  }
}
