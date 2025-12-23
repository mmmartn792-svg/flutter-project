import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cubit/locale_cubit.dart';
import 'package:projectq/cubit/theme_cubit.dart';
import 'package:projectq/generated/l10n.dart';

class LanguageSelectorScreen extends StatelessWidget {
  const LanguageSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("الرجاء اختيار لغة البرنامج "), // عنوان متعدد اللغات
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('الوضع الليلي'),
            trailing: Switch(
              // watch للاستماع إلى التغييرات وتحديث الواجهة
              value: context.watch<ThemeCubit>().state is DarkTheme,
              // read لاستدعاء دالة التبديل
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
            onTap: () {
              // لجعل ListTile بأكمله قابلاً للنقر
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).choselan,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // استدعاء دالة تغيير اللغة في الـ Cubit
                    context.read<LocaleCubit>().changeLanguage('en');
                  },
                  child: const Text('English'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<LocaleCubit>().changeLanguage('ar');
                  },
                  child: const Text('العربية'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
