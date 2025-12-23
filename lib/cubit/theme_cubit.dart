import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightTheme()) {
    // عند إنشاء الـ Cubit، تحقق من الوضع المحفوظ
    _getSavedTheme();
  }

  // دالة للتبديل بين الوضعين
  void toggleTheme() {
    if (state is LightTheme) {
      _saveTheme(true); // true للوضع الداكن
      emit(DarkTheme());
    } else {
      _saveTheme(false); // false للوضع الفاتح
      emit(LightTheme());
    }
  }

  // دالة لحفظ الوضع في التخزين المحلي
  void _saveTheme(bool isDark) {
    CacheHelper().saveData(key: 'isDarkMode', value: isDark);
  }

  // دالة لجلب الوضع المحفوظ عند بدء التطبيق
  void _getSavedTheme() {
    final isDark = CacheHelper().getData(key: 'isDarkMode') ?? false;
    if (isDark) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
  }
}
