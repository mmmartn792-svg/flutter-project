import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projectq/Apptheme.dart';
import 'package:projectq/auth/login_screen.dart';
import 'package:projectq/auth/signup_screen.dart';
import 'package:projectq/auth/splash_screen.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/dio_consumer.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/locale_cubit.dart';
import 'package:projectq/cubit/theme_cubit.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/repositories/user_repository.dart';
import 'package:projectq/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // PushNotificationservice.inite();
  await CacheHelper().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
        ),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, LocaleState) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              locale: LocaleState.locale,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en'), Locale('ar')],
              darkTheme: AppTheme.darkTheme,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: state is DarkTheme ? ThemeMode.dark : ThemeMode.light,
              home: CacheHelper().getData(key: ApiKey.token) != null
                  ? Home(role: CacheHelper().getData(key: ApiKey.role))
                  : SplashScreen(),
              routes: {
                '/login': (context) => LoginScreen(),
                '/signup': (context) => SignupScreen(),
              },
            );
          },
        );
      },
    );
  }
}
// 