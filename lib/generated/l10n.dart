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

  /// `Cansel`
  String get btnCancelText {
    return Intl.message('Cansel', name: 'btnCancelText', desc: '', args: []);
  }

  /// `Ok`
  String get btnOkText {
    return Intl.message('Ok', name: 'btnOkText', desc: '', args: []);
  }

  /// `Damascus City`
  String get damas {
    return Intl.message('Damascus City', name: 'damas', desc: '', args: []);
  }

  /// `al-Qanawt`
  String get qanawat {
    return Intl.message('al-Qanawt', name: 'qanawat', desc: '', args: []);
  }

  /// `al-meidan`
  String get medan {
    return Intl.message('al-meidan', name: 'medan', desc: '', args: []);
  }

  /// `Bab Tuma`
  String get babTuma {
    return Intl.message('Bab Tuma', name: 'babTuma', desc: '', args: []);
  }

  /// `Saroujah`
  String get sarojah {
    return Intl.message('Saroujah', name: 'sarojah', desc: '', args: []);
  }

  /// `Douma`
  String get douma {
    return Intl.message('Douma', name: 'douma', desc: '', args: []);
  }

  /// `Al-Tall`
  String get AlTall {
    return Intl.message('Al-Tall', name: 'AlTall', desc: '', args: []);
  }

  /// `Al-Qutayfah`
  String get AlQutayfah {
    return Intl.message('Al-Qutayfah', name: 'AlQutayfah', desc: '', args: []);
  }

  /// `Aleppo City`
  String get AleppoCity {
    return Intl.message('Aleppo City', name: 'AleppoCity', desc: '', args: []);
  }

  /// `Manbij`
  String get Manbij {
    return Intl.message('Manbij', name: 'Manbij', desc: '', args: []);
  }

  /// `Azaz`
  String get Azaz {
    return Intl.message('Azaz', name: 'Azaz', desc: '', args: []);
  }

  /// `Idlib City`
  String get IdlibCity {
    return Intl.message('Idlib City', name: 'IdlibCity', desc: '', args: []);
  }

  /// `Maarrat al-Nuuman`
  String get MaarratalNuuman {
    return Intl.message(
      'Maarrat al-Nuuman',
      name: 'MaarratalNuuman',
      desc: '',
      args: [],
    );
  }

  /// `Homs City`
  String get HomsCity {
    return Intl.message('Homs City', name: 'HomsCity', desc: '', args: []);
  }

  /// `Al-Rastan`
  String get AlRastan {
    return Intl.message('Al-Rastan', name: 'AlRastan', desc: '', args: []);
  }

  /// `Hama City`
  String get HamaCity {
    return Intl.message('Hama City', name: 'HamaCity', desc: '', args: []);
  }

  /// `Masyaf`
  String get Masyaf {
    return Intl.message('Masyaf', name: 'Masyaf', desc: '', args: []);
  }

  /// `Latakia City`
  String get LatakiaCity {
    return Intl.message(
      'Latakia City',
      name: 'LatakiaCity',
      desc: '',
      args: [],
    );
  }

  /// `Jableh`
  String get Jableh {
    return Intl.message('Jableh', name: 'Jableh', desc: '', args: []);
  }

  /// `Tartus City`
  String get TartusCity {
    return Intl.message('Tartus City', name: 'TartusCity', desc: '', args: []);
  }

  /// `Baniyas`
  String get Baniyas {
    return Intl.message('Baniyas', name: 'Baniyas', desc: '', args: []);
  }

  /// `Deir ez-Zor City`
  String get DeirezZorCity {
    return Intl.message(
      'Deir ez-Zor City',
      name: 'DeirezZorCity',
      desc: '',
      args: [],
    );
  }

  /// `Al-Mayadin`
  String get AlMayadin {
    return Intl.message('Al-Mayadin', name: 'AlMayadin', desc: '', args: []);
  }

  /// `Raqqa City`
  String get RaqqaCity {
    return Intl.message('Raqqa City', name: 'RaqqaCity', desc: '', args: []);
  }

  /// `Al-Thawrah`
  String get AlThawrah {
    return Intl.message('Al-Thawrah', name: 'AlThawrah', desc: '', args: []);
  }

  /// `Price ($)`
  String get laprice {
    return Intl.message('Price (\$)', name: 'laprice', desc: '', args: []);
  }

  /// `please Enter price`
  String get validatorpric {
    return Intl.message(
      'please Enter price',
      name: 'validatorpric',
      desc: '',
      args: [],
    );
  }

  /// `Add Apartment`
  String get Addtitl {
    return Intl.message('Add Apartment', name: 'Addtitl', desc: '', args: []);
  }

  /// `Add Photos`
  String get AddPhotos {
    return Intl.message('Add Photos', name: 'AddPhotos', desc: '', args: []);
  }

  /// `Photo Picker Placeholder`
  String get ADDphoto {
    return Intl.message(
      'Photo Picker Placeholder',
      name: 'ADDphoto',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `please enter city`
  String get validatorcity {
    return Intl.message(
      'please enter city',
      name: 'validatorcity',
      desc: '',
      args: [],
    );
  }

  /// ` please Enter area`
  String get validatorarea {
    return Intl.message(
      ' please Enter area',
      name: 'validatorarea',
      desc: '',
      args: [],
    );
  }

  /// `WiFi`
  String get WiFi {
    return Intl.message('WiFi', name: 'WiFi', desc: '', args: []);
  }

  /// `Air Conditioning`
  String get AirConditioning {
    return Intl.message(
      'Air Conditioning',
      name: 'AirConditioning',
      desc: '',
      args: [],
    );
  }

  /// `Swimming Pool`
  String get SwimmingPool {
    return Intl.message(
      'Swimming Pool',
      name: 'SwimmingPool',
      desc: '',
      args: [],
    );
  }

  /// `Gym`
  String get Gym {
    return Intl.message('Gym', name: 'Gym', desc: '', args: []);
  }

  /// `Parking`
  String get Parking {
    return Intl.message('Parking', name: 'Parking', desc: '', args: []);
  }

  /// `Pet Friendly`
  String get PetFriendly {
    return Intl.message(
      'Pet Friendly',
      name: 'PetFriendly',
      desc: '',
      args: [],
    );
  }

  /// `Breakfast Included`
  String get BreakfastIncluded {
    return Intl.message(
      'Breakfast Included',
      name: 'BreakfastIncluded',
      desc: '',
      args: [],
    );
  }

  /// `Airport Shuttle`
  String get AirportShuttle {
    return Intl.message(
      'Airport Shuttle',
      name: 'AirportShuttle',
      desc: '',
      args: [],
    );
  }

  /// `Spa`
  String get Spa {
    return Intl.message('Spa', name: 'Spa', desc: '', args: []);
  }

  /// `Restaurant`
  String get Restaurant {
    return Intl.message('Restaurant', name: 'Restaurant', desc: '', args: []);
  }

  /// `Bar`
  String get Bar {
    return Intl.message('Bar', name: 'Bar', desc: '', args: []);
  }

  /// `Laundry Service`
  String get LaundryService {
    return Intl.message(
      'Laundry Service',
      name: 'LaundryService',
      desc: '',
      args: [],
    );
  }

  /// `Room Service`
  String get RoomService {
    return Intl.message(
      'Room Service',
      name: 'RoomService',
      desc: '',
      args: [],
    );
  }

  /// `24-Hour Front Desk`
  String get HourFrontDesk {
    return Intl.message(
      '24-Hour Front Desk',
      name: 'HourFrontDesk',
      desc: '',
      args: [],
    );
  }

  /// `Business Center`
  String get BusinessCenter {
    return Intl.message(
      'Business Center',
      name: 'BusinessCenter',
      desc: '',
      args: [],
    );
  }

  /// `Conference Rooms`
  String get ConferenceRooms {
    return Intl.message(
      'Conference Rooms',
      name: 'ConferenceRooms',
      desc: '',
      args: [],
    );
  }

  /// `please Enter title`
  String get tit {
    return Intl.message('please Enter title', name: 'tit', desc: '', args: []);
  }

  /// `please Enter description`
  String get dest {
    return Intl.message(
      'please Enter description',
      name: 'dest',
      desc: '',
      args: [],
    );
  }

  /// `type of rental`
  String get typeapar {
    return Intl.message('type of rental', name: 'typeapar', desc: '', args: []);
  }

  /// `daily`
  String get daily {
    return Intl.message('daily', name: 'daily', desc: '', args: []);
  }

  /// `monthly`
  String get monthly {
    return Intl.message('monthly', name: 'monthly', desc: '', args: []);
  }

  /// `yearly`
  String get yearly {
    return Intl.message('yearly', name: 'yearly', desc: '', args: []);
  }

  /// `Target segment`
  String get hiiiii {
    return Intl.message('Target segment', name: 'hiiiii', desc: '', args: []);
  }

  /// `family`
  String get family {
    return Intl.message('family', name: 'family', desc: '', args: []);
  }

  /// `single`
  String get single {
    return Intl.message('single', name: 'single', desc: '', args: []);
  }

  /// `students`
  String get students {
    return Intl.message('students', name: 'students', desc: '', args: []);
  }

  /// `employees`
  String get employees {
    return Intl.message('employees', name: 'employees', desc: '', args: []);
  }

  /// `select the floor`
  String get floor {
    return Intl.message('select the floor', name: 'floor', desc: '', args: []);
  }

  /// `land`
  String get land {
    return Intl.message('land', name: 'land', desc: '', args: []);
  }

  /// ` first`
  String get first {
    return Intl.message(' first', name: 'first', desc: '', args: []);
  }

  /// `second `
  String get second {
    return Intl.message('second ', name: 'second', desc: '', args: []);
  }

  /// ` third`
  String get third {
    return Intl.message(' third', name: 'third', desc: '', args: []);
  }

  /// `fourth  `
  String get fourth {
    return Intl.message('fourth  ', name: 'fourth', desc: '', args: []);
  }

  /// ` fifth`
  String get fifth {
    return Intl.message(' fifth', name: 'fifth', desc: '', args: []);
  }

  /// `Enter number rooms`
  String get nroom {
    return Intl.message(
      'Enter number rooms',
      name: 'nroom',
      desc: '',
      args: [],
    );
  }

  /// `one room`
  String get room1 {
    return Intl.message('one room', name: 'room1', desc: '', args: []);
  }

  /// `two room`
  String get room2 {
    return Intl.message('two room', name: 'room2', desc: '', args: []);
  }

  /// `three room`
  String get room3 {
    return Intl.message('three room', name: 'room3', desc: '', args: []);
  }

  /// `four room`
  String get room4 {
    return Intl.message('four room', name: 'room4', desc: '', args: []);
  }

  /// `fife room`
  String get room5 {
    return Intl.message('fife room', name: 'room5', desc: '', args: []);
  }

  /// `Eroor`
  String get Eroor {
    return Intl.message('Eroor', name: 'Eroor', desc: '', args: []);
  }

  /// `please Enter allAmenities`
  String get des {
    return Intl.message(
      'please Enter allAmenities',
      name: 'des',
      desc: '',
      args: [],
    );
  }

  /// `please Enter images Apartment`
  String get des2 {
    return Intl.message(
      'please Enter images Apartment',
      name: 'des2',
      desc: '',
      args: [],
    );
  }

  /// `Select available services`
  String get amanty {
    return Intl.message(
      'Select available services',
      name: 'amanty',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get Booking {
    return Intl.message('Booking', name: 'Booking', desc: '', args: []);
  }

  /// `ُEnter Date Start Booking Date `
  String get date1 {
    return Intl.message(
      'ُEnter Date Start Booking Date ',
      name: 'date1',
      desc: '',
      args: [],
    );
  }

  /// `Enter Date End Booking date`
  String get date2 {
    return Intl.message(
      'Enter Date End Booking date',
      name: 'date2',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get book {
    return Intl.message('Booking', name: 'book', desc: '', args: []);
  }

  /// `Dark Mode`
  String get dark {
    return Intl.message('Dark Mode', name: 'dark', desc: '', args: []);
  }

  /// `please create renter Account`
  String get rent {
    return Intl.message(
      'please create renter Account',
      name: 'rent',
      desc: '',
      args: [],
    );
  }

  /// `About this place`
  String get About {
    return Intl.message('About this place', name: 'About', desc: '', args: []);
  }

  /// `Beautiful modern apartment in the heart of`
  String get About1 {
    return Intl.message(
      'Beautiful modern apartment in the heart of',
      name: 'About1',
      desc: '',
      args: [],
    );
  }

  /// `Features stunning city views, high-end finishes, and easy access to top restaurants and attractions.`
  String get About2 {
    return Intl.message(
      'Features stunning city views, high-end finishes, and easy access to top restaurants and attractions.',
      name: 'About2',
      desc: '',
      args: [],
    );
  }

  /// ` Genral Information`
  String get public {
    return Intl.message(
      ' Genral Information',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `number apartment : #`
  String get numberapa {
    return Intl.message(
      'number apartment : #',
      name: 'numberapa',
      desc: '',
      args: [],
    );
  }

  /// `What does this place offer`
  String get whatAmen {
    return Intl.message(
      'What does this place offer',
      name: 'whatAmen',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get rever {
    return Intl.message('Reviews', name: 'rever', desc: '', args: []);
  }

  /// `View All`
  String get All {
    return Intl.message('View All', name: 'All', desc: '', args: []);
  }

  /// `Booking Now`
  String get bookNow {
    return Intl.message('Booking Now', name: 'bookNow', desc: '', args: []);
  }

  /// `Michael Chen`
  String get name {
    return Intl.message('Michael Chen', name: 'name', desc: '', args: []);
  }

  /// ` Amazing apartment! Clean, modern, and perfectly located. Sarah was a wonderful host and very responsive. Highly recommend!`
  String get text {
    return Intl.message(
      ' Amazing apartment! Clean, modern, and perfectly located. Sarah was a wonderful host and very responsive. Highly recommend!',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `December 2024`
  String get date11 {
    return Intl.message('December 2024', name: 'date11', desc: '', args: []);
  }

  /// `Damascus`
  String get Damascus {
    return Intl.message('Damascus', name: 'Damascus', desc: '', args: []);
  }

  /// `Rif Dimashq`
  String get RifDimashq {
    return Intl.message('Rif Dimashq', name: 'RifDimashq', desc: '', args: []);
  }

  /// `Aleppo`
  String get Aleppo {
    return Intl.message('Aleppo', name: 'Aleppo', desc: '', args: []);
  }

  /// `Idlib`
  String get Idlib {
    return Intl.message('Idlib', name: 'Idlib', desc: '', args: []);
  }

  /// `Homs`
  String get Homs {
    return Intl.message('Homs', name: 'Homs', desc: '', args: []);
  }

  /// `Hama`
  String get Hama {
    return Intl.message('Hama', name: 'Hama', desc: '', args: []);
  }

  /// `Latakia`
  String get Latakia {
    return Intl.message('Latakia', name: 'Latakia', desc: '', args: []);
  }

  /// `Tartus`
  String get Tartus {
    return Intl.message('Tartus', name: 'Tartus', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Deir ez-Zor`
  String get DeirezZor {
    return Intl.message('Deir ez-Zor', name: 'DeirezZor', desc: '', args: []);
  }

  /// `Raqqa`
  String get Raqqa {
    return Intl.message('Raqqa', name: 'Raqqa', desc: '', args: []);
  }

  /// `Al-Hasakah`
  String get AlHasakah {
    return Intl.message('Al-Hasakah', name: 'AlHasakah', desc: '', args: []);
  }

  /// `Notification details`
  String get details {
    return Intl.message(
      'Notification details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Daraa`
  String get Daraa {
    return Intl.message('Daraa', name: 'Daraa', desc: '', args: []);
  }

  /// `ended`
  String get end {
    return Intl.message('ended', name: 'end', desc: '', args: []);
  }

  /// `As-Suwayda`
  String get AsSuwayda {
    return Intl.message('As-Suwayda', name: 'AsSuwayda', desc: '', args: []);
  }

  /// `Quneitra`
  String get Quneitra {
    return Intl.message('Quneitra', name: 'Quneitra', desc: '', args: []);
  }

  /// `My Bookings`
  String get Bookings {
    return Intl.message('My Bookings', name: 'Bookings', desc: '', args: []);
  }

  /// `please Enter DAte correctly`
  String get invalidDateRange {
    return Intl.message(
      'please Enter DAte correctly',
      name: 'invalidDateRange',
      desc: '',
      args: [],
    );
  }

  /// `Try again `
  String get refresh {
    return Intl.message('Try again ', name: 'refresh', desc: '', args: []);
  }

  /// `My Bookings`
  String get MyBookings {
    return Intl.message('My Bookings', name: 'MyBookings', desc: '', args: []);
  }

  /// `No reservations currently available`
  String get noBookings {
    return Intl.message(
      'No reservations currently available',
      name: 'noBookings',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during loading `
  String get errorinBookings {
    return Intl.message(
      'An error occurred during loading ',
      name: 'errorinBookings',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get again {
    return Intl.message('Try again', name: 'again', desc: '', args: []);
  }

  /// `loading Bookings`
  String get loading {
    return Intl.message(
      'loading Bookings',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// ` Confirm Cancellation`
  String get confirmcancel {
    return Intl.message(
      ' Confirm Cancellation',
      name: 'confirmcancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure about cancelling the reservation?`
  String get confirmtt {
    return Intl.message(
      'Are you sure about cancelling the reservation?',
      name: 'confirmtt',
      desc: '',
      args: [],
    );
  }

  /// `backed`
  String get backed {
    return Intl.message('backed', name: 'backed', desc: '', args: []);
  }

  /// `Cancel Bookings`
  String get canceleBookings {
    return Intl.message(
      'Cancel Bookings',
      name: 'canceleBookings',
      desc: '',
      args: [],
    );
  }

  /// `Change Booking date`
  String get modifyDate {
    return Intl.message(
      'Change Booking date',
      name: 'modifyDate',
      desc: '',
      args: [],
    );
  }

  /// `My Apartments`
  String get myApartments {
    return Intl.message(
      'My Apartments',
      name: 'myApartments',
      desc: '',
      args: [],
    );
  }

  /// `You have no Apartments`
  String get noApartments {
    return Intl.message(
      'You have no Apartments',
      name: 'noApartments',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred in loading the apartments`
  String get eror {
    return Intl.message(
      'An error occurred in loading the apartments',
      name: 'eror',
      desc: '',
      args: [],
    );
  }

  /// `Apartments are being  loaded `
  String get loadings {
    return Intl.message(
      'Apartments are being  loaded ',
      name: 'loadings',
      desc: '',
      args: [],
    );
  }

  /// `Aproved`
  String get aproved {
    return Intl.message('Aproved', name: 'aproved', desc: '', args: []);
  }

  /// `Witing`
  String get inWiting {
    return Intl.message('Witing', name: 'inWiting', desc: '', args: []);
  }

  /// `Disapproved`
  String get disapproved {
    return Intl.message('Disapproved', name: 'disapproved', desc: '', args: []);
  }

  /// `Bookings for this apartment`
  String get bookingsForApartment {
    return Intl.message(
      'Bookings for this apartment',
      name: 'bookingsForApartment',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get ok {
    return Intl.message('Agree', name: 'ok', desc: '', args: []);
  }

  /// `Disagree`
  String get disagree {
    return Intl.message('Disagree', name: 'disagree', desc: '', args: []);
  }

  /// `The end date must be before the start date`
  String get val {
    return Intl.message(
      'The end date must be before the start date',
      name: 'val',
      desc: '',
      args: [],
    );
  }

  /// `the start date must be different the end date `
  String get val2 {
    return Intl.message(
      'the start date must be different the end date ',
      name: 'val2',
      desc: '',
      args: [],
    );
  }

  /// `Booking Waiting `
  String get bookingsw {
    return Intl.message(
      'Booking Waiting ',
      name: 'bookingsw',
      desc: '',
      args: [],
    );
  }

  /// ` Your reservation has been successfully confirmed. You'll receive a confirmation email shortly with all the details.`
  String get messagNot {
    return Intl.message(
      ' Your reservation has been successfully confirmed. You\'ll receive a confirmation email shortly with all the details.',
      name: 'messagNot',
      desc: '',
      args: [],
    );
  }

  /// `Booking Details`
  String get detailbooking {
    return Intl.message(
      'Booking Details',
      name: 'detailbooking',
      desc: '',
      args: [],
    );
  }

  /// `Property`
  String get Property {
    return Intl.message('Property', name: 'Property', desc: '', args: []);
  }

  /// `Dates`
  String get Dates {
    return Intl.message('Dates', name: 'Dates', desc: '', args: []);
  }

  /// `Total Paid`
  String get total {
    return Intl.message('Total Paid', name: 'total', desc: '', args: []);
  }

  /// `View Bookings`
  String get View {
    return Intl.message('View Bookings', name: 'View', desc: '', args: []);
  }

  /// `Back to Home`
  String get backHome {
    return Intl.message('Back to Home', name: 'backHome', desc: '', args: []);
  }

  /// `Apartment filtering`
  String get filterapr {
    return Intl.message(
      'Apartment filtering',
      name: 'filterapr',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message('Province', name: 'province', desc: '', args: []);
  }

  /// `area`
  String get area {
    return Intl.message('area', name: 'area', desc: '', args: []);
  }

  /// `Search`
  String get searche {
    return Intl.message('Search', name: 'searche', desc: '', args: []);
  }

  /// `Specify the required specifications`
  String get ennter {
    return Intl.message(
      'Specify the required specifications',
      name: 'ennter',
      desc: '',
      args: [],
    );
  }

  /// `en`
  String get ar {
    return Intl.message('en', name: 'ar', desc: '', args: []);
  }

  /// `Now`
  String get now {
    return Intl.message('Now', name: 'now', desc: '', args: []);
  }

  /// `Minute`
  String get minute {
    return Intl.message('Minute', name: 'minute', desc: '', args: []);
  }

  /// `Hour`
  String get hour {
    return Intl.message('Hour', name: 'hour', desc: '', args: []);
  }

  /// `Day`
  String get day {
    return Intl.message('Day', name: 'day', desc: '', args: []);
  }

  /// `No Notification`
  String get noNotification {
    return Intl.message(
      'No Notification',
      name: 'noNotification',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get Alll {
    return Intl.message('All', name: 'Alll', desc: '', args: []);
  }

  /// `Not Read`
  String get notread {
    return Intl.message('Not Read', name: 'notread', desc: '', args: []);
  }

  /// `An error occurred while fetching notifications .`
  String get err {
    return Intl.message(
      'An error occurred while fetching notifications .',
      name: 'err',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message('message', name: 'message', desc: '', args: []);
  }

  /// `New Status`
  String get newstate {
    return Intl.message('New Status', name: 'newstate', desc: '', args: []);
  }

  /// `Rating Apartment`
  String get RAting {
    return Intl.message('Rating Apartment', name: 'RAting', desc: '', args: []);
  }

  /// `How would you rate this apartment?`
  String get Stars {
    return Intl.message(
      'How would you rate this apartment?',
      name: 'Stars',
      desc: '',
      args: [],
    );
  }

  /// `Write your comment:`
  String get write {
    return Intl.message(
      'Write your comment:',
      name: 'write',
      desc: '',
      args: [],
    );
  }

  /// `....Write your opinion for apartment `
  String get opinion {
    return Intl.message(
      '....Write your opinion for apartment ',
      name: 'opinion',
      desc: '',
      args: [],
    );
  }

  /// `please enter comment`
  String get comment {
    return Intl.message(
      'please enter comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Send Comment`
  String get SendComent {
    return Intl.message('Send Comment', name: 'SendComent', desc: '', args: []);
  }

  /// `what say people`
  String get whatPeopleSay {
    return Intl.message(
      'what say people',
      name: 'whatPeopleSay',
      desc: '',
      args: [],
    );
  }

  /// `based On Experiences`
  String get basedOn {
    return Intl.message(
      'based On Experiences',
      name: 'basedOn',
      desc: '',
      args: [],
    );
  }

  /// `Number reviews`
  String get reviews {
    return Intl.message('Number reviews', name: 'reviews', desc: '', args: []);
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
