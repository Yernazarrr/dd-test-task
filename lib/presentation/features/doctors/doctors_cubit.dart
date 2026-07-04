import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../../domain/usecases/doctors/get_doctors_use_case.dart';
import '../../../domain/usecases/doctors/get_specialties_use_case.dart';
import 'doctors_state.dart';

@injectable
class DoctorsCubit extends Cubit<DoctorsState> {
  final GetDoctorsUseCase _getDoctorsUseCase;
  final GetSpecialtiesUseCase _getSpecialtiesUseCase;

  DoctorsCubit(
    this._getDoctorsUseCase,
    this._getSpecialtiesUseCase,
  ) : super(DoctorsState.initial());

  Future<void> init() async {
    emit(
      state.copyWith(
        isLoadingDoctors: true,
        isLoadingSpecialties: true,
        errorMessage: null,
      ),
    );
    await loadSpecialties();
    await loadDoctors(refresh: true);
  }

  Future<void> loadSpecialties() async {
    emit(state.copyWith(isLoadingSpecialties: true, errorMessage: null));
    final result = await _getSpecialtiesUseCase(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingSpecialties: false,
          errorMessage: failure.message,
        ),
      ),
      (specialties) => emit(
        state.copyWith(
          isLoadingSpecialties: false,
          specialties: specialties,
        ),
      ),
    );
  }

  Future<void> loadDoctors({bool refresh = false}) async {
    if (state.isLoadingDoctors && !refresh) return;

    final targetPage = refresh ? 1 : state.currentPage + 1;

    emit(
      state.copyWith(
        isLoadingDoctors: true,
        errorMessage: null,
        currentPage: refresh ? 1 : state.currentPage,
        doctors: refresh ? [] : state.doctors,
      ),
    );

    final result = await _getDoctorsUseCase(
      GetDoctorsParams(
        page: targetPage,
        search: state.search,
        specialty: state.selectedSpecialtyId,
        minRating: state.minRating,
        sortBy: state.sortBy,
        sortOrder: state.sortOrder,
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoadingDoctors: false,
            errorMessage: failure.message,
            isOffline: failure is NetworkFailure,
          ),
        );
      },
      (data) {
        final newDoctors = data.doctors;
        final pagination = data.pagination;

        emit(
          state.copyWith(
            isLoadingDoctors: false,
            doctors: refresh ? newDoctors : [...state.doctors, ...newDoctors],
            currentPage: pagination.page,
            hasNextPage: pagination.hasNext,
            isOffline: data.isFromCache,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> updateSearch(String query) async {
    if (state.search == query) return;
    emit(state.copyWith(search: query));
    await loadDoctors(refresh: true);
  }

  Future<void> selectSpecialty(String? specialtyId) async {
    if (state.selectedSpecialtyId == specialtyId) return;
    emit(state.copyWith(selectedSpecialtyId: specialtyId));
    await loadDoctors(refresh: true);
  }

  Future<void> updateMinRating(double? rating) async {
    if (state.minRating == rating) return;
    emit(state.copyWith(minRating: rating));
    await loadDoctors(refresh: true);
  }

  Future<void> updateSort(String field, String order) async {
    if (state.sortBy == field && state.sortOrder == order) return;
    emit(state.copyWith(sortBy: field, sortOrder: order));
    await loadDoctors(refresh: true);
  }

  Future<void> loadMore() async {
    if (!state.isLoadingDoctors && state.hasNextPage) {
      await loadDoctors();
    }
  }
}
