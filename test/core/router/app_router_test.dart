import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/core/di/injection.dart';
import 'package:test_task/core/router/app_router.dart';
import 'package:test_task/core/router/app_routes.dart';
import 'package:test_task/presentation/features/auth/auth_cubit.dart';
import 'package:test_task/presentation/features/auth/auth_state.dart';

import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockAuthCubit authCubit;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
  });

  tearDownAll(() async {
    await GetIt.instance.reset();
  });

  setUp(() {
    authCubit = MockAuthCubit();
    when(() => authCubit.close()).thenAnswer((_) async {});
  });

  testWidgets('shows login screen for unauthenticated user', (tester) async {
    when(() => authCubit.state).thenReturn(const AuthState.unauthenticated());
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(const AuthState.unauthenticated()),
    );

    final router = createAppRouter(authCubit);

    await tester.pumpWidget(
      BlocProvider<AuthCubit>.value(
        value: authCubit,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Вход в аккаунт'), findsOneWidget);
    expect(find.text('Войти'), findsOneWidget);
  });

  testWidgets('redirects authenticated user from login to home', (
    tester,
  ) async {
    when(() => authCubit.state).thenReturn(AuthState.authenticated(testUser));
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(AuthState.authenticated(testUser)),
    );

    final router = createAppRouter(authCubit);

    await tester.pumpWidget(
      BlocProvider<AuthCubit>.value(
        value: authCubit,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    router.go(const LoginRoute().location);
    await tester.pumpAndSettle();

    expect(router.state.matchedLocation, const DoctorsRoute().location);
  });

  testWidgets('redirects unauthenticated user from profile to login', (
    tester,
  ) async {
    when(() => authCubit.state).thenReturn(const AuthState.unauthenticated());
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(const AuthState.unauthenticated()),
    );

    final router = createAppRouter(authCubit);

    await tester.pumpWidget(
      BlocProvider<AuthCubit>.value(
        value: authCubit,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    router.go(const ProfileRoute().location);
    await tester.pumpAndSettle();

    expect(find.text('Вход в аккаунт'), findsOneWidget);
    expect(find.text('Профиль'), findsNothing);
  });
}
