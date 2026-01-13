import 'package:projectq/core/api/end_ponits.dart';

class NotificationData {
  final String id;
  final String type;
  final String notifiableType;
  final int notifiableId;

  final Map<String, dynamic> data;

  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationData({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json[ApiKey.id],
      type: json[ApiKey.type],
      notifiableType: json[ApiKey.notifiable_type],
      notifiableId: json[ApiKey.notifiable_id],
      data: json[ApiKey.data] as Map<String, dynamic>? ?? {},
      readAt: json[ApiKey.read_at] != null
          ? DateTime.parse(json[ApiKey.read_at])
          : null,
      createdAt: DateTime.parse(json[ApiKey.createdAt]),
      updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
    );
  }
}

class NotificationResponse {
  final bool success;
  final String message;
  final List<NotificationData> data;

  NotificationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    var dataList = (json[ApiKey.data] as List)
        .map((item) => NotificationData.fromJson(item))
        .toList();

    return NotificationResponse(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      data: dataList,
    );
  }
}
