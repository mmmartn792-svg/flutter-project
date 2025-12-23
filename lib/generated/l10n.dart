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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get titleLogin {
    return Intl.message('Sign In', name: 'titleLogin', desc: '', args: []);
  }

  /// `Enter the phone number associated with your account`
  String get title2login {
    return Intl.message(
      'Enter the phone number associated with your account',
      name: 'title2login',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get validate1 {
    return Intl.message(
      'Please enter phone number',
      name: 'validate1',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Please enter password`
  String get validate2 {
    return Intl.message(
      'Please enter password',
      name: 'validate2',
      desc: '',
      args: [],
    );
  }

  /// `Or get a `
  String get newAccountget {
    return Intl.message('Or get a ', name: 'newAccountget', desc: '', args: []);
  }

  /// `new account`
  String get newAccount {
    return Intl.message('new account', name: 'newAccount', desc: '', args: []);
  }

  /// `Create New Account`
  String get createAccount {
    return Intl.message(
      'Create New Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get name1 {
    return Intl.message('First Name', name: 'name1', desc: '', args: []);
  }

  /// `Last Name`
  String get name2 {
    return Intl.message('Last Name', name: 'name2', desc: '', args: []);
  }

  /// `Please Enter First Name`
  String get validateFirstName {
    return Intl.message(
      'Please Enter First Name',
      name: 'validateFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Last Name`
  String get validateSecondName {
    return Intl.message(
      'Please Enter Last Name',
      name: 'validateSecondName',
      desc: '',
      args: [],
    );
  }

  /// `phoneNumber`
  String get phoneNumber {
    return Intl.message('phoneNumber', name: 'phoneNumber', desc: '', args: []);
  }

  /// `Please Enter PhoneNumber `
  String get validatephone {
    return Intl.message(
      'Please Enter PhoneNumber ',
      name: 'validatephone',
      desc: '',
      args: [],
    );
  }

  /// ` confirmpassword`
  String get confirmpassword {
    return Intl.message(
      ' confirmpassword',
      name: 'confirmpassword',
      desc: '',
      args: [],
    );
  }

  /// `Please confirmpassword`
  String get Validateconfirmpass {
    return Intl.message(
      'Please confirmpassword',
      name: 'Validateconfirmpass',
      desc: '',
      args: [],
    );
  }

  /// `Enter date Birthday`
  String get date {
    return Intl.message(
      'Enter date Birthday',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter dateBirthday`
  String get validateDAte {
    return Intl.message(
      'Please Enter dateBirthday',
      name: 'validateDAte',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter role `
  String get renterOrOwner {
    return Intl.message(
      'Please Enter role ',
      name: 'renterOrOwner',
      desc: '',
      args: [],
    );
  }

  /// `renter`
  String get renter {
    return Intl.message('renter', name: 'renter', desc: '', args: []);
  }

  /// `owner`
  String get owner {
    return Intl.message('owner', name: 'owner', desc: '', args: []);
  }

  /// `Please Enter your Role`
  String get validateRole {
    return Intl.message(
      'Please Enter your Role',
      name: 'validateRole',
      desc: '',
      args: [],
    );
  }

  /// `Enter Personal photo`
  String get enterYourImage {
    return Intl.message(
      'Enter Personal photo',
      name: 'enterYourImage',
      desc: '',
      args: [],
    );
  }

  /// `Enter Personal photo ID`
  String get imagId {
    return Intl.message(
      'Enter Personal photo ID',
      name: 'imagId',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Please upload the required images `
  String get dec {
    return Intl.message(
      'Please upload the required images ',
      name: 'dec',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAcount {
    return Intl.message(
      'Create account',
      name: 'createAcount',
      desc: '',
      args: [],
    );
  }

  /// `The Apartments were Successfully loaded`
  String get getApartment {
    return Intl.message(
      'The Apartments were Successfully loaded',
      name: 'getApartment',
      desc: '',
      args: [],
    );
  }

  /// `HomePage`
  String get homePage {
    return Intl.message('HomePage', name: 'homePage', desc: '', args: []);
  }

  /// `Log out`
  String get awesaTitle {
    return Intl.message('Log out', name: 'awesaTitle', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get awsdec {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'awsdec',
      desc: '',
      args: [],
    );
  }

  /// `There apartments to display`
  String get noApartment {
    return Intl.message(
      'There apartments to display',
      name: 'noApartment',
      desc: '',
      args: [],
    );
  }

  /// `please select a language`
  String get choselan {
    return Intl.message(
      'please select a language',
      name: 'choselan',
      desc: '',
      args: [],
    );
  }

  /// `language and darke Mode`
  String get darkAndLang {
    return Intl.message(
      'language and darke Mode',
      name: 'darkAndLang',
      desc: '',
      args: [],
    );
  }

  /// `please create Owner's account`
  String get masenger {
    return Intl.message(
      'please create Owner`s account',
      name: 'masenger',
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
