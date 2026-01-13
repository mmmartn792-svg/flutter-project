import 'package:projectq/core/api/end_ponits.dart';

class Favoritesmodel {
  final bool success;
  final String message;

  Favoritesmodel({required this.message, required this.success});
  factory Favoritesmodel.fromJson(Map<String, dynamic> jsonData) {
    return Favoritesmodel(
      message: jsonData[ApiKey.message],
      success: jsonData[ApiKey.success],
    );
  }
}
