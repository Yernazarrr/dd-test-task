import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/core/error/failures.dart';
import 'package:test_task/domain/usecases/doctors/get_doctors_use_case.dart';
import 'package:test_task/presentation/features/doctors/doctors_cubit.dart';
import 'package:test_task/presentation/features/doctors/doctors_state.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/mocks.dart';

void main() {
  late MockGetDoctorsUseCase getDoctorsUseCase;
  late MockGetSpecialtiesUseCase getSpecialtiesUseCase;
  late DoctorsCubit cubit;

  setUpAll(registerUseCaseFallbackValues);

  setUp(() {
    getDoctorsUseCase = MockGetDoctorsUseCase();
    getSpecialtiesUseCase = MockGetSpecialtiesUseCase();
    cubit = DoctorsCubit(getDoctorsUseCase, getSpecialtiesUseCase);
  });

  tearDown(() async {
    await cubit.close();
  });

  blocTest<DoctorsCubit, DoctorsState>(
    'init loads specialties and doctors',
    build: () {
      when(() => getSpecialtiesUseCase(any())).thenAnswer(
        (_) async => right([testSpecialty]),
      );
      when(
        () => getDoctorsUseCase(
          const GetDoctorsParams(
            page: 1,
            search: '',
            sortBy: 'rating',
            sortOrder: 'desc',
          ),
        ),
      ).thenAnswer((_) async => right(testPaginatedDoctors));
      return cubit;
    },
    act: (cubit) => cubit.init(),
    expect: () => [
      isA<DoctorsState>().having(
        (s) => s.isLoadingSpecialties,
        'loading specialties',
        true,
      ).having((s) => s.isLoadingDoctors, 'loading doctors', true),
      isA<DoctorsState>()
          .having((s) => s.specialties, 'specialties', [testSpecialty])
          .having((s) => s.isLoadingSpecialties, 'specialties loaded', false)
          .having((s) => s.isLoadingDoctors, 'still loading doctors', true),
      isA<DoctorsState>()
          .having((s) => s.doctors, 'doctors', [testDoctor])
          .having((s) => s.isOffline, 'offline', false),
    ],
  );

  blocTest<DoctorsCubit, DoctorsState>(
    'sets isOffline when doctors are loaded from cache',
    build: () {
      when(
        () => getDoctorsUseCase(
          const GetDoctorsParams(
            page: 1,
            search: '',
            sortBy: 'rating',
            sortOrder: 'desc',
          ),
        ),
      ).thenAnswer((_) async => right(testCachedPaginatedDoctors));
      return cubit;
    },
    act: (cubit) => cubit.loadDoctors(refresh: true),
    expect: () => [
      isA<DoctorsState>().having((s) => s.isLoadingDoctors, 'loading', true),
      isA<DoctorsState>().having((s) => s.isOffline, 'offline', true).having(
        (s) => s.doctors,
        'doctors',
        [testDoctor],
      ),
    ],
  );

  blocTest<DoctorsCubit, DoctorsState>(
    'sets isOffline on network failure',
    build: () {
      when(
        () => getDoctorsUseCase(
          const GetDoctorsParams(
            page: 1,
            search: '',
            sortBy: 'rating',
            sortOrder: 'desc',
          ),
        ),
      ).thenAnswer(
        (_) async =>
            left(const NetworkFailure('Отсутствует интернет-соединение')),
      );
      return cubit;
    },
    act: (cubit) => cubit.loadDoctors(refresh: true),
    expect: () => [
      isA<DoctorsState>().having((s) => s.isLoadingDoctors, 'loading', true),
      isA<DoctorsState>()
          .having((s) => s.isOffline, 'offline', true)
          .having(
            (s) => s.errorMessage,
            'error',
            'Отсутствует интернет-соединение',
          ),
    ],
  );
}
