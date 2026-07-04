import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/doctor.dart';
import '../../../domain/models/pagination.dart';
import '../../../domain/models/review.dart';
import '../../../domain/models/slot.dart';

part 'doctor_details_state.freezed.dart';

@freezed
abstract class DoctorDetailsState with _$DoctorDetailsState {
  const factory DoctorDetailsState({
    required Doctor? doctor,
    required List<Slot> schedule,
    required List<Review> reviews,
    required Pagination? reviewsPagination,
    required bool isLoadingDoctor,
    required bool isLoadingSchedule,
    required bool isLoadingReviews,
    required String? errorDoctor,
    required String? errorSchedule,
    required String? errorReviews,
    required int reviewsPage,
    required String reviewsSortBy,
    required String reviewsSortOrder,
    String? specialtyName,
  }) = _DoctorDetailsState;

  factory DoctorDetailsState.initial() => const DoctorDetailsState(
    doctor: null,
    schedule: [],
    reviews: [],
    reviewsPagination: null,
    isLoadingDoctor: false,
    isLoadingSchedule: false,
    isLoadingReviews: false,
    errorDoctor: null,
    errorSchedule: null,
    errorReviews: null,
    reviewsPage: 1,
    reviewsSortBy: 'date',
    reviewsSortOrder: 'desc',
  );
}
