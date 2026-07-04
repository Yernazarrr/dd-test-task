import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/helper.dart';
import '../../../../domain/models/doctor.dart';
import '../../../core/rating_badge.dart';

class DoctorInfoCard extends StatelessWidget {
  final Doctor doctor;
  final String? specialtyName;

  const DoctorInfoCard({
    super.key,
    required this.doctor,
    this.specialtyName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: doctor.avatar,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.person, size: 40, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  if (specialtyName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      specialtyName!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryTeal,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      RatingBadge(
                        rating: doctor.rating,
                        reviewCount: doctor.reviewCount,
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.history_rounded,
                        size: 16,
                        color: AppTheme.textMuted,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Стаж ${formatExperienceYears(doctor.experience)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Стоимость приема:',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      Text(
                        '${doctor.price} ₸',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryTeal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
