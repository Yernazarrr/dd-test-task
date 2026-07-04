import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_dto.dart';
import 'slot_dto.dart';

part 'doctor_dto.freezed.dart';
part 'doctor_dto.g.dart';

@freezed
abstract class DoctorDto with _$DoctorDto {
  const factory DoctorDto({
    required String id,
    required String name,
    required String specialty,
    required double rating,
    required int reviewCount,
    required int experience,
    required String avatar,
    required String education,
    required String description,
    required List<String> achievements,
    required int price,
    List<SlotDto>? todaySlots,
  }) = _DoctorDto;

  factory DoctorDto.fromJson(Map<String, dynamic> json) =>
      _$DoctorDtoFromJson(json);
}

@freezed
abstract class DoctorsResponseDto with _$DoctorsResponseDto {
  const factory DoctorsResponseDto({
    required List<DoctorDto> doctors,
    required PaginationDto pagination,
  }) = _DoctorsResponseDto;

  factory DoctorsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseDtoFromJson(json);
}
