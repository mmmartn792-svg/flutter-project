import 'package:projectq/core/api/end_ponits.dart';

class Apartment {
  final int idApartment;
  final String title;
  final String price;
  final int area;
  final String province;
  final String city;
  final List<String> amenities;
  final String phones;
  final String floor;
  final String categoryOfRentType;
  final int? roomsNumber;
  final List<String> images;

  Apartment({
    required this.idApartment,
    required this.title,
    required this.price,
    required this.area,
    required this.province,
    required this.city,
    required this.amenities,
    required this.phones,
    required this.floor,
    required this.categoryOfRentType,
    this.roomsNumber,
    required this.images,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      idApartment: int.tryParse(json[ApiKey.id_apartment].toString()) ?? 0,
      title: json[ApiKey.title]?.toString() ?? '',
      price: json[ApiKey.price]?.toString() ?? '',
      area: int.tryParse(json[ApiKey.area].toString()) ?? 0,
      province: json[ApiKey.province]?.toString() ?? '',
      city: json[ApiKey.city]?.toString() ?? '',

      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      phones: json[ApiKey.phones1]?.toString() ?? '',

      floor: json[ApiKey.floor]?.toString() ?? '',
      categoryOfRentType: json[ApiKey.categoryOfRentType]?.toString() ?? '',
      roomsNumber: json[ApiKey.rooms_number] as int?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class FilterResponse {
  final bool success;
  final String message;
  final List<Apartment> data;

  const FilterResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FilterResponse.fromJson(Map<String, dynamic> json) {
    return FilterResponse(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      data: (json[ApiKey.data] as List<dynamic>)
          .map((apartmentJson) => Apartment.fromJson(apartmentJson))
          .toList(),
    );
  }
}
