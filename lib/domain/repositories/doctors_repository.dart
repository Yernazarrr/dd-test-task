import 'package:fpdart/fpdart.dart';

import '../../core/error/failures.dart';
import '../models/doctor.dart';
import '../models/paginated_results.dart';
import '../models/slot.dart';
import '../models/specialty.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, PaginatedDoctors>> getDoctors({
    int? page,
    String? search,
    String? specialty,
    double? minRating,
    String? sortBy,
    String? sortOrder,
  });

  Future<Either<Failure, Doctor>> getDoctorDetails(String id);
  Future<Either<Failure, List<Slot>>> getDoctorSchedule(String id);
  Future<Either<Failure, List<Specialty>>> getSpecialties();

  Future<Either<Failure, PaginatedReviews>> getDoctorReviews({
    required String id,
    int? page,
    String? sortBy,
    String? sortOrder,
  });

  Future<Either<Failure, Unit>> bookAppointment({
    required String scheduleSlotId,
    required String complaints,
    String? chronicDiseases,
    required double height,
    required double weight,
    String? filePath,
  });
}
