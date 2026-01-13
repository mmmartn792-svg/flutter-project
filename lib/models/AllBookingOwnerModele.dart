import 'package:projectq/core/api/end_ponits.dart';

class Province {
  final int id;
  final String name;

  const Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(id: json[ApiKey.id] ?? 0, name: json[ApiKey.name] ?? '');
  }
}

class City {
  final int id;
  final String name;
  final Province province;

  const City({required this.id, required this.name, required this.province});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json[ApiKey.id] ?? 0,
      name: json[ApiKey.name] ?? '',
      province: Province.fromJson(json[ApiKey.province] ?? {}),
    );
  }
}

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
  });

  factory BookingUser.fromJson(Map<String, dynamic> json) {
    return BookingUser(
      id: json[ApiKey.id] ?? 0,
      phone: json[ApiKey.phone] ?? '',
      role: json[ApiKey.role] ?? '',
      firstName: json[ApiKey.firstName] ?? '',
      lastName: json[ApiKey.secondName] ?? '',
      dateOfBirth: json[ApiKey.dateOfBirth] ?? '',
      personalPhoto: json[ApiKey.personalPhoto] ?? '',
      IDPhoto: json[ApiKey.IDPhoto] ?? '',
      status: json[ApiKey.status] ?? '',
    );
  }
}

class OwnerApartmentBooking {
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

  const OwnerApartmentBooking({
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

  factory OwnerApartmentBooking.fromJson(Map<String, dynamic> json) {
    return OwnerApartmentBooking(
      id: json[ApiKey.id] ?? 0,
      userId: json[ApiKey.user_id] ?? 0,
      apartmentId: json[ApiKey.apartment_id] ?? 0,
      startDate: DateTime.tryParse(json[ApiKey.start_date]) ?? DateTime.now(),
      endDate: DateTime.tryParse(json[ApiKey.end_date]) ?? DateTime.now(),
      newStartDate: json[ApiKey.newStartDate] != null
          ? DateTime.tryParse(json[ApiKey.newStartDate])
          : null,
      newEndDate: json[ApiKey.newEndDate] != null
          ? DateTime.tryParse(json[ApiKey.newEndDate])
          : null,
      modifyStatus: json[ApiKey.modify_status] ?? '',
      status: json[ApiKey.status] ?? '',
      user: BookingUser.fromJson(json[ApiKey.user] ?? {}),
    );
  }
}

class OwnerApartment {
  final int id;
  final int userId;
  final int cityId;
  final String phoneOfOwner;
  final String title;
  final String description;
  final String price;
  final String priceUnit;
  final String priceType;
  final int area;
  final String areaUnit;
  final String categoryOfRentType;
  final int? roomsNumber;
  final String floor;
  final String status;
  final String? rejectReason;
  final City city;
  final List<OwnerApartmentBooking> bookings;

  const OwnerApartment({
    required this.id,
    required this.userId,
    required this.cityId,
    required this.phoneOfOwner,
    required this.title,
    required this.description,
    required this.price,
    required this.priceUnit,
    required this.priceType,
    required this.area,
    required this.areaUnit,
    required this.categoryOfRentType,
    this.roomsNumber,
    required this.floor,
    required this.status,
    this.rejectReason,
    required this.city,
    required this.bookings,
  });

  factory OwnerApartment.fromJson(Map<String, dynamic> json) {
    return OwnerApartment(
      id: json[ApiKey.id] ?? 0,
      userId: json[ApiKey.user_id] ?? 0,
      cityId: json[ApiKey.city_id] ?? 0,
      phoneOfOwner: json[ApiKey.phoneOfOwner] ?? '',
      title: json[ApiKey.title] ?? '',
      description: json[ApiKey.description] ?? '',
      price: json[ApiKey.price] ?? '',
      priceUnit: json[ApiKey.price_unit] ?? '',
      priceType: json[ApiKey.price_type] ?? '',
      area: json[ApiKey.area] ?? 0,
      areaUnit: json[ApiKey.area_unit] ?? '',
      categoryOfRentType: json[ApiKey.categoryOfRentType] ?? '',
      roomsNumber: json[ApiKey.rooms_number] != null
          ? json[ApiKey.rooms_number]
          : null,
      floor: json[ApiKey.floor] ?? '',
      status: json[ApiKey.status] ?? '',
      rejectReason: json[ApiKey.reject_reason],
      city: City.fromJson(json[ApiKey.city] ?? {}),
      bookings:
          (json[ApiKey.bookings] as List<dynamic>?)
              ?.map((item) => OwnerApartmentBooking.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class OwnerApartmentsResponse {
  final bool success;
  final String message;
  final List<OwnerApartment> data;

  const OwnerApartmentsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OwnerApartmentsResponse.fromJson(Map<String, dynamic> json) {
    return OwnerApartmentsResponse(
      success: json[ApiKey.success] ?? false,
      message: json[ApiKey.message] ?? '',
      data:
          (json[ApiKey.data] as List<dynamic>?)
              ?.map((item) => OwnerApartment.fromJson(item))
              .toList() ??
          [],
    );
  }
}
