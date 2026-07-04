import 'package:fpdart/fpdart.dart';

import '../../core/error/failures.dart';
import '../models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> getMe();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, String?>> getSavedToken();
}
