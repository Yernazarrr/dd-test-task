import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/auth_repository.dart';

@lazySingleton
class GetSavedTokenUseCase implements UseCase<String?, NoParams> {
  const GetSavedTokenUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return _repository.getSavedToken();
  }
}
