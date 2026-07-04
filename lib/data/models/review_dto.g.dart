// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => _ReviewDto(
  id: json['id'] as String,
  patientName: json['patientName'] as String,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$ReviewDtoToJson(_ReviewDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientName': instance.patientName,
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
    };

_ReviewsResponseDto _$ReviewsResponseDtoFromJson(Map<String, dynamic> json) =>
    _ReviewsResponseDto(
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationDto.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ReviewsResponseDtoToJson(_ReviewsResponseDto instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'pagination': instance.pagination,
    };
