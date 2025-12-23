import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:image_picker/image_picker.dart';

import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/api_consumer.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/core/errors/exceptions.dart';
import 'package:projectq/core/functions/upload_image_to_api.dart';
import 'package:projectq/models/AddApartmentModele.dart';
import 'package:projectq/models/logout_model.dart';
import 'package:projectq/models/showAllApartment_model.dart';

import 'package:projectq/models/sign_in_model.dart';
import 'package:projectq/models/sign_up_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {ApiKey.phone: phone, ApiKey.password: password},
      );

      final user = SignInModel.fromJson(response);

      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.user.id);
      CacheHelper().saveData(key: ApiKey.role, value: user.user.role);
      CacheHelper().saveData(key: ApiKey.phone, value: user.user.phone);
      CacheHelper().saveData(key: ApiKey.firstName, value: user.user.firstName);
      CacheHelper().saveData(key: ApiKey.secondName, value: user.user.lastName);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String firstName,
    required String phone,
    required String secondName,
    required String password,
    required String confirmPassword,
    required XFile imgPersonal,
    required XFile imgID,
    required String dateOfBirthday,
    required String role,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.firstName: firstName,
          ApiKey.phone: phone,
          ApiKey.secondName: secondName,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.filePicpersonal: await uploadImageToAPI(imgPersonal),
          ApiKey.filePicID: await uploadImageToAPI(imgID),
          ApiKey.date: dateOfBirthday,
          ApiKey.role: role,
        },
      );

      if (response == null) {
        return Left('No response from server');
      }
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, LogoutModel>> logout() async {
    try {
      final response = await api.post(EndPoint.logout);
      if (response == null) {
        return Left('No response from server');
      }
      final logoutModel = LogoutModel.fromJson(response);

      return Right(logoutModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Addapartmentmodele>> addApartment({
    required int cityId,
    required String title,
    required String description,
    required String price,
    required String floor,
    required int rooms_number,
    required int area, // بالمتر المربع
    required XFile image, // قائمة من روابط الصور
    required String rentType,
    required String categoryOfRentType,
    required List<int> amenities,
    required List<String> phones,
    required String price_type,
  }) async {
    try {
      final response = await api.post(
        EndPoint.creatNewApartment,
        isFromData: true,
        data: {
          ApiKey.amenities: amenities,
          ApiKey.phones: phones,
          ApiKey.city_id: cityId,
          ApiKey.title: title,
          ApiKey.description: description,
          ApiKey.price: price,
          ApiKey.categoryOfRentType: categoryOfRentType,
          ApiKey.floor: floor,
          ApiKey.price_type: price_type,
          ApiKey.area: area,
          ApiKey.photoOfApartment: await MultipartFile.fromFile(
            image.path,
            filename: image.name,
          ),
          ApiKey.rent_type: rentType,
          ApiKey.rooms_number: rooms_number,
        },
      );

      if (response == null) {
        return Left('No response from server');
      }
      final addartmentModel = Addapartmentmodele.fromJson(response);
      return Right(addartmentModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, List<ApartmentModel>>> getAllApartment() async {
    try {
      final response = await api.get(EndPoint.getAllApartment);

      if (response == null) {
        return left("Null");
      }
      final dataList = response as List<dynamic>;

      // ثانيًا، استخدم .map() لتحويل كل عنصر في القائمة (وهو Map<String, dynamic>)
      // إلى كائن ApartmentModel، ثم حوّل الناتج إلى قائمة باستخدام .toList()
      final apartmentList = dataList
          .map((jsonObject) => ApartmentModel.fromJson(jsonObject))
          .toList();
      return Right(apartmentList);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
      // TODO
    }
  }
}
