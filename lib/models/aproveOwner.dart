import 'package:projectq/core/api/end_ponits.dart';

class AproveModel {
  final bool success;
  final String message;

  AproveModel({required this.message, required this.success});
  factory AproveModel.fromJson(Map<String, dynamic> jsonData) {
    return AproveModel(
      message: jsonData[ApiKey.message],
      success: jsonData[ApiKey.success],
    );
  }
}
