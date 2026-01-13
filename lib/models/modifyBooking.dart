import 'package:projectq/core/api/end_ponits.dart';

class BookingDataModify {
  final int id;
  final int apartmentId;
  final int userId;
  final String startDate;
  final String endDate;
  final String status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String? newStartDate;
  final String? newEndDate;
  final String modifyStatus;

  const BookingDataModify({
    required this.id,
    required this.apartmentId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    this.newStartDate,
    this.newEndDate,
    required this.modifyStatus,
  });

  factory BookingDataModify.fromJson(Map<String, dynamic> json) {
    return BookingDataModify(
      id: int.tryParse(json[ApiKey.id].toString()) ?? 0,
      apartmentId: int.tryParse(json[ApiKey.apartment_id].toString()) ?? 0,
      userId: int.tryParse(json[ApiKey.user_id].toString()) ?? 0,

      startDate: json[ApiKey.start_date]?.toString() ?? '',
      endDate: json[ApiKey.end_date]?.toString() ?? '',
      status: json[ApiKey.status]?.toString() ?? '',
      modifyStatus: json[ApiKey.ModifyStatuse]?.toString() ?? '',

      newStartDate: json[ApiKey.newStartDate]?.toString(),
      newEndDate: json[ApiKey.newEndDate]?.toString(),

      updatedAt:
          DateTime.tryParse(json[ApiKey.updatedAt].toString()) ??
          DateTime.now(),
      createdAt:
          DateTime.tryParse(json[ApiKey.createdAt].toString()) ??
          DateTime.now(),
    );
  }
}

class BookingResponseModify {
  final bool success;
  final String message;
  final BookingDataModify data;

  const BookingResponseModify({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BookingResponseModify.fromJson(Map<String, dynamic> json) {
    return BookingResponseModify(
      success: json[ApiKey.success] as bool? ?? false,
      message: json[ApiKey.message]?.toString() ?? '',
      data: BookingDataModify.fromJson(json[ApiKey.data] ?? {}),
    );
  }
}
