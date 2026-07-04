import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/core/error/failures.dart';
import 'package:test_task/data/models/doctor_dto.dart';
import 'package:test_task/data/repositories/doctors_repository_impl.dart';
import 'package:test_task/domain/models/doctor.dart';
import 'package:test_task/domain/models/paginated_results.dart';

import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockApiClient apiClient;
  late MockLocalStorage localStorage;
  late DoctorsRepositoryImpl repository;

  setUp(() {
    apiClient = MockApiClient();
    localStorage = MockLocalStorage();
    repository = DoctorsRepositoryImpl(apiClient, localStorage);
  });

  group('getDoctors', () {
    test('returns doctors from api and caches first page', () async {
      when(
        () => apiClient.getDoctors(
          page: 1,
          search: '',
          sortBy: 'rating',
          sortOrder: 'desc',
        ),
      ).thenAnswer(
        (_) async => const DoctorsResponseDto(
          doctors: [testDoctorDto],
          pagination: testPaginationDto,
        ),
      );
      when(
        () => localStorage.cacheDoctors([testDoctorDto]),
      ).thenAnswer((_) async {});

      final result = await repository.getDoctors(
        page: 1,
        search: '',
        sortBy: 'rating',
        sortOrder: 'desc',
      );

      expect(result, Right<Failure, PaginatedDoctors>(testPaginatedDoctors));
      verify(() => localStorage.cacheDoctors([testDoctorDto])).called(1);
    });

    test('returns cached doctors with isFromCache on network error', () async {
      when(
        () => apiClient.getDoctors(
          page: 1,
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/doctors'),
          type: DioExceptionType.connectionError,
        ),
      );
      when(() => localStorage.getCachedDoctors()).thenReturn([testDoctorDto]);

      final result = await repository.getDoctors(page: 1);

      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Expected right'),
        (data) {
          expect(data.isFromCache, true);
          expect(data.doctors, [testDoctor]);
        },
      );
    });
  });

  group('getDoctorDetails', () {
    test('returns failure for empty id', () async {
      final result = await repository.getDoctorDetails('');

      expect(
        result,
        const Left<Failure, Doctor>(
          ServerFailure('Некорректный идентификатор врача'),
        ),
      );
      verifyNever(() => apiClient.getDoctorDetails(any()));
    });
  });
}
