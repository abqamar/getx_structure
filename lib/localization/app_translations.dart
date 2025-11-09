import 'package:get/get.dart';
import 'en_us.dart';
import 'ar_ae.dart';
import 'ur_pk.dart';
import 'fr_fr.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ar_AE': arAE,
    'ur_PK': urPK,
    'fr_FR': frFR,
  };
}
