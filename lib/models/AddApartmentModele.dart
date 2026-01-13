import 'package:projectq/core/api/end_ponits.dart';

class AddApartmentData {
  final int idApartment;
  final String title;
  final String price;
  final String province;
  final String city;
  final List<String> amenities;
  final String phoneOfOwner;
  final List<String> images;
  final String area;
  final String categoryOfRentType;
  final String roomsNumber;
  final String floor;

  const AddApartmentData({
    required this.idApartment,
    required this.title,
    required this.price,
    required this.province,
    required this.city,
    required this.amenities,
    required this.phoneOfOwner,
    required this.images,
    required this.area,
    required this.categoryOfRentType,
    required this.roomsNumber,
    required this.floor,
  });

  factory AddApartmentData.fromJson(Map<String, dynamic> json) {
    return AddApartmentData(
      idApartment: json[ApiKey.apartment_id] ?? 0,

      title: json[ApiKey.title] ?? '',
      price: json[ApiKey.price] ?? '',
      province: json[ApiKey.province] ?? '',
      city: json[ApiKey.city] ?? '',
      phoneOfOwner: json[ApiKey.phoneOfOwner] ?? '',
      area: json[ApiKey.area] ?? '',
      categoryOfRentType: json[ApiKey.categoryOfRentType] ?? '',
      roomsNumber: json[ApiKey.rooms_number] ?? '',
      floor: json[ApiKey.floor] ?? '',

      amenities:
          (json[ApiKey.amenities] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      images:
          (json[ApiKey.images] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class AddApartmentResponse {
  final bool success;
  final String message;
  final AddApartmentData data;

  const AddApartmentResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddApartmentResponse.fromJson(Map<String, dynamic> json) {
    return AddApartmentResponse(
      success: json[ApiKey.success] ?? false,
      message: json[ApiKey.message] ?? '',
      data: AddApartmentData.fromJson(json[ApiKey.data] ?? {}),
    );
  }
}
