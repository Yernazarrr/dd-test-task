import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/models/specialty.dart';
import '../../../domain/usecases/doctors/get_doctor_details_use_case.dart';
import '../../../domain/usecases/doctors/get_reviews_use_case.dart';
import '../../../domain/usecases/doctors/get_schedule_use_case.dart';
import '../../../domain/usecases/doctors/get_specialties_use_case.dart';
import 'doctor_details_state.dart';

@injectable
class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final GetDoctorDetailsUseCase _getDoctorDetailsUseCase;
  final GetScheduleUseCase _getScheduleUseCase;
  final GetReviewsUseCase _getReviewsUseCase;
  final GetSpecialtiesUseCase _getSpecialtiesUseCase;

  DoctorDetailsCubit(
    this._getDoctorDetailsUseCase,
    this._getScheduleUseCase,
    this._getReviewsUseCase,
    this._getSpecialtiesUseCase,
  ) : super(DoctorDetailsState.initial());

  Future<void> init(String doctorId) async {
    if (doctorId.isEmpty) {
      emit(
        state.copyWith(
          errorDoctor: 'Некорректный идентификатор врача',
        ),
      );
      return;
    }

    await Future.wait([
      loadDoctor(doctorId),
      loadSchedule(doctorId),
      loadReviews(doctorId, refresh: true),
    ]);
  }

  Future<void> loadDoctor(String id) async {
    emit(state.copyWith(isLoadingDoctor: true, errorDoctor: null));
    final result = await _getDoctorDetailsUseCase(
      GetDoctorDetailsParams(doctorId: id),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingDoctor: false,
          errorDoctor: failure.message,
        ),
      ),
      (doctor) {
        emit(
          state.copyWith(
            isLoadingDoctor: false,
            doctor: doctor,
          ),
        );
        unawaited(_resolveSpecialtyName(doctor.specialtyId));
      },
    );
  }

  Future<void> _resolveSpecialtyName(String specialtyId) async {
    final result = await _getSpecialtiesUseCase(const NoParams());
    result.fold(
      (_) {},
      (specialties) {
        final specialty = specialties.firstWhere(
          (item) => item.id == specialtyId,
          orElse: () => const Specialty(id: '', name: 'Врач-специалист'),
        );
        emit(state.copyWith(specialtyName: specialty.name));
      },
    );
  }

  Future<void> loadSchedule(String id) async {
    emit(state.copyWith(isLoadingSchedule: true, errorSchedule: null));
    final result = await _getScheduleUseCase(
      GetScheduleParams(doctorId: id),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingSchedule: false,
          errorSchedule: failure.message,
        ),
      ),
      (schedule) => emit(
        state.copyWith(
          isLoadingSchedule: false,
          schedule: schedule,
        ),
      ),
    );
  }

  Future<void> loadReviews(String id, {bool refresh = false}) async {
    if (state.isLoadingReviews) return;

    final targetPage = refresh ? 1 : state.reviewsPage + 1;

    emit(
      state.copyWith(
        isLoadingReviews: true,
        errorReviews: null,
        reviewsPage: refresh ? 1 : state.reviewsPage,
        reviews: refresh ? [] : state.reviews,
      ),
    );

    final result = await _getReviewsUseCase(
      GetReviewsParams(
        doctorId: id,
        page: targetPage,
        sortBy: state.reviewsSortBy,
        sortOrder: state.reviewsSortOrder,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingReviews: false,
          errorReviews: failure.message,
        ),
      ),
      (data) {
        final newReviews = data.reviews;
        final pagination = data.pagination;
        emit(
          state.copyWith(
            isLoadingReviews: false,
            reviews: refresh ? newReviews : [...state.reviews, ...newReviews],
            reviewsPage: pagination.page,
            reviewsPagination: pagination,
          ),
        );
      },
    );
  }

  Future<void> updateReviewsSort(String id, String field, String order) async {
    if (state.reviewsSortBy == field && state.reviewsSortOrder == order) return;
    emit(state.copyWith(reviewsSortBy: field, reviewsSortOrder: order));
    await loadReviews(id, refresh: true);
  }

  Future<void> loadMoreReviews(String id) async {
    if (!state.isLoadingReviews && state.reviewsPagination?.hasNext == true) {
      await loadReviews(id);
    }
  }
}
