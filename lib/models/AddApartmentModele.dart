import 'package:projectq/core/api/end_ponits.dart';

class Addapartmentmodele {
  final String message;
  final String price;
  final String title;
  final String province;
  final String city;
  final List<int> amenities;
  final List<String> phones;
  final String imgUrl;

  // Constructor
  const Addapartmentmodele({
    required this.message,
    required this.price,
    required this.title,
    required this.province,
    required this.city,
    required this.amenities,
    required this.phones,
    required this.imgUrl,
  });

  // دالة لإنشاء كائن من JSON (تأتي من الـ API)
  factory Addapartmentmodele.fromJson(Map<String, dynamic> json) {
    return Addapartmentmodele(
      message: json[ApiKey.message] as String,
      price: json[ApiKey.price] as String,
      title: json[ApiKey.title] as String,
      province: json[ApiKey.province] as String,
      city: json[ApiKey.city] as String,
      amenities: List<int>.from(json[ApiKey.amenities] ?? []), //
      phones: List<String>.from(json[ApiKey.phones] ?? []),
      imgUrl: json[ApiKey.photoOfApartment] as String,
    );
  }

  // دالة لتحويل الكائن إلى JSON (لإرسالها إلى الـ API)
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'price': price,
      'title': title,
      'province': province,
      'city': city,
      'amenities': amenities,
      'phones': phones,
    };
  }

  @override
  String toString() {
    return 'ApartmentModel(message: $message, title: $title, price: $price)';
  }
}
