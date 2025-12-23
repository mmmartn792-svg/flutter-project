// models/apartment_model.dart

import 'package:projectq/core/api/end_ponits.dart';

class ApartmentModel {
  final int id;
  final String title;
  final String province;
  final String price;
  final String city;
  final List<String> phones;
  final List<String> amenities;

  // بالمتر المربع
  final String photoOfTheApartment; // قائمة من روابط الصور

  ApartmentModel({
    required this.id,
    required this.title,
    required this.province,
    required this.price,
    required this.city,
    required this.phones,
    required this.amenities,
    required this.photoOfTheApartment,
  });

  /// دالة مصنعية لإنشاء كائن ApartmentModel من JSON
  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      id: json[ApiKey.id] as int,
      title: json[ApiKey.title] as String,
      province: json[ApiKey.province] as String,
      price: json[ApiKey.price],
      city: json[ApiKey.city] as String,
      phones: List<String>.from(json[ApiKey.phones1] ?? []),
      amenities: List<String>.from(json[ApiKey.amenities1] ?? []),
      photoOfTheApartment: json[ApiKey.photoOfApartment] as String,
    );
  }
}
