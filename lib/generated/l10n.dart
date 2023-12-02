// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Azkar`
  String get azkar {
    return Intl.message(
      'Azkar',
      name: 'azkar',
      desc: '',
      args: [],
    );
  }

  /// `Morning Azkar`
  String get morningAzkar {
    return Intl.message(
      'Morning Azkar',
      name: 'morningAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Evening Azkar`
  String get eveningAzkar {
    return Intl.message(
      'Evening Azkar',
      name: 'eveningAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Azkar`
  String get prayerAzkar {
    return Intl.message(
      'Prayer Azkar',
      name: 'prayerAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Sleep Azkar`
  String get sleepAzkar {
    return Intl.message(
      'Sleep Azkar',
      name: 'sleepAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Various Azkar`
  String get variousAzkar {
    return Intl.message(
      'Various Azkar',
      name: 'variousAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Night prayer Azkar`
  String get nightPrayerAzkar {
    return Intl.message(
      'Night prayer Azkar',
      name: 'nightPrayerAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Electronic rosary`
  String get electronicRosary {
    return Intl.message(
      'Electronic rosary',
      name: 'electronicRosary',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message(
      'Fajr',
      name: 'fajr',
      desc: '',
      args: [],
    );
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message(
      'Dhuhr',
      name: 'dhuhr',
      desc: '',
      args: [],
    );
  }

  /// `Asr`
  String get asr {
    return Intl.message(
      'Asr',
      name: 'asr',
      desc: '',
      args: [],
    );
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message(
      'Maghrib',
      name: 'maghrib',
      desc: '',
      args: [],
    );
  }

  /// `Isha`
  String get isha {
    return Intl.message(
      'Isha',
      name: 'isha',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
