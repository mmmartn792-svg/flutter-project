import 'package:image_picker/image_picker.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:projectq/core/errors/error_model.dart';
import 'package:projectq/models/AddRating.dart';
import 'package:projectq/models/AllBookingOwnerModele.dart';
import 'package:projectq/models/AllBookingsModel.dart';
import 'package:projectq/models/Booking%20Model.dart';
import 'package:projectq/models/NotificationGetAll.dart';
import 'package:projectq/models/aproveModifyowner.dart';
import 'package:projectq/models/favoritesModel.dart';
import 'package:projectq/models/isFavoritesModel.dart';
import 'package:projectq/models/modifyBooking.dart';
import 'package:projectq/models/notificationnotread.dart';
import 'package:projectq/models/showAllApartment_model.dart';
import 'package:projectq/models/showAllRatingForApartment.dart';

import 'package:projectq/models/sign_in_model.dart';
import 'package:projectq/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository;

  ///sign Up
  String? phoneController;
  void setPhoneController(String phone) {
    phoneController = phone;
  }

  String? passwordController;
  void setPasswordController(String password) {
    passwordController = password;
  }

  String? confirmPasswordController;
  void setConfirmPasswordController(String password) {
    confirmPasswordController = password;
  }

  String? firstName;
  void setFirstName(String name) {
    firstName = name;
  }

  String? secondName;
  void setSecondName(String name) {
    secondName = name;
  }

  String? dateController;
  void setDateController(String date) {
    dateController = date;
  }

  XFile? fileP;
  XFile? fileId;
  //////////////////////         sign Up

  String? phoneControllerlogin;
  void setPhoneControllerlogin(String phone) {
    phoneControllerlogin = phone;
  }

  String? passwordControllerlogin;
  void setPasswordControllerlogin(String password) {
    passwordControllerlogin = password;
  }

  String? role;
  void setRole(String userRole) {
    role = userRole;
  }

  ////////login
  ///
  SignInModel? user;

  void uplodpersonalfile(XFile image) {
    fileP = image;
  }

  void uplodIdfile(XFile image) {
    fileId = image;
  }

  ///////////////////////////////////////////////////////////////sign In
  Future<void> signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      phone: phoneControllerlogin!,
      password: passwordControllerlogin!,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess(message: signInModel.message)),
    );
  }

  ///////////////////////////////////////////////////////////////////////////sign Up
  Future<void> signUp() async {
    emit(signupLoading());

    final response = await userRepository.signUp(
      firstName: firstName!,
      phone: phoneController!,
      secondName: secondName!,
      password: passwordController!,
      confirmPassword: confirmPasswordController!,
      imgPersonal: fileP!,
      imgID: fileId!,
      dateOfBirthday: dateController!,
      role: role!,
    );
    response.fold(
      (errMessage) => emit(signupFailuer(errorMessage: errMessage)),
      (signUpModel) => emit(signupSucces(message: signUpModel.message)),
    );
  }
  ///////////////////////////////////////////////////////////////////////////sign up

  ///////////////////////////////////////////// logout
  Future<void> logout() async {
    emit(LogoutLoading());
    final response = await userRepository.logout();
    response.fold(
      (errMessage) => emit(LogoutFailure(errMessage: errMessage)),
      (logoutModel) => emit(LogoutSuccess(message: logoutModel.message)),
    );
  }
  /////////////////////////////////////////////////////////////////////////////////logout

  ////////////////////////////////////////////////////// add apartment
  int? cityid;
  void setCityid(int c) {
    cityid = c;
  }

  String? title; //
  void setTitle(String t) {
    title = t;
  }

  String? description; //
  void setDescription(String d) {
    description = d;
  }

  String? price; //
  void setPrice(String p) {
    price = p;
  }

  String? floor; //
  void setFloor(String f) {
    floor = f;
  }

  int? area; //
  void setArea(int a) {
    area = a;
  }

  List<XFile>? img;
  void setImages(List<XFile> images) {
    // تحديث الحالة بقائمة من الصور
    img = images;
  }

  String? rentType; //
  void setRentType(String r) {
    rentType = r;
  }

  String? categoryOfRentType; //
  void setCategoryOfRentType(String c) {
    categoryOfRentType = c;
  }

  List<int>? amenities;
  void setAmenities(List<int> a) {
    amenities = a;
  }

  List<String>? phones; //
  void setPhones(List<String> p) {
    phones = p;
  }

  // void setPrice_type(String pt) {
  //   price_type = pt;
  // }
  int? rooms_number;
  void setRooms_number(int rn) {
    rooms_number = rn;
  }

  Future<void> addApartment() async {
    emit(AddApartmentLoading());

    final response = await userRepository.addApartment(
      amenities: amenities!,
      cityId: cityid!,
      title: title!,

      price: price ?? '0',
      floor: floor!,
      area: area ?? 0,
      images: img!,
      rentType: rentType!,
      categoryOfRentType: categoryOfRentType!,

      rooms_number: rooms_number!,
    );
    response.fold(
      (errMessage) => emit(AddApartmentFailure(errorMessage: errMessage)),
      (addapartmentmodele) =>
          emit(AddApartmentSuccess(message: addapartmentmodele.message)),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////// add apartment

  ///////////////////////////////////////////////////// get all apartment

  Future<void> getAllapartment() async {
    emit(GetAllApartmentLoading());
    final response = await userRepository.getAllApartment();

    response.fold(
      (errMessage) {
        emit(GetAllApartmentFailure(errorMessage: errMessage));
      },

      (apartmentList) =>
          emit(GetAllApartmentSuccess(apartments: apartmentList)),
    );
  }

  int? province;
  void setprovince(int a) {
    province = a;
  }

  int? city;
  void setcity(int x) {
    city = x;
  }

  double? price1;
  void setpric1(double xprice1) {
    price1 = xprice1;
  }

  //////////////////////////////////////////////////////////////////////////////////Filter
  Future<void> Filters() async {
    emit(FilterLoading());

    final response = await userRepository.Filters(
      city: city,

      price: price1,

      area: area,
      province: province,
    );
    response.fold(
      (errMessage) => emit(FilterFailure(errMessage: errMessage)),
      (apartmentList) => emit(FilterSuccess(apartments: apartmentList)),
    );
  }

  //////////////////////////////////////////////////////////////////////////////////////////////
  int? id;
  void setId(int x) {
    id = x;
  }

  String? startDat;
  void setStartdat(String s) {
    startDat = s;
  }

  String? endD;
  void setEnddat(String e) {
    endD = e;
  }

  /////////////////////////////////////////////////////////////Booking
  Future<void> BookingApartment() async {
    emit(BookingLoading());

    final response = await userRepository.bookApartment(
      apartmentId: id!,
      endDate: endD!,
      startDate: startDat!,
    );
    response.fold(
      (errMessage) => emit(BookingFailure(errMessage: errMessage)),
      (bookApartment) => emit(BookingSuccess(bookingResponse: bookApartment)),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////All Booking
  Future<void> AllBookings() async {
    emit(AllBookingLoading());
    final response = await userRepository.Allbookings();

    response.fold(
      (errMessage) {
        emit(AllBookingFailure(errMessage: errMessage));
      },

      (bookingResponse) =>
          emit(AllBookingSuccess(bookingResponse: bookingResponse)),
    );
  }
  ///////////////////////////////////////////////////////////////////////////////////////////cancel

  Future<void> cancelBooking({required int id1}) async {
    emit(CancelBookingLoading());
    final response = await userRepository.cancelBoking(Id: id1);

    response.fold(
      (errMessage) {
        emit(CancelBookingtFailure(errMessage: errMessage));
      },

      (CancelBookingResponse) =>
          emit(CancelBookingSuccess(message: CancelBookingResponse.message)),
    );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////All Booking Owner
  Future<void> AllOwnerBookings() async {
    emit(AllOwnerBookingLoading());
    final response = await userRepository.AllbookingsOwner();

    response.fold(
      (errMessage) {
        emit(AllOwnerBookingFailure(errMessage: errMessage));
      },

      (bookingResponse) =>
          emit(AllOwnerBookingSuccess(bookingResponse: bookingResponse)),
    );
  }

  ///////////////////////////////////////////////////////////////////////////Aprove
  Future<void> aproveBookingOwner({required int id1}) async {
    emit(AproveBookingLoading());
    final response = await userRepository.AproveOwnerBooking(Id: id1);

    response.fold(
      (errMessage) {
        emit(AprovelBookingtFailure(errMessage: errMessage));
      },

      (aprovemodel) => emit(CancelBookingSuccess(message: aprovemodel.message)),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////Aprove Modify
  Future<void> aproveModifyOwner({required int id1}) async {
    emit(AproveModifyLoading());
    final response = await userRepository.aproveOwnerBookingmodify(Id: id1);

    response.fold(
      (errMessage) {
        emit(AproveModifyFailure(errMessage: errMessage));
      },

      (aprovemodel) =>
          emit(AproveModifySuccess(modifiedBookingDetails: aprovemodel)),
    );
  }

  //////////////////////////////////////////////////////////////////reject
  Future<void> rejectbook({required int id1}) async {
    emit(rejectLoading());
    final response = await userRepository.rejectOwnerbook(Id: id1);

    response.fold(
      (errMessage) {
        emit(rejectFailure(errMessage: errMessage));
      },

      (aprovemodel) => emit(rejectSuccess(modifiedBookingDetails: aprovemodel)),
    );
  }

  /////////////////////////////////////////////////////////////////////////////aproveModifyOwner
  Future<void> modifyBookingApartment() async {
    emit(ModifyBookingLoading());

    final response = await userRepository.modifyBookApartment(
      apartmentId: id!,
      endDate: endD!,
      startDate: startDat!,
    );
    response.fold(
      (errMessage) => emit(ModifyBookingFailure(errMessage: errMessage)),
      (bookApartment) =>
          emit(ModifyBookingSuccess(bookingResponse: bookApartment)),
    );
  }

  ///////////////////////////////////////////////////////////////AllNotification
  Future<void> getAllnotification() async {
    emit(GetAllnotificationloading());
    final response = await userRepository.getAllnotification();

    response.fold(
      (errMessage) {
        emit(GetAllnotificationFailure(errorMessage: errMessage));
      },

      (notificationResponse) => emit(
        GetAllnotificationSuccess(notificationResponse: notificationResponse),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////Not read
  Future<void> ReadNotificationNotread({required String xx}) async {
    emit(GetAllnotificationNotredloading());
    final response = await userRepository.ReadNotificationNotread(x: xx);

    response.fold(
      (errMessage) {
        emit(GetAllnotificationNotreadFailure(errorMessage: errMessage));
      },

      (notificationResponse) =>
          emit(GetAllnotificationNotreadSuccess(notRead: notificationResponse)),
    );
  }

  Future<void> getAllnotificationNotread() async {
    emit(NGetAllnotificationNotredloading());
    final response = await userRepository.getAllnotificationNotRead();

    response.fold(
      (errMessage) {
        emit(NGetAllnotificationNotreadFailure(errorMessage: errMessage));
      },

      (notificationResponse) => emit(
        NGetAllnotificationNotreadSuccess(notRead: notificationResponse),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  String? comment;
  void setcommet(String com) {
    comment = com;
  }

  int? idApartment;
  void setidApartment(int id) {
    idApartment = id;
  }

  int? rating;
  void setRating(int rat) {
    rating = rat;
  }

  ///////////////////////////////////////////Add Rating
  Future<void> AddRating() async {
    emit(AddRatingloading());

    final response = await userRepository.addRating(
      commet: comment,
      idApartment: idApartment,
      rating: rating,
    );
    response.fold(
      (errMessage) => emit(AddRatingFailure(errorMessage: errMessage)),
      (addRating) => emit(AddRatingSuccess(ratingResponse: addRating)),
    );
  }

  //////////////////////////////////////////////////////////////////////ShowAllRating
  Future<void> ShowAllrating({required int id}) async {
    emit(ShowRatingloading());

    final response = await userRepository.getAllrating(idApartment: id);
    response.fold(
      (errMessage) => emit(ShowRatingFailure(errorMessage: errMessage)),
      (showRating) => emit(ShowRatingSuccess(ratingResponse: showRating)),
    );
  }

  ////////////////////////////////////////////////////////////////////////favorite
  Future<void> favorites({required int id1}) async {
    emit(Favorirsloading());
    final response = await userRepository.addRemoveFavorites(Id: id1);

    response.fold((errMessage) {
      emit(FavorirsFailure(errorMessage: errMessage));
    }, (FAvorites) => emit(FavorirsSuccess(favorit: FAvorites)));
  }

  //////////////////////////////////////////////////////////////////////////AllFavorites
  Future<void> getAllfavorites() async {
    emit(GetAllFavoritesLoading());
    final response = await userRepository.getAllfavorites();

    response.fold(
      (errMessage) {
        emit(GetAllFavoritesFailure(errorMessage: errMessage));
      },

      (apartmentList) =>
          emit(GetAllFavoritestSuccess(apartments: apartmentList)),
    );
  }

  ////////////////////////////////////////////////////////////////////////is Favorites
  Future<void> isFavorites({required int id}) async {
    emit(isFavorirsloading());
    final response = await userRepository.isFavorites(id: id);

    response.fold((errMessage) {
      emit(isFavorirsFailure(errorMessage: errMessage));
    }, (isfvorites) => emit(isFavorirsSuccess(isfavorit: isfvorites)));
  }
}
