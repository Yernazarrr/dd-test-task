// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorDto _$DoctorDtoFromJson(Map<String, dynamic> json) => _DoctorDto(
  id: json['id'] as String,
  name: json['name'] as String,
  specialty: json['specialty'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
  experience: (json['experience'] as num).toInt(),
  avatar: json['avatar'] as String,
  education: json['education'] as String,
  description: json['description'] as String,
  achievements: (json['achievements'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  price: (json['price'] as num).toInt(),
  todaySlots: (json['todaySlots'] as List<dynamic>?)
      ?.map((e) => SlotDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DoctorDtoToJson(_DoctorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'experience': instance.experience,
      'avatar': instance.avatar,
      'education': instance.education,
      'description': instance.description,
      'achievements': instance.achievements,
      'price': instance.price,
      'todaySlots': instance.todaySlots,
    };

_DoctorsResponseDto _$DoctorsResponseDtoFromJson(Map<String, dynamic> json) =>
    _DoctorsResponseDto(
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationDto.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DoctorsResponseDtoToJson(_DoctorsResponseDto instance) =>
    <String, dynamic>{
      'doctors': instance.doctors,
      'pagination': instance.pagination,
    };
