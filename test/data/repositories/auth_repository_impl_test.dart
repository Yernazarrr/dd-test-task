import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/core/error/failures.dart';
import 'package:test_task/data/repositories/auth_repository_impl.dart';
import 'package:test_task/domain/models/user.dart';

import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockApiClient apiClient;
  late MockLocalStorage localStorage;
  late AuthRepositoryImpl repository;

  setUp(() {
    apiClient = MockApiClient();
    localStorage = MockLocalStorage();
    repository = AuthRepositoryImpl(apiClient, localStorage);
  });

  group('login', () {
    test('returns user and saves token on success', () async {
      when(
        () => apiClient.login({
          'email': testEmail,
          'password': testPassword,
        }),
      ).thenAnswer((_) async => testLoginResponse);
      when(
        () => localStorage.saveToken(testLoginResponse.token),
      ).thenAnswer((_) async {});

      final result = await repository.login(testEmail, testPassword);

      expect(result, Right<Failure, User>(testUser));
      verify(() => localStorage.saveToken(testLoginResponse.token)).called(1);
    });

    test('returns AuthFailure when success is false', () async {
      when(
        () => apiClient.login({
          'email': testEmail,
          'password': testPassword,
        }),
      ).thenAnswer(
        (_) async => testLoginResponse.copyWith(success: false),
      );

      final result = await repository.login(testEmail, testPassword);

      expect(
        result,
        const Left<Failure, User>(AuthFailure('Неверные учетные данные')),
      );
      verifyNever(() => localStorage.saveToken(any()));
    });

    test('returns AuthFailure on 401 DioException', () async {
      when(
        () => apiClient.login({
          'email': testEmail,
          'password': testPassword,
        }),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/auth/login'),
          response: Response(
            requestOptions: RequestOptions(path: '/api/auth/login'),
            statusCode: 401,
          ),
        ),
      );

      final result = await repository.login(testEmail, testPassword);

      expect(
        result,
        const Left<Failure, User>(AuthFailure('Неверный email или пароль')),
      );
    });
  });

  group('getMe', () {
    test('returns user on success', () async {
      when(() => apiClient.getMe()).thenAnswer((_) async => testUserDto);

      final result = await repository.getMe();

      expect(result, Right<Failure, User>(testUser));
    });

    test('clears token and returns AuthFailure on 401', () async {
      when(() => apiClient.getMe()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/auth/me'),
          response: Response(
            requestOptions: RequestOptions(path: '/api/auth/me'),
            statusCode: 401,
          ),
        ),
      );
      when(() => localStorage.clearToken()).thenAnswer((_) async {});

      final result = await repository.getMe();

      expect(result, const Left<Failure, User>(AuthFailure('Сессия истекла')));
      verify(() => localStorage.clearToken()).called(1);
    });
  });

  group('logout', () {
    test('clears token and returns unit', () async {
      when(() => localStorage.clearToken()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, const Right<Failure, Unit>(unit));
      verify(() => localStorage.clearToken()).called(1);
    });
  });

  group('getSavedToken', () {
    test('returns saved token', () async {
      when(() => localStorage.getToken()).thenReturn('saved-token');

      final result = await repository.getSavedToken();

      expect(result, const Right<Failure, String?>('saved-token'));
    });

    test('returns null when token is missing', () async {
      when(() => localStorage.getToken()).thenReturn(null);

      final result = await repository.getSavedToken();

      expect(result, const Right<Failure, String?>(null));
    });
  });
}
