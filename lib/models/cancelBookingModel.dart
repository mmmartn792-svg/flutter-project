import 'package:projectq/core/api/end_ponits.dart';

class BookingUser {
  final int id;
  final String phone;
  final String role;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String personalPhoto;
  final String IDPhoto;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BookingUser({
    required this.id,
    required this.phone,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.personalPhoto,
    required this.IDPhoto,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingUser.fromJson(Map<String, dynamic> json) {
    return BookingUser(
      id: int.tryParse(json[ApiKey.id].toString()) ?? 0,
      phone: json[ApiKey.phone]?.toString() ?? '',
      role: json[ApiKey.role]?.toString() ?? '',
      firstName: json[ApiKey.firstName]?.toString() ?? '',
      lastName: json[ApiKey.secondName]?.toString() ?? '',
      dateOfBirth: json[ApiKey.dateOfBirth]?.toString() ?? '',
      personalPhoto: json[ApiKey.personalPhoto]?.toString() ?? '',
      IDPhoto: json[ApiKey.IDPhoto]?.toString() ?? '',
      status: json[ApiKey.status]?.toString() ?? '',
      createdAt: DateTime.tryParse(json[ApiKey.createdAt]) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json[ApiKey.updatedAt]) ?? DateTime.now(),
    );
  }
}

class CancelledBookingDetails {
  final int id;
  final int userId;
  final int apartmentId;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? newStartDate;
  final DateTime? newEndDate;
  final String modifyStatus;
  final String status;
  final BookingUser user;

  const CancelledBookingDetails({
    required this.id,
    required this.userId,
    required this.apartmentId,
    required this.startDate,
    required this.endDate,
    this.newStartDate,
    this.newEndDate,
    required this.modifyStatus,
    required this.status,
    required this.user,
  });

  factory CancelledBookingDetails.fromJson(Map<String, dynamic> json) {
    return CancelledBookingDetails(
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
      user: BookingUser.fromJson(json[ApiKey.user]),
    );
  }
}

class CancelBookingResponse {
  final bool success;
  final String message;
  final CancelledBookingDetails data;

  const CancelBookingResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CancelBookingResponse.fromJson(Map<String, dynamic> json) {
    return CancelBookingResponse(
      success: json[ApiKey.success] as bool? ?? false,
      message: json[ApiKey.message]?.toString() ?? '',
      data: CancelledBookingDetails.fromJson(json[ApiKey.data] ?? {}),
    );
  }
}
