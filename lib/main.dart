import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/di/injection.dart';
import 'core/logging/talker_debug_overlay.dart';
import 'core/logging/talker_module.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'presentation/features/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  final authCubit = getIt<AuthCubit>();
  final appTalker = getIt<AppTalker>();
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final router = createAppRouter(
    authCubit,
    navigatorKey: rootNavigatorKey,
  );

  if (kDebugMode) {
    FlutterError.onError = (details) {
      appTalker.error(
        '[Flutter] ${details.exceptionAsString()}',
        details.exception,
        details.stack,
      );
    };
  }

  unawaited(authCubit.appStarted());
  runApp(
    MyApp(
      authCubit: authCubit,
      appTalker: appTalker,
      router: router,
      rootNavigatorKey: rootNavigatorKey,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  final AppTalker appTalker;
  final GoRouter router;
  final GlobalKey<NavigatorState> rootNavigatorKey;

  const MyApp({
    super.key,
    required this.authCubit,
    required this.appTalker,
    required this.router,
    required this.rootNavigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    final Widget app = MaterialApp.router(
      title: 'DD Frontender Challenge Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      builder: (context, child) {
        final content = child ?? const SizedBox.shrink();
        if (!kDebugMode) return content;
        return TalkerWrapper(
          talker: appTalker.talker,
          options: const TalkerWrapperOptions(
            enableErrorAlerts: true,
          ),
          child: TalkerDebugOverlay(
            talker: appTalker.talker,
            navigatorKey: rootNavigatorKey,
            child: content,
          ),
        );
      },
    );

    return BlocProvider.value(
      value: authCubit,
      child: app,
    );
  }
}
