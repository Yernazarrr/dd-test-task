import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/presentation/features/auth/auth_cubit.dart';
import 'package:test_task/presentation/features/auth/auth_state.dart';
import 'package:test_task/presentation/features/auth/profile_screen.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/mocks.dart';

void main() {
  late MockAuthCubit authCubit;

  setUp(() {
    authCubit = MockAuthCubit();
    when(() => authCubit.close()).thenAnswer((_) async {});
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<AuthCubit>.value(
        value: authCubit,
        child: const ProfileScreen(),
      ),
    );
  }

  testWidgets('shows user profile when authenticated', (tester) async {
    when(() => authCubit.state).thenReturn(AuthState.authenticated(testUser));
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(AuthState.authenticated(testUser)),
    );

    await tester.pumpWidget(buildSubject());

    expect(find.text('Профиль'), findsOneWidget);
    expect(find.text(testUser.name), findsOneWidget);
    expect(find.text(testUser.email), findsOneWidget);
    expect(find.text('Выйти из аккаунта'), findsOneWidget);
    expect(find.text(testUser.phone), findsOneWidget);
  });

  testWidgets('shows loading indicator while state is loading', (tester) async {
    when(() => authCubit.state).thenReturn(const AuthState.loading());
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(const AuthState.loading()),
    );

    await tester.pumpWidget(buildSubject());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('calls logout after confirmation', (tester) async {
    when(() => authCubit.state).thenReturn(AuthState.authenticated(testUser));
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(AuthState.authenticated(testUser)),
    );
    when(() => authCubit.logout()).thenAnswer((_) async {});

    await tester.pumpWidget(buildSubject());

    await tester.tap(find.text('Выйти из аккаунта'));
    await tester.pumpAndSettle();

    expect(find.text('Выход из аккаунта'), findsOneWidget);

    await tester.tap(find.text('Выйти'));
    await tester.pumpAndSettle();

    verify(() => authCubit.logout()).called(1);
  });

  testWidgets('does not logout when dialog is cancelled', (tester) async {
    when(() => authCubit.state).thenReturn(AuthState.authenticated(testUser));
    when(() => authCubit.stream).thenAnswer(
      (_) => Stream.value(AuthState.authenticated(testUser)),
    );

    await tester.pumpWidget(buildSubject());

    await tester.tap(find.text('Выйти из аккаунта'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Отмена'));
    await tester.pumpAndSettle();

    verifyNever(() => authCubit.logout());
  });
}
