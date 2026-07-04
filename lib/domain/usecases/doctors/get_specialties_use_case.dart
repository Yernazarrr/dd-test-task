import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../models/specialty.dart';
import '../../repositories/doctors_repository.dart';

@lazySingleton
class GetSpecialtiesUseCase implements UseCase<List<Specialty>, NoParams> {
  const GetSpecialtiesUseCase(this._repository);

  final DoctorsRepository _repository;

  @override
  Future<Either<Failure, List<Specialty>>> call(NoParams params) {
    return _repository.getSpecialties();
  }
}
