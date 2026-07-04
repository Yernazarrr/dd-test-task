import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../models/paginated_results.dart';
import '../../repositories/doctors_repository.dart';

@lazySingleton
class GetDoctorsUseCase implements UseCase<PaginatedDoctors, GetDoctorsParams> {
  const GetDoctorsUseCase(this._repository);

  final DoctorsRepository _repository;

  @override
  Future<Either<Failure, PaginatedDoctors>> call(GetDoctorsParams params) {
    return _repository.getDoctors(
      page: params.page,
      search: params.search,
      specialty: params.specialty,
      minRating: params.minRating,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}

class GetDoctorsParams extends Equatable {
  const GetDoctorsParams({
    this.page,
    this.search,
    this.specialty,
    this.minRating,
    this.sortBy,
    this.sortOrder,
  });

  final int? page;
  final String? search;
  final String? specialty;
  final double? minRating;
  final String? sortBy;
  final String? sortOrder;

  @override
  List<Object?> get props => [
    page,
    search,
    specialty,
    minRating,
    sortBy,
    sortOrder,
  ];
}
