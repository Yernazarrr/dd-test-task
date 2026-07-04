import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/api_client.dart';
import '../datasources/local_storage.dart';
import '../mappers/entity_mappers.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final LocalStorage _localStorage;

  AuthRepositoryImpl(this._apiClient, this._localStorage);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await _apiClient.login({
        'email': email,
        'password': password,
      });
      if (response.success) {
        await _localStorage.saveToken(response.token);
        return right(mapUser(response.user));
      } else {
        return left(const AuthFailure('Неверные учетные данные'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        return left(const AuthFailure('Неверный email или пароль'));
      }
      final data = e.response?.data;
      final message = data is Map<String, dynamic>
          ? data['message'] as String?
          : null;

      return left(
        ServerFailure(
          message ?? 'Ошибка авторизации',
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getMe() async {
    try {
      final userDto = await _apiClient.getMe();
      return right(mapUser(userDto));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _localStorage.clearToken();
        return left(const AuthFailure('Сессия истекла'));
      }
      final data = e.response?.data;
      final message = data is Map<String, dynamic>
          ? data['message'] as String?
          : null;
      return left(
        ServerFailure(
          message ?? 'Не удалось получить профиль',
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _localStorage.clearToken();
      return right(unit);
    } catch (e) {
      return left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedToken() async {
    try {
      final token = _localStorage.getToken();
      return right(token);
    } catch (e) {
      return left(CacheFailure(e.toString()));
    }
  }
}
