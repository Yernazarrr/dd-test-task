import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/doctor.dart';
import '../../../domain/models/specialty.dart';

part 'doctors_state.freezed.dart';

@freezed
abstract class DoctorsState with _$DoctorsState {
  const factory DoctorsState({
    required List<Doctor> doctors,
    required List<Specialty> specialties,
    required bool isLoadingDoctors,
    required bool isLoadingSpecialties,
    required String? errorMessage,
    required int currentPage,
    required bool hasNextPage,
    required String search,
    required String? selectedSpecialtyId,
    required double? minRating,
    required String sortBy,
    required String sortOrder,
    required bool isOffline,
  }) = _DoctorsState;

  factory DoctorsState.initial() => const DoctorsState(
    doctors: [],
    specialties: [],
    isLoadingDoctors: true,
    isLoadingSpecialties: true,
    errorMessage: null,
    currentPage: 1,
    hasNextPage: false,
    search: '',
    selectedSpecialtyId: null,
    minRating: null,
    sortBy: 'rating',
    sortOrder: 'desc',
    isOffline: false,
  );
}
