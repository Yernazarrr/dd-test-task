import '../../domain/models/doctor.dart';
import '../../domain/models/pagination.dart';
import '../../domain/models/review.dart';
import '../../domain/models/slot.dart';
import '../../domain/models/specialty.dart';
import '../../domain/models/user.dart';
import '../models/doctor_dto.dart';
import '../models/pagination_dto.dart';
import '../models/review_dto.dart';
import '../models/slot_dto.dart';
import '../models/specialty_dto.dart';
import '../models/user_dto.dart';

Specialty mapSpecialty(SpecialtyDto dto) {
  return Specialty(id: dto.id, name: dto.name);
}

Slot mapSlot(SlotDto dto) {
  return Slot(
    id: dto.id,
    startTime: DateTime.parse(dto.startTime),
    endTime: DateTime.parse(dto.endTime),
  );
}

Doctor mapDoctor(DoctorDto dto) {
  return Doctor(
    id: dto.id,
    name: dto.name,
    specialtyId: dto.specialty,
    rating: dto.rating,
    reviewCount: dto.reviewCount,
    experience: dto.experience,
    avatar: dto.avatar,
    education: dto.education,
    description: dto.description,
    achievements: dto.achievements,
    price: dto.price,
    todaySlots: dto.todaySlots?.map(mapSlot).toList() ?? const [],
  );
}

Review mapReview(ReviewDto dto) {
  return Review(
    id: dto.id,
    patientName: dto.patientName,
    rating: dto.rating,
    comment: dto.comment,
    date: DateTime.parse(dto.date),
  );
}

Pagination mapPagination(PaginationDto dto) {
  return Pagination(
    page: dto.page,
    limit: dto.limit,
    total: dto.total,
    pages: dto.pages,
    hasNext: dto.hasNext,
    hasPrev: dto.hasPrev,
  );
}

User mapUser(UserDto dto) {
  return User(
    id: dto.id,
    name: dto.name,
    email: dto.email,
    phone: dto.phone,
    avatar: dto.avatar,
    registrationDate: DateTime.parse(dto.registrationDate),
  );
}
