import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'ar', 'de', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? arText = '',
    String? deText = '',
    String? frText = '',
  }) =>
      [esText, enText, arText, deText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'm1131444': {
      'es': 'CourtMe',
      'ar': 'كورتمي',
      'de': 'CourtMe',
      'en': 'CourtMe',
      'fr': 'Courez-moi',
    },
    'omq87g4l': {
      'es': '¡Hola de nuevo!',
      'ar': 'مرحبا مرة أخرى!',
      'de': 'Hallo nochmal!',
      'en': 'Hello again!',
      'fr': 'Bonjour à nouveau!',
    },
    'k2mivawo': {
      'es': 'Rellena la información para acceder\na tu cuenta',
      'ar': 'املأ المعلومات للوصول\nإلى حسابك',
      'de':
          'Füllen Sie die Informationen aus, um darauf zuzugreifen\nauf Ihr Konto',
      'en': 'Fill in the information to access\nyour account',
      'fr': 'Remplissez les informations pour accéder\nà votre compte',
    },
    'an2siit4': {
      'es': 'Email',
      'ar': 'بريد إلكتروني',
      'de': 'E-Mail',
      'en': 'E-mail',
      'fr': 'E-mail',
    },
    'ew6vwb6f': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'um2i2roh': {
      'es': 'Acceder',
      'ar': 'وصول',
      'de': 'Zugang',
      'en': 'Login',
      'fr': 'Accéder',
    },
    'k1lbin3m': {
      'es': 'O accede con:',
      'ar': 'أو الوصول مع:',
      'de': 'Oder greifen Sie zu mit:',
      'en': 'Or log in with:',
      'fr': 'Ou accédez avec :',
    },
    'yxrev1wi': {
      'es': 'Accede con Google',
      'ar': 'الوصول مع جوجل',
      'de': 'Zugriff mit Google',
      'en': 'Sign in with Google',
      'fr': 'Accès avec Google',
    },
    'yyhnspif': {
      'es': 'Accede con Apple',
      'ar': 'الوصول مع أبل',
      'de': 'Zugriff mit Apple',
      'en': 'Sign in with Apple',
      'fr': 'Accès avec Apple',
    },
    's7swmjyy': {
      'es': '¿No tienes cuenta? ',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben noch kein Konto?',
      'en': 'Don\'t have an account?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    '6f3n4jeh': {
      'es': 'Registrate aquí',
      'ar': 'سجل هنا',
      'de': 'Registrieren Sie sich hier',
      'en': 'Register here',
      'fr': 'Inscrivez-vous ici',
    },
    'hc0vco3h': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // home
  {
    '881c4a3n': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    '9tk4nkqh': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'jjanwts4': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    'dpd9649b': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    'hfm0vp8i': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    'gn56qhff': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    'hrxfcoix': {
      'es': 'Ayuda y privacidad',
      'ar': 'المساعدة والخصوصية',
      'de': 'Hilfe und Datenschutz',
      'en': 'Help and privacy',
      'fr': 'Aide et confidentialité',
    },
    '4vm0cxrd': {
      'es': 'Ayuda, preguntas precuentes, privacidad.',
      'ar': 'المساعدة، الأسئلة المتداولة، الخصوصية.',
      'de': 'Hilfe, häufig gestellte Fragen, Datenschutz.',
      'en': 'Help, FAQ, privacy.',
      'fr': 'Aide, questions fréquemment posées, confidentialité.',
    },
    'i6q9b5p1': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    'q77u3wck': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    'nk421ejy': {
      'es': 'CourtMe',
      'ar': 'كورتمي',
      'de': 'CourtMe',
      'en': 'CourtMe',
      'fr': 'Courez-moi',
    },
    'l6jz378m': {
      'es': 'Activar lector de pantalla',
      'ar': 'تفعيل قارئ الشاشة',
      'de': 'Aktivieren Sie den Bildschirmleser',
      'en': 'Activate screen reader',
      'fr': 'Activer le lecteur d\'écran',
    },
    'v25a9l95': {
      'es': 'Simplemente, DEPORTE',
      'ar': 'ببساطة، الرياضة',
      'de': 'Einfach SPORT',
      'en': 'Simply, SPORT',
      'fr': 'Tout simplement, du SPORT',
    },
    'ru7sm6ew': {
      'es': 'Busca ya tu pista...',
      'ar': 'ابحث عن دليلك الآن...',
      'de': 'Suchen Sie jetzt nach Ihrem Hinweis ...',
      'en': 'Find your track now...',
      'fr': 'Cherchez votre indice maintenant...',
    },
    '1bspcivw': {
      'es': 'Polideportivo Olivas Aranjuez',
      'ar': 'مركز أوليفاس أرانخويز الرياضي',
      'de': 'Sportzentrum Olivas Aranjuez',
      'en': 'Olivas Aranjuez Sports Centre',
      'fr': 'Centre sportif Olivas Aranjuez',
    },
    '4j39r8bm': {
      'es': 'Polideportivo El Carrascal',
      'ar': 'مركز الكارسكال الرياضي',
      'de': 'Sportzentrum El Carrascal',
      'en': 'El Carrascal Sports Centre',
      'fr': 'Centre sportif El Carrascal',
    },
    'too0g5yj': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'bkux4jaj': {
      'es': 'Instalaciones ya visitadas',
      'ar': 'المرافق التي تمت زيارتها بالفعل',
      'de': 'Einrichtungen bereits besucht',
      'en': 'Facilities already visited',
      'fr': 'Installations déjà visitées',
    },
    '1lccg8i7': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Actividades
  {
    'gt4x4iaf': {
      'es': 'Filtra las actividades disponibles',
      'ar': 'تصفية الأنشطة المتاحة',
      'de': 'Filtern Sie verfügbare Aktivitäten',
      'en': 'Filter available activities',
      'fr': 'Filtrer les activités disponibles',
    },
    'gvimnw05': {
      'es': 'Todos',
      'ar': 'الجميع',
      'de': 'Alle',
      'en': 'All',
      'fr': 'Tous',
    },
    '14gn78wf': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    'w77xkrpp': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    'zegsowjh': {
      'es': 'Fútbol 7\n',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    '64rzwaqi': {
      'es': 'Pádel\n',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    'iuvbfujy': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    '2wracbj9': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    'wit8t9p4': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    '4ntkw1j9': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'jtymkndg': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    'fejgitoq': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    '3agjxl3i': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'v06kj2x5': {
      'es': 'Fútbol 7',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    'x5d18360': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    'nmwj4qi5': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'x6lwgl1h': {
      'es': 'Pádel',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    'tsd9g1i0': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    'n1dremss': {
      'es': 'Actividades disponibles',
      'ar': 'الأنشطة المتاحة',
      'de': 'Verfügbare Aktivitäten',
      'en': 'Available activities',
      'fr': 'Activités disponibles',
    },
    '70z7mxnh': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'ffrnv84o': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    '2n9x7km2': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    'nz9xn5mw': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    'tj7a74ut': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    'q5you20h': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    'cdrkl0p2': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    '9rjg7tme': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    '11s8wsvp': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    'u4b6ylcx': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    'jtjteqnl': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ActividadesFS
  {
    'cm7c09cc': {
      'es': 'Filtra las actividades disponibles',
      'ar': 'تصفية الأنشطة المتاحة',
      'de': 'Filtern Sie verfügbare Aktivitäten',
      'en': 'Filter available activities',
      'fr': 'Filtrer les activités disponibles',
    },
    '8t8zny1o': {
      'es': 'Todos',
      'ar': 'الجميع',
      'de': 'Alle',
      'en': 'All',
      'fr': 'Tous',
    },
    'sr5xlknu': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    'rr1eo52p': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    '0mspu8bk': {
      'es': 'Fútbol 7\n',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    'bsn0c5h0': {
      'es': 'Pádel\n',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    '3f89yg3q': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    '9xbi1z8a': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    '8rbjwion': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    'bkna27z7': {
      'es': 'Actividades disponibles',
      'ar': 'الأنشطة المتاحة',
      'de': 'Verfügbare Aktivitäten',
      'en': 'Available activities',
      'fr': 'Activités disponibles',
    },
    '8va3r3ms': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'vfo8u832': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'zjn69xjg': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    'dmijk8sx': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    '6hol4zp6': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    'xmnotn2s': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    'tgl4gqyy': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    '8ifv1wkj': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'et9rzmdp': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    'cseaosos': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    'ajldlf4w': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ActividadesB
  {
    'v6qk1c2e': {
      'es': 'Filtra las actividades disponibles',
      'ar': 'تصفية الأنشطة المتاحة',
      'de': 'Filtern Sie verfügbare Aktivitäten',
      'en': 'Filter available activities',
      'fr': 'Filtrer les activités disponibles',
    },
    'vbrnsdma': {
      'es': 'Todos',
      'ar': 'الجميع',
      'de': 'Alle',
      'en': 'All',
      'fr': 'Tous',
    },
    'i4znodz4': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    'tz4xf1yc': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    'i1r43p6m': {
      'es': 'Fútbol 7\n',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    'x31ehxzg': {
      'es': 'Pádel\n',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    'j621o4c6': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    '5tj6ertl': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    'phz7oiqk': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    '11g0jkhr': {
      'es': 'Actividades disponibles',
      'ar': 'الأنشطة المتاحة',
      'de': 'Verfügbare Aktivitäten',
      'en': 'Available activities',
      'fr': 'Activités disponibles',
    },
    '4gt4ycts': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'okr65n3n': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    '19h7mr10': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    'bj60ilfl': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    'w8hk5p5z': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    'ax6bym9x': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    '275ahmxv': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'frtnw6kp': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'wb7kbikf': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    'uxqyquxl': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    '5pag871t': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ActividadesF7
  {
    'u4h11iet': {
      'es': 'Filtra las actividades disponibles',
      'ar': 'تصفية الأنشطة المتاحة',
      'de': 'Filtern Sie verfügbare Aktivitäten',
      'en': 'Filter available activities',
      'fr': 'Filtrer les activités disponibles',
    },
    'ft70xlju': {
      'es': 'Todos',
      'ar': 'الجميع',
      'de': 'Alle',
      'en': 'All',
      'fr': 'Tous',
    },
    '65345oy8': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    'i044eulp': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    '3ut81e6x': {
      'es': 'Fútbol 7\n',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    '5diknp0u': {
      'es': 'Pádel\n',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    'b1t5p79z': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أوغستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'dhunumka': {
      'es': 'Fútbol 7',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    'suxo4m3v': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    'lppm6r05': {
      'es': 'Actividades disponibles',
      'ar': 'الأنشطة المتاحة',
      'de': 'Verfügbare Aktivitäten',
      'en': 'Available activities',
      'fr': 'Activités disponibles',
    },
    'mi74vj4m': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'y0vknvim': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'cxgvxswh': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    '9p8tnblq': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    'uvwx7flb': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    'whgue0t1': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    '1ksoyox7': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'b6f1fmkv': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'tfqa7lnf': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    'ss300sve': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    'yeua9reg': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ActividadesP
  {
    '6ld894ml': {
      'es': 'Filtra las actividades disponibles',
      'ar': 'تصفية الأنشطة المتاحة',
      'de': 'Filtern Sie verfügbare Aktivitäten',
      'en': 'Filter available activities',
      'fr': 'Filtrer les activités disponibles',
    },
    'e7ukr1ko': {
      'es': 'Todos',
      'ar': 'الجميع',
      'de': 'Alle',
      'en': 'All',
      'fr': 'Tous',
    },
    'ivwtth4s': {
      'es': 'Fútbol Sala',
      'ar': 'كرة الصالات',
      'de': 'Futsal',
      'en': 'Indoor Soccer',
      'fr': 'Futsal',
    },
    'k9owqxa0': {
      'es': 'Baloncesto',
      'ar': 'كرة السلة',
      'de': 'Basketball',
      'en': 'Basketball',
      'fr': 'Basket-ball',
    },
    'qwdyqjv3': {
      'es': 'Fútbol 7\n',
      'ar': 'كرة القدم 7',
      'de': 'Fußball 7',
      'en': '7-a-side football',
      'fr': 'Football 7',
    },
    'fwkyzdeq': {
      'es': 'Pádel\n',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    '40wrpf1o': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'tbgb9kjw': {
      'es': 'Pádel',
      'ar': 'باديل',
      'de': 'Padel',
      'en': 'Paddle tennis',
      'fr': 'Padel',
    },
    'p0xn229v': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
    'c87y4ghw': {
      'es': 'Actividades disponibles',
      'ar': 'الأنشطة المتاحة',
      'de': 'Verfügbare Aktivitäten',
      'en': 'Available activities',
      'fr': 'Activités disponibles',
    },
    'y2q9l9ju': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'o5tlw3ev': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    '2030alsx': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    'skhkud1s': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    'pcz4cxjo': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    '5l3ssrxx': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    'pz665f8n': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'drdeenqa': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'objsdleb': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    '9978i4tz': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    '6kaidwhw': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Disponibility
  {
    'kim6ixfl': {
      'es': 'Día de la Reserva',
      'ar': 'يوم الاحتياطي',
      'de': 'Reservetag',
      'en': 'Reserve Day',
      'fr': 'Jour de réserve',
    },
    'oli77i81': {
      'es': 'Seleccione el día',
      'ar': 'حدد اليوم',
      'de': 'Wählen Sie den Tag aus',
      'en': 'Select the day',
      'fr': 'Sélectionnez le jour',
    },
    'hviac47d': {
      'es': 'Search...',
      'ar': 'يبحث...',
      'de': 'Suchen...',
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'aulsu6um': {
      'es': 'Hora de la Reserva',
      'ar': 'وقت الحجز',
      'de': 'Reservierungszeit',
      'en': 'Reservation Time',
      'fr': 'Heure de réservation',
    },
    'dyy8207z': {
      'es': '12:00',
      'ar': '12:00',
      'de': '12:00',
      'en': '12:00',
      'fr': '12h00',
    },
    '756ootyd': {
      'es': '13:00',
      'ar': '13:00',
      'de': '13:00',
      'en': '13:00',
      'fr': '13h00',
    },
    '2qh4i778': {
      'es': '14:00',
      'ar': '14:00',
      'de': '14:00',
      'en': '14:00',
      'fr': '14h00',
    },
    'ngfwofy2': {
      'es': '15:00',
      'ar': '15:00',
      'de': '15:00',
      'en': '15:00',
      'fr': '15h00',
    },
    '2lrt8wzb': {
      'es': '16:00',
      'ar': '16:00',
      'de': '16:00',
      'en': '16:00',
      'fr': '16h00',
    },
    'zeqggl7c': {
      'es': '17:00',
      'ar': '17:00',
      'de': '17:00',
      'en': '17:00',
      'fr': '17h00',
    },
    'b7tesvz7': {
      'es': '18:00',
      'ar': '18:00',
      'de': '18:00',
      'en': '18:00',
      'fr': '18h00',
    },
    'hhcuih49': {
      'es': 'Seleccione la hora',
      'ar': 'حدد الوقت',
      'de': 'Wählen Sie die Uhrzeit aus',
      'en': 'Select time',
      'fr': 'Sélectionnez l\'heure',
    },
    'wpoae6h4': {
      'es': 'Search...',
      'ar': 'يبحث...',
      'de': 'Suchen...',
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'ieghzyn8': {
      'es': 'Continuar',
      'ar': 'يكمل',
      'de': 'Weitermachen',
      'en': 'Continue',
      'fr': 'Continuer',
    },
    'griltw32': {
      'es': 'Calendario',
      'ar': 'تقويم',
      'de': 'Kalender',
      'en': 'Calendar',
      'fr': 'Calendrier',
    },
    '66jelkvt': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'eugozb0r': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    'rcyc4z51': {
      'es': 'Idioma',
      'ar': 'لغة',
      'de': 'Sprache',
      'en': 'Language',
      'fr': 'Langue',
    },
    'luhoi3tl': {
      'es': 'Configura tu idioma',
      'ar': 'اضبط لغتك',
      'de': 'Stellen Sie Ihre Sprache ein',
      'en': 'Set your language',
      'fr': 'Définissez votre langue',
    },
    '7ewsjf05': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
    'sxm3fbus': {
      'es': 'Configura tus datos de pago',
      'ar': 'قم بإعداد تفاصيل الدفع الخاصة بك',
      'de': 'Richten Sie Ihre Zahlungsdetails ein',
      'en': 'Set up your payment details',
      'fr': 'Configurez vos informations de paiement',
    },
    'z32o8f6r': {
      'es': 'Perfil',
      'ar': 'حساب تعريفي',
      'de': 'Profil',
      'en': 'Profile',
      'fr': 'Profil',
    },
    'v8e5bm85': {
      'es': 'Configura tu perfil',
      'ar': 'قم بإعداد ملف التعريف الخاص بك',
      'de': 'Richten Sie Ihr Profil ein',
      'en': 'Set up your profile',
      'fr': 'Configurez votre profil',
    },
    '0g2ydsd0': {
      'es': 'Salir',
      'ar': 'الخروج',
      'de': 'Hinausgehen',
      'en': 'Go out',
      'fr': 'Sortir',
    },
    '98m6nrnt': {
      'es': 'Cerrar Sesión',
      'ar': 'تسجيل الخروج',
      'de': 'Abmelden',
      'en': 'Close Session',
      'fr': 'Se déconnecter',
    },
    'vjoodlwe': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // register
  {
    '6gg85csr': {
      'es': 'CourtMe\n',
      'ar': 'كورتمي',
      'de': 'CourtMe',
      'en': 'CourtMe',
      'fr': 'Courez-moi',
    },
    '71s23ya5': {
      'es': '¡Bienvenido!',
      'ar': 'مرحباً!',
      'de': 'Willkommen!',
      'en': 'Welcome!',
      'fr': 'Accueillir!',
    },
    'atdo6ffq': {
      'es': 'Rellena la información para crear tu cuenta',
      'ar': 'املأ المعلومات لإنشاء حسابك',
      'de': 'Füllen Sie die Informationen aus, um Ihr Konto zu erstellen',
      'en': 'Fill in the information to create your account',
      'fr': 'Remplissez les informations pour créer votre compte',
    },
    'jjmgaroi': {
      'es': 'Email',
      'ar': 'بريد إلكتروني',
      'de': 'E-Mail',
      'en': 'E-mail',
      'fr': 'E-mail',
    },
    'i8a9z143': {
      'es': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'aocdy6v8': {
      'es': 'Confirmar contraseña',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Passwort bestätigen',
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
    },
    '5b26qvot': {
      'es': 'Crear cuenta',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'en': 'Create account',
      'fr': 'Créer un compte',
    },
    '6sdoih1o': {
      'es': 'O accede con:',
      'ar': 'أو الوصول مع:',
      'de': 'Oder greifen Sie zu mit:',
      'en': 'Or log in with:',
      'fr': 'Ou accédez avec :',
    },
    '8pd1x7t8': {
      'es': 'Accede con Google',
      'ar': 'الوصول مع جوجل',
      'de': 'Zugriff mit Google',
      'en': 'Sign in with Google',
      'fr': 'Accès avec Google',
    },
    '9kinwy21': {
      'es': 'Accede con Apple',
      'ar': 'الوصول مع أبل',
      'de': 'Zugriff mit Apple',
      'en': 'Sign in with Apple',
      'fr': 'Accès avec Apple',
    },
    'medbsc0g': {
      'es': '¿Ya tienes cuenta? ',
      'ar': 'هل لديك حساب بالفعل؟',
      'de': 'Haben Sie bereits ein Konto?',
      'en': 'Already have an account?',
      'fr': 'Avez-vous déjà un compte ?',
    },
    '22i8qxkz': {
      'es': 'Inicia sesión aquí',
      'ar': 'تسجيل الدخول هنا',
      'de': 'Melden Sie sich hier an',
      'en': 'Log in here',
      'fr': 'Connectez-vous ici',
    },
    '79e1oh7l': {
      'es': 'Debe introducir un email',
      'ar': 'يجب عليك إدخال البريد الإلكتروني',
      'de': 'Sie müssen eine E-Mail-Adresse eingeben',
      'en': 'You must enter an email',
      'fr': 'Vous devez saisir un email',
    },
    '6h4v3wg1': {
      'es': 'Por favor, introduce un correo válido.',
      'ar': 'الرجاء إدخال بريد إلكتروني صالح.',
      'de': 'Bitte geben Sie eine gültige E-Mail-Adresse ein.',
      'en': 'Please enter a valid email.',
      'fr': 'Veuillez saisir un email valide.',
    },
    'jww1pyrd': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u1vyinwx': {
      'es': 'Debe introducir una contraseña',
      'ar': 'يجب عليك إدخال كلمة المرور',
      'de': 'Sie müssen ein Passwort eingeben',
      'en': 'You must enter a password',
      'fr': 'Vous devez entrer un mot de passe',
    },
    'f6tgx5d2': {
      'es': 'La contraseña debe tener al menos 6 caracteres',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'de': 'Das Passwort muss mindestens 6 Zeichen lang sein',
      'en': 'Password must be at least 6 characters long',
      'fr': 'Le mot de passe doit contenir au moins 6 caractères',
    },
    'd0sh95ek': {
      'es':
          'La contraseña debe tener al menos una letra\nmayúscula, una minúscula y un número.',
      'ar':
          'كلمة المرور يجب أن تحتوي على حرف واحد على الأقل\nحرف كبير وحرف صغير ورقم.',
      'de':
          'Das Passwort muss mindestens einen Buchstaben haben\nGroßbuchstabe, ein Kleinbuchstabe und eine Zahl.',
      'en':
          'The password must have at least one uppercase letter, one lowercase letter, and one number.',
      'fr':
          'Le mot de passe doit contenir au moins une lettre\nune lettre majuscule, une lettre minuscule et un chiffre.',
    },
    'her2lbpx': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vk2ix0y1': {
      'es': 'Debe confirmar la contraseña',
      'ar': 'يجب عليك تأكيد كلمة المرور',
      'de': 'Sie müssen das Passwort bestätigen',
      'en': 'You must confirm the password',
      'fr': 'Vous devez confirmer le mot de passe',
    },
    '0sv5rsfx': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'gpidltj0': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // datosUser
  {
    'q7gwk2q4': {
      'es': 'Datos de usuario',
      'ar': 'بيانات المستخدم',
      'de': 'Benutzerdaten',
      'en': 'User data',
      'fr': 'Données utilisateur',
    },
    'x6rihjqy': {
      'es': 'Nombre',
      'ar': 'اسم',
      'de': 'Name',
      'en': 'Name',
      'fr': 'Nom',
    },
    'yjlx82i4': {
      'es': 'Ingrese un nombre...',
      'ar': 'أدخل اسما...',
      'de': 'Geben Sie einen Namen ein...',
      'en': 'Please enter a name...',
      'fr': 'Entrez un nom...',
    },
    'uk0hswxj': {
      'es': 'Teléfono',
      'ar': 'هاتف',
      'de': 'Telefon',
      'en': 'Phone',
      'fr': 'Téléphone',
    },
    'rhyi78it': {
      'es': 'Ingrese un teléfono',
      'ar': 'أدخل الهاتف',
      'de': 'Geben Sie eine Telefonnummer ein',
      'en': 'Enter a phone number',
      'fr': 'Entrez un téléphone',
    },
    '33qjd5cr': {
      'es': 'Subir imágen',
      'ar': 'تحميل الصورة',
      'de': 'Bild hochladen',
      'en': 'Upload image',
      'fr': 'Télécharger une image',
    },
    'nlu3xxio': {
      'es': 'Modificar datos',
      'ar': 'تعديل البيانات',
      'de': 'Daten ändern',
      'en': 'Modify data',
      'fr': 'Modifier les données',
    },
    'dtpisdhc': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // lenguajeSelector
  {
    'zf91imfk': {
      'es': 'Selecciona el idioma',
      'ar': 'اختر اللغة',
      'de': 'Wählen Sie die Sprache aus',
      'en': 'Select language',
      'fr': 'Sélectionnez la langue',
    },
    'o06do0ti': {
      'es': 'Selecciona el idioma deseado',
      'ar': 'حدد اللغة المطلوبة',
      'de': 'Wählen Sie die gewünschte Sprache aus',
      'en': 'Select the desired language',
      'fr': 'Sélectionnez la langue souhaitée',
    },
    'z28lblqi': {
      'es':
          'En esta aplicación nos tomamos muy en serio la accesibilidad, porque creemos que todos deberían disfrutar de una experiencia cómoda y personalizada.',
      'ar':
          'نحن نأخذ إمكانية الوصول على محمل الجد في هذا التطبيق، لأننا نعتقد أنه يجب على الجميع الاستمتاع بتجربة مريحة وشخصية.',
      'de':
          'Wir legen bei dieser App großen Wert auf Barrierefreiheit, denn wir glauben, dass jeder ein komfortables und persönliches Erlebnis genießen sollte.',
      'en':
          'We take accessibility seriously in this app because we believe everyone should enjoy a comfortable and personalized experience.',
      'fr':
          'Nous prenons l\'accessibilité très au sérieux dans cette application, car nous pensons que tout le monde devrait profiter d\'une expérience confortable et personnalisée.',
    },
    'jz18unzn': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // RevisionPedido
  {
    'mwig7ii4': {
      'es': 'Tiempo para completar su reserva',
      'ar': 'حان الوقت لإكمال حجزك',
      'de': 'Zeit, Ihre Reservierung abzuschließen',
      'en': 'Time to complete your reservation',
      'fr': 'Il est temps de finaliser votre réservation',
    },
    'zxpa65ld': {
      'es': 'Reiniciar',
      'ar': 'إعادة التشغيل',
      'de': 'Neustart',
      'en': 'Reboot',
      'fr': 'Redémarrer',
    },
    'pf3hnuul': {
      'es': 'Tus reservas',
      'ar': 'تحفظاتك',
      'de': 'Ihre Reservierungen',
      'en': 'Your reservations',
      'fr': 'Vos réservations',
    },
    '5w0l73x1': {
      'es': 'A continuacion todas las reservas seleccionadas',
      'ar': 'فيما يلي جميع الحجوزات المختارة',
      'de': 'Nachfolgend finden Sie alle ausgewählten Reservierungen',
      'en': 'Below are all the selected reservations',
      'fr': 'Ci-dessous toutes les réservations sélectionnées',
    },
    'yi9kh0zw': {
      'es': 'Fútbol Sala\n4 de Diciembre\n12:00-13:00h',
      'ar': 'كرة الصالات\n4 ديسمبر\n12:00-1:00 ظهراً',
      'de': 'Futsal\n4. Dezember\n12:00-13:00 Uhr',
      'en': 'Indoor Soccer\nDecember 4\n12:00-13:00h',
      'fr': 'Futsal\n4 décembre\n12h00-13h00',
    },
    '9nhwe9vj': {
      'es': 'Polideportivo Agustín Marañón',
      'ar': 'مركز أغوستين مارانيون الرياضي',
      'de': 'Sportzentrum Agustín Marañón',
      'en': 'Agustin Marañón Sports Center',
      'fr': 'Centre sportif Agustín Marañón',
    },
    'zmn49wec': {
      'es': ' ',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'vjw6rggc': {
      'es': '€12',
      'ar': '12 يورو',
      'de': '12 €',
      'en': '€12',
      'fr': '12 €',
    },
    'wtue91j4': {
      'es':
          'Fantásticas pistas deportivas cubiertas y al aire libre para que jóvenes y mayores puedan disfrutar de sus preferencias deportivas',
      'ar':
          'ملاعب رياضية داخلية وخارجية رائعة حتى يتمكن الصغار والكبار من الاستمتاع بتفضيلاتهم الرياضية',
      'de':
          'Fantastische Innen- und Außensportplätze, damit Jung und Alt ihre sportlichen Vorlieben genießen können',
      'en':
          'Fantastic indoor and outdoor sports courts so that young and old can enjoy their sporting preferences',
      'fr':
          'De fantastiques terrains de sport intérieurs et extérieurs pour que petits et grands puissent profiter de leurs préférences sportives',
    },
    '41xzib00': {
      'es': 'Eliminar',
      'ar': 'اِسْتَبْعَد',
      'de': 'Beseitigen',
      'en': 'Eliminate',
      'fr': 'Éliminer',
    },
    'a5wgfq38': {
      'es': 'Resumen',
      'ar': 'ملخص',
      'de': 'Zusammenfassung',
      'en': 'Summary',
      'fr': 'Résumé',
    },
    '8a7nvmq8': {
      'es': 'Total a pagar ',
      'ar': 'مجموع للدفع',
      'de': 'Gesamtbetrag zu zahlen',
      'en': 'Total to pay',
      'fr': 'Total à payer',
    },
    'gu7gbtbl': {
      'es': 'Precio base',
      'ar': 'السعر الأساسي',
      'de': 'Grundpreis',
      'en': 'Base price',
      'fr': 'Prix ​​de base',
    },
    'uk88jhsv': {
      'es': '€9,92',
      'ar': '9.92 يورو',
      'de': '9,92 €',
      'en': '€9.92',
      'fr': '9,92 €',
    },
    'zvmp21qy': {
      'es': 'IVA 21%',
      'ar': 'ضريبة القيمة المضافة 21%',
      'de': 'MwSt. 21 %',
      'en': 'VAT 21%',
      'fr': 'TVA 21%',
    },
    'u7pj7uav': {
      'es': '€2,08',
      'ar': '2.08 يورو',
      'de': '2,08 €',
      'en': '€2.08',
      'fr': '2,08 €',
    },
    '24j6xrnm': {
      'es': 'Fianza',
      'ar': 'الكفالة',
      'de': 'Kaution',
      'en': 'Bail',
      'fr': 'Caution',
    },
    'um2rsitg': {
      'es': '2€',
      'ar': '2 يورو',
      'de': '2 €',
      'en': '2€',
      'fr': '2 €',
    },
    'fr46rta9': {
      'es': 'Total',
      'ar': 'المجموع',
      'de': 'Gesamt',
      'en': 'Total',
      'fr': 'Total',
    },
    'p45y8e2l': {
      'es': '€14',
      'ar': '14 يورو',
      'de': '14 €',
      'en': '€14',
      'fr': '14 €',
    },
    'w7lpyw1s': {
      'es': 'Continuar al pago',
      'ar': 'الاستمرار في الدفع',
      'de': 'Weiter zur Zahlung',
      'en': 'Continue to checkout',
      'fr': 'Continuer le paiement',
    },
    'jwu6vu7x': {
      'es': 'Revision de Pedido',
      'ar': 'مراجعة الطلب',
      'de': 'Bestellüberprüfung',
      'en': 'Order Review',
      'fr': 'Révision de la commande',
    },
    'y1yv9czw': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Pagoconfirmado
  {
    'uyhouzl9': {
      'es': '¡Pago confirmado!',
      'ar': 'تم تأكيد الدفع!',
      'de': 'Zahlung bestätigt!',
      'en': 'Payment confirmed!',
      'fr': 'Paiement confirmé !',
    },
    'twazoawd': {
      'es': '€14',
      'ar': '14 يورو',
      'de': '14 €',
      'en': '€14',
      'fr': '14 €',
    },
    '02kr7lic': {
      'es':
          'Tu pago ha sido confirmado, a veces el cargo puede tardar entre 1 y 2 horas en aparecer en el extracto bancario',
      'ar':
          'لقد تم تأكيد دفعتك، وفي بعض الأحيان قد يستغرق الأمر من ساعة إلى ساعتين حتى تظهر الرسوم في كشف حسابك البنكي',
      'de':
          'Ihre Zahlung wurde bestätigt. Manchmal kann es 1–2 Stunden dauern, bis die Belastung auf Ihrem Kontoauszug erscheint',
      'en':
          'Your payment has been confirmed, sometimes it can take 1-2 hours for the charge to appear on your bank statement',
      'fr':
          'Votre paiement a été confirmé. Parfois, cela peut prendre 1 à 2 heures pour que les frais apparaissent sur votre relevé bancaire.',
    },
    'abwcd9on': {
      'es': '€14',
      'ar': '14 يورو',
      'de': '14 €',
      'en': '€14',
      'fr': '14 €',
    },
    'lyvo8cpe': {
      'es': ' ¡GRACIAS POR CONFIAR \n           EN COURTME!',
      'ar': 'شكرا لك على الثقة \n           في المحكمة!',
      'de': 'VIELEN DANK FÜR IHR VERTRAUEN \n           VOR GERICHT!',
      'en': 'THANK YOU FOR TRUSTING \nCOURTME!',
      'fr': 'MERCI DE VOTRE CONFIANCE \n           À LA COUR !',
    },
    '58kkbw69': {
      'es': 'Volver a inicio',
      'ar': 'العودة إلى المنزل',
      'de': 'Rückkehr nach Hause',
      'en': 'Back to home',
      'fr': 'Retour à la maison',
    },
    '788rzify': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // pago
  {
    'wvi7qeef': {
      'es': 'Tiempo para completar su reserva',
      'ar': 'حان الوقت لإكمال حجزك',
      'de': 'Zeit, Ihre Reservierung abzuschließen',
      'en': 'Time to complete your reservation',
      'fr': 'Il est temps de finaliser votre réservation',
    },
    '6dfzqbl7': {
      'es': 'Reiniciar',
      'ar': 'إعادة التشغيل',
      'de': 'Neustart',
      'en': 'Reboot',
      'fr': 'Redémarrer',
    },
    'y22tzzfo': {
      'es': '     Introduzca sus datos de pago',
      'ar': 'أدخل تفاصيل الدفع الخاصة بك',
      'de': 'Geben Sie Ihre Zahlungsdaten ein',
      'en': 'Enter your payment details',
      'fr': 'Entrez vos informations de paiement',
    },
    's84azd6w': {
      'es': 'Número de tarjeta',
      'ar': 'رقم البطاقة',
      'de': 'Kartennummer',
      'en': 'Card number',
      'fr': 'Numéro de carte',
    },
    '70a5mtt7': {
      'es': 'Expira',
      'ar': 'تنتهي',
      'de': 'Läuft ab',
      'en': 'Expires',
      'fr': 'Expire',
    },
    '3tfokjd4': {
      'es': '',
      'ar': '',
      'de': '',
      'en': 'Expires',
      'fr': '',
    },
    'w9v3lwqf': {
      'es': 'CVV',
      'ar': 'CVV',
      'de': 'CVV',
      'en': 'CVV',
      'fr': 'CVV',
    },
    'du2003vt': {
      'es': 'Titular de la tarjeta',
      'ar': 'حامل البطاقة',
      'de': 'Karteninhaber',
      'en': 'Cardholder',
      'fr': 'Titulaire de la carte',
    },
    'rapdxtia': {
      'es': '',
      'ar': '',
      'de': '',
      'en': 'Holder',
      'fr': '',
    },
    '7e1clb0k': {
      'es': 'Sus datos de pago se tratarán de forma segura',
      'ar': 'ستتم معالجة تفاصيل الدفع الخاصة بك بشكل آمن',
      'de': 'Ihre Zahlungsdaten werden sicher verarbeitet',
      'en': 'Your payment details will be treated securely',
      'fr': 'Vos informations de paiement seront traitées en toute sécurité',
    },
    '2ivh59og': {
      'es': 'Resumen',
      'ar': 'ملخص',
      'de': 'Zusammenfassung',
      'en': 'Summary',
      'fr': 'Résumé',
    },
    'p8xnczzb': {
      'es': 'Precio base',
      'ar': 'السعر الأساسي',
      'de': 'Grundpreis',
      'en': 'Base price',
      'fr': 'Prix ​​de base',
    },
    'jsmzo92h': {
      'es': '€9,92',
      'ar': '9.92 يورو',
      'de': '9,92 €',
      'en': '€9.92',
      'fr': '9,92 €',
    },
    '091aydmw': {
      'es': 'IVA 21%',
      'ar': 'ضريبة القيمة المضافة 21%',
      'de': 'MwSt. 21 %',
      'en': 'VAT 21%',
      'fr': 'TVA 21%',
    },
    '43nzcadj': {
      'es': '€2,08',
      'ar': '2.08 يورو',
      'de': '2,08 €',
      'en': '€2.08',
      'fr': '2,08 €',
    },
    'glpd9se1': {
      'es': 'Fianza',
      'ar': 'الكفالة',
      'de': 'Kaution',
      'en': 'Bail',
      'fr': 'Caution',
    },
    '257gcaq9': {
      'es': '2€',
      'ar': '2 يورو',
      'de': '2 €',
      'en': '2€',
      'fr': '2 €',
    },
    '0sf6s9jr': {
      'es': 'Total',
      'ar': 'المجموع',
      'de': 'Gesamt',
      'en': 'Total',
      'fr': 'Total',
    },
    '8r009xlp': {
      'es': '€14',
      'ar': '14 يورو',
      'de': '14 €',
      'en': '€14',
      'fr': '14 €',
    },
    'z004jqmu': {
      'es': 'Pagar ahora',
      'ar': 'ادفع الآن',
      'de': 'Bezahlen Sie jetzt',
      'en': 'Pay now',
      'fr': 'Payez maintenant',
    },
    '1z9bsqtu': {
      'es': 'Plataforma de pago',
      'ar': 'منصة الدفع',
      'de': 'Zahlungsplattform',
      'en': 'Payment platform',
      'fr': 'Plateforme de paiement',
    },
  },
  // datosBancarios
  {
    'r0sp2yst': {
      'es': '     Introduzca sus datos de pago',
      'ar': 'أدخل تفاصيل الدفع الخاصة بك',
      'de': 'Geben Sie Ihre Zahlungsdaten ein',
      'en': 'Enter your payment details',
      'fr': 'Entrez vos informations de paiement',
    },
    'uzxx1puy': {
      'es': 'Número de tarjeta',
      'ar': 'رقم البطاقة',
      'de': 'Kartennummer',
      'en': 'Card number',
      'fr': 'Numéro de carte',
    },
    'e16qxeec': {
      'es': 'Expira',
      'ar': 'تنتهي',
      'de': 'Läuft ab',
      'en': 'Expires',
      'fr': 'Expire',
    },
    '097xcwnl': {
      'es': '',
      'ar': '',
      'de': '',
      'en': 'Expires',
      'fr': '',
    },
    'kpddq918': {
      'es': 'CVV',
      'ar': 'CVV',
      'de': 'CVV',
      'en': 'CVV',
      'fr': 'CVV',
    },
    '7w8ctzqd': {
      'es': 'Titular de la tarjeta',
      'ar': 'حامل البطاقة',
      'de': 'Karteninhaber',
      'en': 'Cardholder',
      'fr': 'Titulaire de la carte',
    },
    '663fwg06': {
      'es': '',
      'ar': '',
      'de': '',
      'en': 'Holder',
      'fr': '',
    },
    'dctw77gu': {
      'es': 'Sus datos de pago se tratarán de forma segura',
      'ar': 'ستتم معالجة تفاصيل الدفع الخاصة بك بشكل آمن',
      'de': 'Ihre Zahlungsdaten werden sicher verarbeitet',
      'en': 'Your payment details will be treated securely',
      'fr': 'Vos informations de paiement seront traitées en toute sécurité',
    },
    'zzgj99fl': {
      'es': 'Guardar ',
      'ar': 'يحفظ',
      'de': 'Halten',
      'en': 'Keep',
      'fr': 'Garder',
    },
    'ohj8f7em': {
      'es': 'Debe rellenar el número de tarjeta',
      'ar': 'يجب عليك ملء رقم البطاقة',
      'de': 'Sie müssen die Kartennummer eingeben',
      'en': 'You must fill in the card number',
      'fr': 'Vous devez renseigner le numéro de carte',
    },
    '41c6hcwk': {
      'es': 'Número de tarjeta no válido',
      'ar': 'رقم البطاقة غير صالح',
      'de': 'Ungültige Kartennummer',
      'en': 'Invalid card number',
      'fr': 'Numéro de carte invalide',
    },
    'vvai2j80': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8iptlxwa': {
      'es': 'Debe rellenar la \nfecha de expiración',
      'ar': 'يجب عليك ملء \nتاريخ انتهاء الصلاحية',
      'de': 'Sie müssen das ausfüllen \nVerfallsdatum',
      'en': 'You must fill in the \nexpiration date',
      'fr': 'Vous devez remplir le \ndate de péremption',
    },
    'w3lmf74y': {
      'es': 'Formato de fecha \ndebe ser MM/YY',
      'ar': 'تنسيق التاريخ \nيجب أن يكون MM/YY',
      'de': 'Datumsformat \nmuss MM/JJ sein',
      'en': 'Date format \nmust be MM/YY',
      'fr': 'Format des dates \ndoit être MM/AA',
    },
    'ychj8iob': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'o7a6f7cg': {
      'es': 'Debe rellenar el CVV',
      'ar': 'يجب عليك ملء CVV',
      'de': 'Sie müssen den CVV ausfüllen',
      'en': 'You must fill out the CVV',
      'fr': 'Vous devez remplir le CVV',
    },
    '3wvrafm3': {
      'es': 'Debe ser un número\n de 3 o 4 dígitos',
      'ar': 'يجب أن يكون رقما\n 3 أو 4 أرقام',
      'de': 'Es muss eine Zahl sein\n 3 oder 4 Ziffern',
      'en': 'It must be a 3 or 4 digit number',
      'fr': 'Ce doit être un numéro\n 3 ou 4 chiffres',
    },
    '37szqha2': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '98fhb0o7': {
      'es': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Feld ist erforderlich',
      'en': 'Field is required',
      'fr': 'Le champ est obligatoire',
    },
    'jdj5qsiv': {
      'es': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'g0lsn3jz': {
      'es': 'Datos Bancarios',
      'ar': 'بيانات البنك',
      'de': 'Bankdaten',
      'en': 'Bank details',
      'fr': 'Données bancaires',
    },
  },
  // ayudaUsuario
  {
    'siloirda': {
      'es': 'Ayuda',
      'ar': 'يساعد',
      'de': 'Hilfe',
      'en': 'Aid',
      'fr': 'Aide',
    },
    'usw8hnbs': {
      'es':
          '¿Necesitas ayuda con CourtMe? Aquí encontrarás información sobre cómo usar la aplicación, reservar pistas, gestionar tus reservas y mucho más.',
      'ar':
          'هل تحتاج إلى مساعدة مع CourtMe؟ ستجد هنا معلومات حول كيفية استخدام التطبيق وحجز المحاكم وإدارة حجوزاتك وغير ذلك الكثير.',
      'de':
          'Benötigen Sie Hilfe bei CourtMe? Hier finden Sie Informationen zur Nutzung der App, zur Platzbuchung, zur Verwaltung Ihrer Reservierungen und vielem mehr.',
      'en':
          'Need help with CourtMe? Here you\'ll find information on how to use the app, book courts, manage your reservations, and more.',
      'fr':
          'Avez-vous besoin d\'aide avec CourtMe ? Vous trouverez ici des informations sur la façon d\'utiliser l\'application, de réserver des courts, de gérer vos réservations et bien plus encore.',
    },
    'u1m2q46b': {
      'es': 'Preguntas Frecuentes',
      'ar': 'الأسئلة المتداولة',
      'de': 'Häufig gestellte Fragen',
      'en': 'Frequently Asked Questions',
      'fr': 'Foire aux questions',
    },
    '8fkcsz0l': {
      'es': '¿Cómo reservo una pista?',
      'ar': 'كيف أحجز المسار؟',
      'de': 'Wie reserviere ich einen Titel?',
      'en': 'How do I reserve a court?',
      'fr': 'Comment réserver une piste ?',
    },
    'phxrdjx4': {
      'es': '¿Puedo cancelar mi reserva?',
      'ar': 'هل يمكنني إلغاء حجزي؟',
      'de': 'Kann ich meine Reservierung stornieren?',
      'en': 'Can I cancel my reservation?',
      'fr': 'Puis-je annuler ma réservation ?',
    },
    'xnbe9cgi': {
      'es': '¿Cómo pago mi reserva?',
      'ar': 'كيف أدفع ثمن حجزي؟',
      'de': 'Wie bezahle ich meine Reservierung?',
      'en': 'How do I pay for my reservation?',
      'fr': 'Comment payer ma réservation ?',
    },
    'wt3ckell': {
      'es': '¿Hay penalización si cancelo?',
      'ar': 'هل هناك عقوبة إذا قمت بالإلغاء؟',
      'de': 'Gibt es eine Strafe, wenn ich storniere?',
      'en': 'Is there a penalty if I cancel?',
      'fr': 'Y a-t-il une pénalité si j\'annule ?',
    },
    'spbv42cl': {
      'es': 'Política de Privacidad',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutzrichtlinie',
      'en': 'Privacy Policy',
      'fr': 'politique de confidentialité',
    },
    'mt41j1ka': {
      'es':
          'En CourtMe nos tomamos muy en serio la privacidad de nuestros usuarios. Aquí puedes consultar cómo recopilamos, usamos y protegemos tus datos personales.',
      'ar':
          'في CourtMe نحن نأخذ خصوصية مستخدمينا على محمل الجد. هنا يمكنك أن ترى كيف نقوم بجمع بياناتك الشخصية واستخدامها وحمايتها.',
      'de':
          'Bei CourtMe nehmen wir die Privatsphäre unserer Benutzer sehr ernst. Hier erfahren Sie, wie wir Ihre personenbezogenen Daten erheben, nutzen und schützen.',
      'en':
          'At CourtMe we take the privacy of our users very seriously. Here you can find out how we collect, use and protect your personal data.',
      'fr':
          'Chez CourtMe, nous prenons très au sérieux la confidentialité de nos utilisateurs. Ici vous pouvez voir comment nous collectons, utilisons et protégeons vos données personnelles.',
    },
    '2iy4c02r': {
      'es': 'Ayuda y documentación',
      'ar': 'بيانات المستخدم',
      'de': 'Benutzerdaten',
      'en': 'User data',
      'fr': 'Données utilisateur',
    },
  },
  // ayudaprueba
  {
    'eol84uji': {
      'es': 'Preguntas Frecuentes',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '1udv6ye6': {
      'es': 'Centro de Ayuda',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '48jz9hpq': {
      'es': 'Encuentra respuestas a todas tus dudas sobre reservas deportivas',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'dwbbtdtn': {
      'es': 'olor inf',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'syitzj7n': {
      'es': 'Información General',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '9c7c1ice': {
      'es': '¿Qué deportes puedo reservar?',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'ae2jxfn6': {
      'es':
          'Ofrecemos reservas para múltiples deportes incluyendo fútbol sala, fútbol 7, baloncesto, pádel y más. Consulta la disponibilidad en cada instalación.',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'ymib8zpq': {
      'es': '¿Necesito registrarme para hacer reservas?',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'obnj6vhs': {
      'es':
          'Sí, es necesario crear una cuenta para gestionar tus reservas. El registro es gratuito y solo toma unos minutos.',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'lb09z3gp': {
      'es': 'Reservas',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'ggtawemi': {
      'es': '¿Cómo puedo hacer una reserva?',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '6we4c4j5': {
      'es':
          'Selecciona la instalación, fecha y horario deseado, y confirma tu reserva realizando el pago. Recibirás un correo de confirmación.',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'pm4ctj41': {
      'es': '¿Puedo cancelar mi reserva?',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'i14z8jw9': {
      'es':
          'Sí, puedes cancelar hasta 24 horas antes. El reembolso se realizará según nuestra política de cancelación.',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'bwpp5t6k': {
      'es': 'Pagos',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'imadfpac': {
      'es': '¿Qué métodos de pago aceptan?',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '56euchgb': {
      'es':
          'Aceptamos tarjetas de crédito/débito, PayPal y transferencia bancaria.',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'xphti7uv': {
      'es': '¿No encuentras lo que buscas?',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '2svfuw5e': {
      'es': 'Contacta con nuestro equipo de soporte',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'jg7u719n': {
      'es': 'Contactar Soporte',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
  },
  // talk
  {
    'fvkn4f84': {
      'es': 'Page Title',
      'ar': 'عنوان الصفحة',
      'de': 'Seitentitel',
      'en': 'Page Title',
      'fr': 'Titre de la page',
    },
    'lowupfw5': {
      'es': 'TextField',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'f5rj34ls': {
      'es': 'Reproducir',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'nt96gvew': {
      'es': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // pruebaboton
  {
    '9qiadij7': {
      'es': 'Ver Horarios Disponibles',
      'ar': 'انظر الجداول الزمنية المتاحة',
      'de': 'Siehe Verfügbare Zeitpläne',
      'en': 'See Available Schedules',
      'fr': 'Voir les horaires disponibles',
    },
  },
  // Miscellaneous
  {
    'co4xrqye': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'ymmbgai6': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '3fjkp56u': {
      'es': 'Porfavor, permite el acceso a tu microfono',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '3te8qp31': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'pptnlhjy': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'pjnmztiy': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'm9hg0awc': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'u2ar9wtg': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'e8zso0ou': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'kw9wj9ij': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'wifpu47s': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'c0d81myd': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'o9c8mmn7': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'l0v1zgfi': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '7gbjnda8': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'xxepznn1': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'fm3iaqtz': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'sjieonhv': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'zepc051d': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '2nq3zgzg': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'x70niej1': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'uvbtufe1': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'w72bbjqi': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '8i14cf5w': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    '6mct39sl': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'o8u25k0y': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'ashhtytt': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
    'ge8kvgb1': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
