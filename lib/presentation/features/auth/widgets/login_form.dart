import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final bool obscurePassword;
  final VoidCallback onTogglePasswordVisibility;
  final Future<void> Function() onSubmit;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.obscurePassword,
    required this.onTogglePasswordVisibility,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppTheme.primaryLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_hospital_rounded,
              size: 48,
              color: AppTheme.primaryTeal,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Вход в аккаунт',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Войдите, чтобы записаться к врачу',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: AppTheme.textMuted),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            enabled: !isLoading,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Введите email';
              }
              if (!value.contains('@')) {
                return 'Введите корректный email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
            enabled: !isLoading,
            onFieldSubmitted: (_) => unawaited(onSubmit()),
            decoration: InputDecoration(
              labelText: 'Пароль',
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: isLoading ? null : onTogglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите пароль';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: isLoading ? null : () => unawaited(onSubmit()),
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Войти'),
            ),
          ),
        ],
      ),
    );
  }
}
