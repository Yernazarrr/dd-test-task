import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase implements UseCase<Unit, NoParams> {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return _repository.logout();
  }
}
