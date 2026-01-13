import 'package:projectq/core/api/end_ponits.dart';

class Province {
  final int id;
  final String name;
  final String? createdAt;
  final String? updatedAt;

  const Province({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json[ApiKey.id] as int,
      name: json[ApiKey.name] as String,
      createdAt: json[ApiKey.createdAt] as String?,
      updatedAt: json[ApiKey.updatedAt] as String?,
    );
  }
}

class City {
  final int id;
  final String name;
  final Province province;
  final String? createdAt;
  final String? updatedAt;

  const City({
    required this.id,
    required this.name,
    required this.province,
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json[ApiKey.id] as int,
      name: json[ApiKey.name] as String,
      province: Province.fromJson(json[ApiKey.province]),
      createdAt: json[ApiKey.createdAt] as String?,
      updatedAt: json[ApiKey.updatedAt] as String?,
    );
  }
}

class BookingApartment {
  final int id;
  final int userId;
  final int cityId;
  final String phoneOfOwner;
  final String title;
  final String? description;
  final String price;
  final String priceUnit;
  final String priceType;
  final int area;
  final String areaUnit;
  final String categoryOfRentType;
  final int roomsNumber;
  final String floor;
  final String status;
  final String? rejectReason;
  final DateTime createdAt;
  final DateTime updatedAt;
  final City city;

  const BookingApartment({
    required this.id,
    required this.userId,
    required this.cityId,
    required this.phoneOfOwner,
    required this.title,
    this.description,
    required this.price,
    required this.priceUnit,
    required this.priceType,
    required this.area,
    required this.areaUnit,
    required this.categoryOfRentType,
    required this.roomsNumber,
    required this.floor,
    required this.status,
    this.rejectReason,
    required this.createdAt,
    required this.updatedAt,
    required this.city,
  });

  factory BookingApartment.fromJson(Map<String, dynamic> json) {
    return BookingApartment(
      id: json[ApiKey.id] as int,
      userId: json[ApiKey.user_id] as int,
      cityId: json[ApiKey.city_id] as int,
      phoneOfOwner: json[ApiKey.phoneOfOwner] as String,
      title: json[ApiKey.title] as String,
      description: json[ApiKey.description] as String?,
      price: json[ApiKey.price] as String,
      priceUnit: json[ApiKey.price_unit] as String,
      priceType: json[ApiKey.price_type] as String,
      area: json[ApiKey.area] as int,
      areaUnit: json[ApiKey.area_unit] as String,
      categoryOfRentType: json[ApiKey.categoryOfRentType] as String,
      roomsNumber: json[ApiKey.rooms_number] as int,
      floor: json[ApiKey.floor] as String,
      status: json[ApiKey.status] as String,
      rejectReason: json[ApiKey.reject_reason] as String?,
      createdAt: DateTime.parse(json[ApiKey.createdAt]),
      updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
      city: City.fromJson(json[ApiKey.city]),
    );
  }
}

class Booking {
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
  final BookingApartment apartment;

  const Booking({
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
    required this.apartment,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json[ApiKey.id] as int,
      userId: json[ApiKey.user_id] as int,
      apartmentId: json[ApiKey.apartment_id] as int,
      startDate: DateTime.parse(json[ApiKey.start_date]),
      endDate: DateTime.parse(json[ApiKey.end_date]),
      newStartDate: json[ApiKey.newStartDate] != null
          ? DateTime.parse(json[ApiKey.newStartDate])
          : null,
      newEndDate: json[ApiKey.newEndDate] != null
          ? DateTime.parse(json[ApiKey.newEndDate])
          : null,
      modifyStatus: json[ApiKey.modify_status] as String,
      status: json[ApiKey.status] as String,
      createdAt: DateTime.parse(json[ApiKey.createdAt]),
      updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
      apartment: BookingApartment.fromJson(json[ApiKey.apartment]),
    );
  }
}

class RenterBookingsResponse {
  final bool success;
  final String message;
  final List<Booking> data;

  const RenterBookingsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RenterBookingsResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json[ApiKey.data] as List;
    List<Booking> bookings = dataList.map((i) => Booking.fromJson(i)).toList();

    return RenterBookingsResponse(
      success: json[ApiKey.success] as bool,
      message: json[ApiKey.message] as String,
      data: bookings,
    );
  }
}
