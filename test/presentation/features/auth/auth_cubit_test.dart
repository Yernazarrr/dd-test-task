import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/core/error/failures.dart';
import 'package:test_task/domain/usecases/auth/login_params.dart';
import 'package:test_task/presentation/features/auth/auth_cubit.dart';
import 'package:test_task/presentation/features/auth/auth_state.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/mocks.dart';

void main() {
  late MockLoginUseCase loginUseCase;
  late MockLogoutUseCase logoutUseCase;
  late MockAppTalker appTalker;
  late AuthCubit cubit;

  setUpAll(registerUseCaseFallbackValues);

  setUp(() {
    loginUseCase = MockLoginUseCase();
    logoutUseCase = MockLogoutUseCase();
    appTalker = MockAppTalker();
    when(() => appTalker.talker).thenReturn(createTestTalker());

    cubit = AuthCubit(
      loginUseCase,
      logoutUseCase,
      appTalker,
    );
  });

  tearDown(() async {
    await cubit.close();
  });

  test('initial state is AuthState.initial', () {
    expect(cubit.state, const AuthState.initial());
  });

  group('appStarted', () {
    blocTest<AuthCubit, AuthState>(
      'emits unauthenticated without restoring saved session',
      build: () => cubit,
      act: (cubit) => cubit.appStarted(),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
    );
  });

  group('login', () {
    blocTest<AuthCubit, AuthState>(
      'emits authenticated on successful login',
      build: () {
        when(
          () => loginUseCase(
            const LoginParams(email: testEmail, password: testPassword),
          ),
        ).thenAnswer((_) async => right(testUser));
        return cubit;
      },
      act: (cubit) => cubit.login(testEmail, testPassword),
      expect: () => [
        const AuthState.loading(),
        AuthState.authenticated(testUser),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits error on failed login',
      build: () {
        when(
          () => loginUseCase(
            const LoginParams(email: testEmail, password: testPassword),
          ),
        ).thenAnswer(
          (_) async => left(const AuthFailure('Неверный email или пароль')),
        );
        return cubit;
      },
      act: (cubit) => cubit.login(testEmail, testPassword),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Неверный email или пароль'),
      ],
    );
  });

  group('logout', () {
    blocTest<AuthCubit, AuthState>(
      'emits unauthenticated on successful logout',
      build: () {
        when(() => logoutUseCase(any())).thenAnswer((_) async => right(unit));
        return cubit;
      },
      act: (cubit) => cubit.logout(),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits error on failed logout',
      build: () {
        when(() => logoutUseCase(any())).thenAnswer(
          (_) async => left(const CacheFailure('Ошибка кэша')),
        );
        return cubit;
      },
      act: (cubit) => cubit.logout(),
      expect: () => [
        const AuthState.error('Ошибка кэша'),
      ],
    );
  });
}
