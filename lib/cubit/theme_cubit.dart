import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightTheme()) {
    _getSavedTheme();
  }

  void toggleTheme() {
    if (state is LightTheme) {
      _saveTheme(true);
      emit(DarkTheme());
    } else {
      _saveTheme(false);
      emit(LightTheme());
    }
  }

  void _saveTheme(bool isDark) {
    CacheHelper().saveData(key: 'isDarkMode', value: isDark);
  }

  void _getSavedTheme() {
    final isDark = CacheHelper().getData(key: 'isDarkMode') ?? false;
    if (isDark) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
  }
}
