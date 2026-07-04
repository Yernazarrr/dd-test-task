import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_theme.dart';
import 'auth_cubit.dart';
import 'auth_state.dart';
import 'widgets/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выход из аккаунта'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Выйти'),
          ),
        ],
      ),
    );

    if (shouldLogout == true && context.mounted) {
      await context.read<AuthCubit>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () {
              if (context.mounted) {
                const LoginRoute().go(context);
              }
            },
            error: (message) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.redAccent,
                  ),
                );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) => ProfileContent(
              user: user,
              isLoading: false,
              onLogout: () => unawaited(_confirmLogout(context)),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryTeal),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryTeal),
            ),
          );
        },
      ),
    );
  }
}
