import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/core/error/failures.dart';
import 'package:test_task/domain/usecases/auth/login_params.dart';
import 'package:test_task/presentation/features/auth/auth_cubit.dart';
import 'package:test_task/presentation/features/auth/auth_state.dart';
import 'package:test_task/presentation/features/auth/login_screen.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/mocks.dart';

void main() {
  late MockAuthCubit authCubit;

  setUpAll(registerUseCaseFallbackValues);

  setUp(() {
    authCubit = MockAuthCubit();
    when(() => authCubit.state).thenReturn(const AuthState.unauthenticated());
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(const AuthState.unauthenticated()),
    );
    when(() => authCubit.close()).thenAnswer((_) async {});
  });

  Widget buildSubject(AuthCubit cubit) {
    return MaterialApp(
      home: BlocProvider<AuthCubit>.value(
        value: cubit,
        child: const LoginScreen(),
      ),
    );
  }

  testWidgets('shows login form with prefilled test credentials', (
    tester,
  ) async {
    await tester.pumpWidget(buildSubject(authCubit));

    expect(find.text('Вход в аккаунт'), findsOneWidget);
    expect(find.text('Войти'), findsOneWidget);
    expect(find.text('Тестовые данные'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));

    final emailField = tester.widget<TextFormField>(
      find.byType(TextFormField).first,
    );
    expect(emailField.controller?.text, testEmail);

    final passwordField = tester.widget<TextFormField>(
      find.byType(TextFormField).last,
    );
    expect(passwordField.controller?.text, testPassword);
  });

  testWidgets('shows validation error when email is empty', (tester) async {
    await tester.pumpWidget(buildSubject(authCubit));

    await tester.enterText(find.byType(TextFormField).first, '');
    await tester.tap(find.text('Войти'));
    await tester.pumpAndSettle();

    expect(find.text('Введите email'), findsOneWidget);
    verifyNever(() => authCubit.login(any(), any()));
  });

  testWidgets('calls login on valid submit', (tester) async {
    when(
      () => authCubit.login(testEmail, testPassword),
    ).thenAnswer((_) async {});

    await tester.pumpWidget(buildSubject(authCubit));
    await tester.tap(find.text('Войти'));
    await tester.pumpAndSettle();

    verify(() => authCubit.login(testEmail, testPassword)).called(1);
  });

  testWidgets('shows loading indicator while login is in progress', (
    tester,
  ) async {
    when(() => authCubit.state).thenReturn(const AuthState.loading());
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(const AuthState.loading()),
    );

    await tester.pumpWidget(buildSubject(authCubit));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows snackbar on login error', (tester) async {
    final loginUseCase = MockLoginUseCase();
    final logoutUseCase = MockLogoutUseCase();
    final appTalker = MockAppTalker();
    when(() => appTalker.talker).thenReturn(createTestTalker());

    when(
      () => loginUseCase(
        const LoginParams(email: testEmail, password: testPassword),
      ),
    ).thenAnswer(
      (_) async => left(const AuthFailure('Неверный email или пароль')),
    );

    final cubit = AuthCubit(
      loginUseCase,
      logoutUseCase,
      appTalker,
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(buildSubject(cubit));
    await tester.tap(find.text('Войти'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Неверный email или пароль'), findsOneWidget);
  });
}
