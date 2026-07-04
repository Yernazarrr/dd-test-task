import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class BookingSuccessView extends StatelessWidget {
  final String doctorName;

  const BookingSuccessView({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppTheme.primaryLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle_rounded,
            color: AppTheme.primaryTeal,
            size: 64,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Запись успешна!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Вы успешно записаны на прием к врачу $doctorName',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: AppTheme.textMuted),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
