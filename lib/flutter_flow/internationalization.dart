import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'pt'];

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
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? ptText = '',
  }) =>
      [enText, esText, frText, ptText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'zodojtki': {
      'en': 'Home',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
  // LoginPage
  {
    'nfodd4fv': {
      'en': 'Home',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
  // SignUpPage
  {
    'zt63pj6z': {
      'en': 'Home',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
  // OnboardingInitialPage
  {
    'zjtrnvmq': {
      'en': 'Home',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    'jmx2csrh': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'zsfhaavr': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'my45081b': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '0iukf8qj': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'x09of2a4': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '9j6zzo8b': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '47rvnhdx': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'j66niuhv': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'oeyws0t5': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'yusyb3oh': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'qvtg1u0o': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '6tpo8fe6': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'pndqyrho': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'f7p6juqc': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'c8key2eg': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'cvoiawwq': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '8nmx35yh': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '5hh46brv': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'tdt7qpuk': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'lfzr61l6': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'pmul3lgy': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '17l76ge4': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'y87zvqxo': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    'lkg5ufoh': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
    '4dpf36j9': {
      'en': '',
      'es': '',
      'fr': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
