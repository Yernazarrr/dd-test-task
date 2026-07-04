import 'package:freezed_annotation/freezed_annotation.dart';

import 'doctor.dart';
import 'pagination.dart';
import 'review.dart';

part 'paginated_results.freezed.dart';

@freezed
abstract class PaginatedDoctors with _$PaginatedDoctors {
  const factory PaginatedDoctors({
    required List<Doctor> doctors,
    required Pagination pagination,
    @Default(false) bool isFromCache,
  }) = _PaginatedDoctors;
}

@freezed
abstract class PaginatedReviews with _$PaginatedReviews {
  const factory PaginatedReviews({
    required List<Review> reviews,
    required Pagination pagination,
  }) = _PaginatedReviews;
}
