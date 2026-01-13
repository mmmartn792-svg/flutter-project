import 'package:projectq/core/api/end_ponits.dart';

class NotificationnotreadModel {
  final bool success;
  final String message;

  NotificationnotreadModel({required this.message, required this.success});
  factory NotificationnotreadModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationnotreadModel(
      message: jsonData[ApiKey.message],
      success: jsonData[ApiKey.success],
    );
  }
}
