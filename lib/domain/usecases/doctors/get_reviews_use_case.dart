import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../models/paginated_results.dart';
import '../../repositories/doctors_repository.dart';

@lazySingleton
class GetReviewsUseCase implements UseCase<PaginatedReviews, GetReviewsParams> {
  const GetReviewsUseCase(this._repository);

  final DoctorsRepository _repository;

  @override
  Future<Either<Failure, PaginatedReviews>> call(GetReviewsParams params) {
    return _repository.getDoctorReviews(
      id: params.doctorId,
      page: params.page,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}

class GetReviewsParams extends Equatable {
  const GetReviewsParams({
    required this.doctorId,
    this.page,
    this.sortBy,
    this.sortOrder,
  });

  final String doctorId;
  final int? page;
  final String? sortBy;
  final String? sortOrder;

  @override
  List<Object?> get props => [doctorId, page, sortBy, sortOrder];
}
