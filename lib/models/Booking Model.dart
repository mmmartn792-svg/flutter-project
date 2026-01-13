import 'package:projectq/core/api/end_ponits.dart';

class BookingData {
  final int apartmentId;
  final String startDate;
  final String endDate;
  final int userId;
  final String status;
  final String updatedAt;
  final String createdAt;
  final int id;

  const BookingData({
    required this.apartmentId,
    required this.startDate,
    required this.endDate,
    required this.userId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      apartmentId: json[ApiKey.apartment_id],
      startDate: json[ApiKey.start_date],
      endDate: json[ApiKey.end_date],
      userId: json[ApiKey.user_id],
      status: json[ApiKey.status],
      updatedAt: json[ApiKey.updatedAt],
      createdAt: json[ApiKey.createdAt],
      id: json[ApiKey.id],
    );
  }
}

class BookingResponse {
  final bool success;
  final String message;
  final BookingData data;

  const BookingResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      data: BookingData.fromJson(json[ApiKey.data]),
    );
  }
}
