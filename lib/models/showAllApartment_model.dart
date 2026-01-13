// models/apartment_model.dart

import 'package:projectq/core/api/end_ponits.dart';

class ApartmentModel {
  final int idApartment;
  final String title; //
  final String price; //
  final String province; //
  final String city; //
  final List<String> amenities; //
  final String phone;
  final List<String> images; //
  final String area; //
  final String categoryOfRentType;
  final int? roomsNumber;
  final String floor;

  ApartmentModel({
    required this.idApartment,
    required this.title, //
    required this.price,
    required this.province,
    required this.city,
    required this.amenities,
    required this.phone,
    required this.images,
    required this.area,
    required this.categoryOfRentType,
    this.roomsNumber,
    required this.floor,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    final id = int.tryParse(json[ApiKey.id_apartment].toString()) ?? 0;
    final rooms = json[ApiKey.rooms_number] != null
        ? int.tryParse(json[ApiKey.rooms_number].toString())
        : null;

    return ApartmentModel(
      idApartment: id,

      title: json[ApiKey.title]?.toString() ?? "",
      province: json[ApiKey.province]?.toString() ?? "",
      price: json[ApiKey.price]?.toString() ?? "",
      city: json[ApiKey.city]?.toString() ?? "",

      phone: json[ApiKey.phones1]?.toString() ?? "",
      amenities:
          (json[ApiKey.amenities1] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      area: json[ApiKey.area]?.toString() ?? "",
      categoryOfRentType: json[ApiKey.categoryOfRentType]?.toString() ?? "",
      floor: json[ApiKey.floor]?.toString() ?? "",
      roomsNumber: rooms,
    );
  }
}

class ApartmentListResponse {
  final bool success;
  final String message;
  final List<ApartmentModel> data;

  const ApartmentListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApartmentListResponse.fromJson(Map<String, dynamic> json) {
    return ApartmentListResponse(
      success: json[ApiKey.success] ?? false,
      message: json[ApiKey.message]?.toString() ?? "",
      data:
          (json[ApiKey.data] as List<dynamic>?)
              ?.map((apartmentJson) => ApartmentModel.fromJson(apartmentJson))
              .toList() ??
          [],
    );
  }
}
