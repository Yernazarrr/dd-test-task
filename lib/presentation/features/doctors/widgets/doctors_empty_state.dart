import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class DoctorsEmptyState extends StatelessWidget {
  const DoctorsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          const Text(
            'Врачи не найдены',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Попробуйте изменить параметры поиска или фильтров',
            style: TextStyle(color: AppTheme.textMuted),
          ),
        ],
      ),
    );
  }
}
