import 'package:projectq/core/api/end_ponits.dart';

class SignUpModel {
  final bool success;
  final String message;

  SignUpModel({required this.message, required this.success});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      message: jsonData[ApiKey.message],
      success: jsonData[ApiKey.success],
    );
  }
}
