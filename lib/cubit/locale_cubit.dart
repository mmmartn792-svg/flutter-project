import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projectq/cache/cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('ar'))) {
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final String savedLanguageCode = CacheHelper().getData(key: 'lang') ?? 'ar';

    emit(LocaleState(Locale(savedLanguageCode)));
  }

  void changeLanguage(String languageCode) {
    CacheHelper().saveData(key: 'lang', value: languageCode);

    emit(LocaleState(Locale(languageCode)));
  }
}
