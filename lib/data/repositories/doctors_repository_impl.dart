import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../core/utils/helper.dart';
import '../../domain/models/doctor.dart';
import '../../domain/models/paginated_results.dart';
import '../../domain/models/pagination.dart';
import '../../domain/models/slot.dart';
import '../../domain/models/specialty.dart';
import '../../domain/repositories/doctors_repository.dart';
import '../datasources/api_client.dart';
import '../datasources/local_storage.dart';
import '../mappers/entity_mappers.dart';
import '../models/doctor_dto.dart';

@LazySingleton(as: DoctorsRepository)
class DoctorsRepositoryImpl implements DoctorsRepository {
  final ApiClient _apiClient;
  final LocalStorage _localStorage;

  DoctorsRepositoryImpl(this._apiClient, this._localStorage);

  PaginatedDoctors _paginatedDoctorsFromCache(List<DoctorDto> cached) {
    final doctors = cached.map(mapDoctor).toList();
    return PaginatedDoctors(
      doctors: doctors,
      pagination: Pagination(
        page: 1,
        limit: doctors.length,
        total: doctors.length,
        pages: 1,
        hasNext: false,
        hasPrev: false,
      ),
      isFromCache: true,
    );
  }

  @override
  Future<Either<Failure, PaginatedDoctors>> getDoctors({
    int? page,
    String? search,
    String? specialty,
    double? minRating,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _apiClient.getDoctors(
        page: page,
        search: search,
        specialty: specialty,
        minRating: minRating,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      final doctors = response.doctors.map(mapDoctor).toList();
      final pagination = mapPagination(response.pagination);

      if (canUseDoctorsCacheFallback(
        page: page,
        search: search,
        specialty: specialty,
        minRating: minRating,
      )) {
        await _localStorage.cacheDoctors(response.doctors);
      }

      return right(PaginatedDoctors(doctors: doctors, pagination: pagination));
    } on DioException catch (e) {
      if (isNetworkDioException(e) &&
          canUseDoctorsCacheFallback(
            page: page,
            search: search,
            specialty: specialty,
            minRating: minRating,
          )) {
        final cached = _localStorage.getCachedDoctors();
        if (cached != null && cached.isNotEmpty) {
          return right(_paginatedDoctorsFromCache(cached));
        }
        return left(const NetworkFailure('Отсутствует интернет-соединение'));
      }
      return left(
        ServerFailure(
          extractErrorMessage(e, 'Не удалось загрузить список врачей'),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Doctor>> getDoctorDetails(String id) async {
    if (id.isEmpty) {
      return left(const ServerFailure('Некорректный идентификатор врача'));
    }

    try {
      final dto = await _apiClient.getDoctorDetails(id);
      return right(mapDoctor(dto));
    } on DioException catch (e) {
      if (isNetworkDioException(e)) {
        final cached = _localStorage.getCachedDoctors();
        if (cached != null) {
          final matches = cached.where((element) => element.id == id);
          if (matches.isNotEmpty) {
            return right(mapDoctor(matches.first));
          }
        }
        return left(const NetworkFailure('Отсутствует интернет-соединение'));
      }
      return left(
        ServerFailure(
          extractErrorMessage(e, 'Не удалось получить данные врача'),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Slot>>> getDoctorSchedule(String id) async {
    try {
      final list = await _apiClient.getDoctorSchedule(id);
      final slots = list.map(mapSlot).toList();
      return right(slots);
    } on DioException catch (e) {
      return left(
        ServerFailure(
          extractErrorMessage(e, 'Не удалось получить расписание врача'),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Specialty>>> getSpecialties() async {
    try {
      final list = await _apiClient.getSpecialties();
      await _localStorage.cacheSpecialties(list);
      final specialties = list.map(mapSpecialty).toList();
      return right(specialties);
    } on DioException catch (e) {
      if (isNetworkDioException(e)) {
        final cached = _localStorage.getCachedSpecialties();
        if (cached != null && cached.isNotEmpty) {
          final specialties = cached.map(mapSpecialty).toList();
          return right(specialties);
        }
        return left(const NetworkFailure('Отсутствует интернет-соединение'));
      }
      return left(
        ServerFailure(
          extractErrorMessage(e, 'Не удалось загрузить специальности'),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedReviews>> getDoctorReviews({
    required String id,
    int? page,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _apiClient.getDoctorReviews(
        id: id,
        page: page,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
      final reviews = response.reviews.map(mapReview).toList();
      final pagination = mapPagination(response.pagination);
      return right(PaginatedReviews(reviews: reviews, pagination: pagination));
    } on DioException catch (e) {
      return left(
        ServerFailure(
          extractErrorMessage(e, 'Не удалось получить отзывы'),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> bookAppointment({
    required String scheduleSlotId,
    required String complaints,
    String? chronicDiseases,
    required double height,
    required double weight,
    String? filePath,
  }) async {
    try {
      final Map<String, dynamic> fields = {
        'scheduleSlotId': scheduleSlotId,
        'complaints': complaints,
        'height': height,
        'weight': weight,
      };
      if (chronicDiseases != null && chronicDiseases.isNotEmpty) {
        fields['chronicDiseases'] = chronicDiseases;
      }

      final formData = FormData.fromMap(fields);

      if (filePath != null && filePath.isNotEmpty) {
        formData.files.add(
          MapEntry(
            'testResults',
            await MultipartFile.fromFile(
              filePath,
              filename: filePath.split('/').last,
            ),
          ),
        );
      }

      await _apiClient.bookAppointment(formData);
      return right(unit);
    } on DioException catch (e) {
      return left(
        ServerFailure(
          extractErrorMessage(e, 'Не удалось записаться на прием'),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
