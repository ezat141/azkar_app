import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

//part 'locale_state.dart';

// class LocaleCubit extends Cubit<LocaleState> {
//   LocaleCubit() : super(LocaleInitial());
// }
enum LocaleEvent { toggle }

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ar'));

  void changeLocale(Locale locale) {
    emit(locale);
  }
}
