import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/doctor.dart';
import 'section_header.dart';

class DoctorAboutSection extends StatelessWidget {
  final Doctor doctor;

  const DoctorAboutSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'О враче'),
        const SizedBox(height: 8),
        Text(
          doctor.description,
          style: const TextStyle(
            fontSize: 14,
            color: AppTheme.textDark,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Образование',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          doctor.education,
          style: const TextStyle(fontSize: 14, color: AppTheme.textMuted),
        ),
        if (doctor.achievements.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text(
            'Достижения и регалии',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: doctor.achievements.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textDark,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
