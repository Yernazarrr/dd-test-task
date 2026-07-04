import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/helper.dart';
import '../../domain/models/doctor.dart';
import 'rating_badge.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final String specialtyName;

  const DoctorCard({
    super.key,
    required this.doctor,
    required this.specialtyName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => DoctorDetailsRoute(id: doctor.id).push<void>(context),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: doctor.avatar,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.person, color: Colors.grey),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.person, color: Colors.grey),
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          specialtyName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.primaryTeal,
                          ),
                        ),
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
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Прием',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  Text(
                    '${doctor.price} ₸',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                ],
              ),
              if (doctor.todaySlots.isNotEmpty) ...[
                const SizedBox(height: 12),
                const Text(
                  'Свободное время сегодня:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textMuted,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 32,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctor.todaySlots.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 6),
                    itemBuilder: (context, index) {
                      final slot = doctor.todaySlots[index];
                      // Format slot start time (e.g. 14:30)
                      final timeText =
                          '${slot.startTime.hour.toString().padLeft(2, '0')}:${slot.startTime.minute.toString().padLeft(2, '0')}';
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryLight,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.primaryTeal.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            timeText,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryTealDark,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
