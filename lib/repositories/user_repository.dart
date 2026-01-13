import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/api_consumer.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/core/errors/error_model.dart';
import 'package:projectq/core/errors/exceptions.dart';
import 'package:projectq/core/functions/upload_image_to_api.dart';
import 'package:projectq/models/AddApartmentModele.dart';
import 'package:projectq/models/AddRating.dart';
import 'package:projectq/models/AllBookingOwnerModele.dart';
import 'package:projectq/models/AllBookingsModel.dart';
import 'package:projectq/models/Booking%20Model.dart';
import 'package:projectq/models/NotificationGetAll.dart';
import 'package:projectq/models/aproveModifyowner.dart';
import 'package:projectq/models/aproveOwner.dart';
import 'package:projectq/models/cancelBookingModel.dart';
import 'package:projectq/models/favoritesModel.dart';
import 'package:projectq/models/isFavoritesModel.dart';
import 'package:projectq/models/logout_model.dart';
import 'package:projectq/models/modifyBooking.dart';
import 'package:projectq/models/notificationnotread.dart';
import 'package:projectq/models/showAllApartment_model.dart';
import 'package:projectq/models/showAllRatingForApartment.dart';

import 'package:projectq/models/sign_in_model.dart';
import 'package:projectq/models/sign_up_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  ////////////////////////////////////////////////////////////////////////signIn
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

      CacheHelper().saveData(key: ApiKey.token, value: user.data.token);

      CacheHelper().saveData(key: ApiKey.role, value: user.data.role);
      CacheHelper().saveData(key: ApiKey.phone, value: user.data.phone);
      CacheHelper().saveData(key: ApiKey.firstName, value: user.data.nameUser);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////signup

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

      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////logout

  Future<Either<String, LogoutModel>> logout() async {
    try {
      final response = await api.post(EndPoint.logout);

      final logoutModel = LogoutModel.fromJson(response);

      return Right(logoutModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////addapartment

  Future<Either<String, AddApartmentResponse>> addApartment({
    required int cityId,
    required String title,
    required String price,
    required String floor,
    required int rooms_number,
    required int area,
    required List<XFile> images,
    required String rentType,
    required String categoryOfRentType,
    required List<int> amenities,
  }) async {
    try {
      List<MultipartFile> multipartImages = [];
      if (images.isNotEmpty) {
        List<Future<MultipartFile>> imageFutures = images.map((image) async {
          return MultipartFile.fromFile(image.path, filename: image.name);
        }).toList();
        multipartImages = await Future.wait(imageFutures);
      }

      final Map<String, dynamic> data = {
        ApiKey.amenities: amenities,
        ApiKey.city_id: cityId,
        ApiKey.title: title,
        ApiKey.price: price,
        ApiKey.categoryOfRentType: categoryOfRentType,
        ApiKey.floor: floor,
        ApiKey.area: area,
        ApiKey.rent_type: rentType,
        ApiKey.rooms_number: rooms_number,
      };

      if (multipartImages.isNotEmpty) {
        data[ApiKey.images] = multipartImages;
      }

      final response = await api.post(
        EndPoint.creatNewApartment,
        isFromData: true,
        data: data,
      );

      final addartmentModel = AddApartmentResponse.fromJson(response);
      return Right(addartmentModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////getAllApartment

  Future<Either<String, List<ApartmentModel>>> getAllApartment() async {
    try {
      final response = await api.get(EndPoint.getAllApartment);

      final apartmentListResponse = ApartmentListResponse.fromJson(response);

      return Right(apartmentListResponse.data);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////Filters

  Future<Either<String, ApartmentListResponse>> Filters({
    double? price,
    int? city,
    int? area,
    int? province,
  }) async {
    try {
      final response = await api.post(
        EndPoint.searchFilter,
        isFromData: true,
        data: {
          ApiKey.city_id: city,
          ApiKey.price: price,
          ApiKey.province_id: province,
          ApiKey.area: area,
        },
      );

      final filterResponse = ApartmentListResponse.fromJson(response);

      return Right(filterResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////bookingApartment

  Future<Either<String, BookingResponse>> bookApartment({
    required int apartmentId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await api.post(
        EndPoint.bookingApartment,

        data: {
          ApiKey.apartment_id: apartmentId,
          ApiKey.start_date: startDate,
          ApiKey.end_date: endDate,
        },
      );

      final bookingModel = BookingResponse.fromJson(response);

      return Right(bookingModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////Allbookinga

  Future<Either<String, RenterBookingsResponse>> Allbookings() async {
    try {
      final response = await api.post(EndPoint.AllrenterBookings);

      final renterBookingsResponse = RenterBookingsResponse.fromJson(response);

      return Right(renterBookingsResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////cancel

  Future<Either<String, CancelBookingResponse>> cancelBoking({
    required int Id,
  }) async {
    try {
      final response = await api.post(
        EndPoint.cancelBoking,
        isFromData: true,
        data: {'bookingId': Id},
      );

      final cancelbookingModel = CancelBookingResponse.fromJson(response);

      return Right(cancelbookingModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////AllBookingsOwner

  Future<Either<String, OwnerApartmentsResponse>> AllbookingsOwner() async {
    try {
      final response = await api.post(EndPoint.AllrenterBookings);

      final ownererBookingsResponse = OwnerApartmentsResponse.fromJson(
        response,
      );

      return Right(ownererBookingsResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////approve

  Future<Either<String, AproveModel>> AproveOwnerBooking({
    required int Id,
  }) async {
    try {
      final response = await api.post(
        EndPoint.ApproveOwner,
        isFromData: true,
        data: {ApiKey.id: Id},
      );

      final aproveModel = AproveModel.fromJson(response);

      return Right(aproveModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
  ////////////////////////////////////////////////////////////////////////aproveOwnerBookingmodify

  Future<Either<String, ApproveModificationResponse>> aproveOwnerBookingmodify({
    required int Id,
  }) async {
    try {
      final response = await api.post(
        EndPoint.ApproveOwnermodify,
        isFromData: true,
        data: {ApiKey.id: Id},
      );

      final aproveModelmodify = ApproveModificationResponse.fromJson(response);

      return Right(aproveModelmodify);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  ////////////////////////////////////////////////////////////////////////reject
  //القبول  و  رفض التعديل لها نفس الموديل الكلاس
  Future<Either<String, ApproveModificationResponse>> rejectOwnerbook({
    required int Id,
  }) async {
    try {
      final response = await api.post(
        EndPoint.reject,
        isFromData: true,
        data: {ApiKey.id: Id},
      );

      final aproveModelmodify = ApproveModificationResponse.fromJson(response);

      return Right(aproveModelmodify);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////modifyBook
  Future<Either<String, BookingResponseModify>> modifyBookApartment({
    required int apartmentId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await api.post(
        EndPoint.modifybooking,

        data: {
          'bookingId': apartmentId,
          ApiKey.start_date: startDate,
          ApiKey.end_date: endDate,
        },
      );

      final bookingModel = BookingResponseModify.fromJson(response);

      return Right(bookingModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////AllNotification
  Future<Either<String, NotificationResponse>> getAllnotification() async {
    try {
      final response = await api.get(EndPoint.notificationAll);

      final notificationData = NotificationResponse.fromJson(response);

      return Right(notificationData);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////read // id notification
  Future<Either<String, NotificationnotreadModel>> ReadNotificationNotread({
    required String x,
  }) async {
    try {
      final response = await api.post(
        "http://10.0.2.2:8000/api/notification/${x}/read",
      );

      final notificationData = NotificationnotreadModel.fromJson(response);

      return Right(notificationData);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////All notif not read
  Future<Either<String, NotificationResponse>>
  getAllnotificationNotRead() async {
    try {
      final response = await api.get(EndPoint.notificationNotRead);

      final notificationData = NotificationResponse.fromJson(response);

      return Right(notificationData);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  //////////////////////////////////////////////////////////////////AddRating
  Future<Either<String, RatingResponse>> addRating({
    int? idApartment,
    int? rating,
    String? commet,
  }) async {
    try {
      final response = await api.post(
        EndPoint.addRating,
        data: {
          ApiKey.apartment_id: idApartment,
          ApiKey.rating: rating,
          ApiKey.comment: commet,
        },
      );

      final ratingResponse = RatingResponse.fromJson(response);

      return Right(ratingResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  } /////////////////////////////////////////////////////////////////////////////////////////////Rating for Apartment

  Future<Either<String, ShowRatingResponse>> getAllrating({
    required int idApartment,
  }) async {
    try {
      final response = await api.post(
        EndPoint.showRating,
        data: {ApiKey.id: idApartment},
      );

      final ratingResponse = ShowRatingResponse.fromJson(response);

      return Right(ratingResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  //////////////////////////////////////////////////////////////////////////////AddFavorites
  Future<Either<String, Favoritesmodel>> addRemoveFavorites({
    required int Id,
  }) async {
    try {
      final response = await api.post(
        EndPoint.favoritesAdd,
        data: {ApiKey.apartment_id: Id},
      );

      final favoritesmodel = Favoritesmodel.fromJson(response);

      return Right(favoritesmodel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  //////////////////////////////////////////////////////////////////////allFacorites
  Future<Either<String, List<ApartmentModel>>> getAllfavorites() async {
    try {
      final response = await api.get(EndPoint.favorites);

      final apartmentListResponse = ApartmentListResponse.fromJson(response);

      return Right(apartmentListResponse.data);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////is favorites
  Future<Either<String, ToggleFavoriteResponse>> isFavorites({
    required int id,
  }) async {
    try {
      final response = await api.get(
        "http://10.0.2.2:8000/api/favorites/${id}",
      );

      final isFavorites = ToggleFavoriteResponse.fromJson(response);

      return Right(isFavorites);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left('حدث خطأ غير متوقع');
    }
  }
}
