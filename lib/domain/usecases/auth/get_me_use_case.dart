import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../models/user.dart';
import '../../repositories/auth_repository.dart';

@lazySingleton
class GetMeUseCase implements UseCase<User, NoParams> {
  const GetMeUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return _repository.getMe();
  }
}
