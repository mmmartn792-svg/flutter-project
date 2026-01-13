import 'package:projectq/core/api/end_ponits.dart';

class ModifiedBookingDetails {
  final int id;
  final int userId;
  final int apartmentId;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? newStartDate;
  final DateTime? newEndDate;
  final String modifyStatus;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ModifiedBookingDetails({
    required this.id,
    required this.userId,
    required this.apartmentId,
    required this.startDate,
    required this.endDate,
    this.newStartDate,
    this.newEndDate,
    required this.modifyStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ModifiedBookingDetails.fromJson(Map<String, dynamic> json) {
    return ModifiedBookingDetails(
      id: int.tryParse(json[ApiKey.id].toString()) ?? 0,
      userId: int.tryParse(json[ApiKey.user_id].toString()) ?? 0,
      apartmentId: int.tryParse(json[ApiKey.apartment_id].toString()) ?? 0,
      startDate: DateTime.tryParse(json[ApiKey.start_date]) ?? DateTime.now(),
      endDate: DateTime.tryParse(json[ApiKey.end_date]) ?? DateTime.now(),
      newStartDate: json[ApiKey.newStartDate] != null
          ? DateTime.tryParse(json[ApiKey.newStartDate])
          : null,
      newEndDate: json[ApiKey.newEndDate] != null
          ? DateTime.tryParse(json[ApiKey.newEndDate])
          : null,
      modifyStatus: json[ApiKey.modify_status]?.toString() ?? '',
      status: json[ApiKey.status]?.toString() ?? '',
      createdAt: DateTime.tryParse(json[ApiKey.createdAt]) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json[ApiKey.updatedAt]) ?? DateTime.now(),
    );
  }
}

class ApproveModificationResponse {
  final bool success;
  final String message;
  final ModifiedBookingDetails data;

  const ApproveModificationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApproveModificationResponse.fromJson(Map<String, dynamic> json) {
    return ApproveModificationResponse(
      success: json[ApiKey.success] as bool? ?? false,
      message: json[ApiKey.message]?.toString() ?? '',
      data: ModifiedBookingDetails.fromJson(json[ApiKey.data] ?? {}),
    );
  }
}
