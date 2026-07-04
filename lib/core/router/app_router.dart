import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/auth/auth_cubit.dart';
import '../../presentation/features/auth/auth_state.dart';
import 'app_routes.dart';

class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(AuthCubit authCubit) {
    _subscription = authCubit.stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}

GoRouter createAppRouter(
  AuthCubit authCubit, {
  GlobalKey<NavigatorState>? navigatorKey,
}) {
  final refreshNotifier = _AuthRefreshNotifier(authCubit);
  const loginRoute = LoginRoute();
  const doctorsRoute = DoctorsRoute();

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: loginRoute.location,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authState = authCubit.state;
      final isLoginRoute = state.matchedLocation == loginRoute.location;

      return authState.when(
        initial: () => isLoginRoute ? null : loginRoute.location,
        loading: () => isLoginRoute ? null : loginRoute.location,
        authenticated: (_) => isLoginRoute ? doctorsRoute.location : null,
        unauthenticated: () => isLoginRoute ? null : loginRoute.location,
        error: (_) => isLoginRoute ? null : loginRoute.location,
      );
    },
    routes: $appRoutes,
  );
}
