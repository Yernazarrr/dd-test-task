import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_dto.dart';

part 'review_dto.freezed.dart';
part 'review_dto.g.dart';

@freezed
abstract class ReviewDto with _$ReviewDto {
  const factory ReviewDto({
    required String id,
    required String patientName,
    required int rating,
    required String comment,
    required String date,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}

@freezed
abstract class ReviewsResponseDto with _$ReviewsResponseDto {
  const factory ReviewsResponseDto({
    required List<ReviewDto> reviews,
    required PaginationDto pagination,
  }) = _ReviewsResponseDto;

  factory ReviewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseDtoFromJson(json);
}
