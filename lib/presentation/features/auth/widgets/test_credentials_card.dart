import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class TestCredentialsCard extends StatelessWidget {
  const TestCredentialsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGrey),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Тестовые данные',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Email: test@example.com',
            style: TextStyle(color: AppTheme.textMuted),
          ),
          Text(
            'Пароль: password',
            style: TextStyle(color: AppTheme.textMuted),
          ),
        ],
      ),
    );
  }
}
