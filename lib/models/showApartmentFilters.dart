import 'package:projectq/core/api/end_ponits.dart';

class ApartmentModelFilter {
  final String title;
  final String province;
  final String price;
  final String city;
  final List<String> phones;
  final List<String> amenities;

  final String photoOfTheApartment;

  ApartmentModelFilter({
    required this.title,
    required this.province,
    required this.price,
    required this.city,
    required this.phones,
    required this.amenities,
    required this.photoOfTheApartment,
  });

  factory ApartmentModelFilter.fromJson(Map<String, dynamic> json) {
    return ApartmentModelFilter(
      title: json[ApiKey.title] as String,
      province: json[ApiKey.province] as String,
      price: json[ApiKey.price],
      city: json[ApiKey.city] as String,
      phones: List<String>.from(json[ApiKey.phones1] ?? []),
      amenities: List<String>.from(json[ApiKey.amenities1] ?? []),
      photoOfTheApartment: json[ApiKey.photoOfApartment] ?? "",
    );
  }
}
