import 'package:image_picker/image_picker.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:projectq/models/showAllApartment_model.dart';

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
  ////////////////////////////////////////////////logout

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

  XFile? image; //
  void setImage(XFile img) {
    image = img;
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

  String price_type = "monthly";
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
      description: description!,
      price: price ?? '0',
      floor: floor!,
      area: area ?? 0,
      image: image!,
      rentType: rentType!,
      categoryOfRentType: categoryOfRentType!,
      phones: phones!,
      price_type: price_type,
      rooms_number: rooms_number!,
    );
    response.fold(
      (errMessage) => emit(AddApartmentFailure(errorMessage: errMessage)),
      (addapartmentmodele) =>
          emit(AddApartmentSuccess(message: addapartmentmodele.message)),
    );
  }

  ///////////////////////////////////////////////////// add apartment

  ///////////////////////////////////////////////////// get all apartment

  Future<void> getAllapartment() async {
    emit(GetAllApartmentLoading());
    final response = await userRepository.getAllApartment();

    response.fold(
      (errMessage) => emit(GetAllApartmentFailure(errorMessage: errMessage)),
      (apartmentList) =>
          emit(GetAllApartmentSuccess(apartments: apartmentList)),
    );
  }

  //////////////////////////////////////////////////// get all apartment
}
