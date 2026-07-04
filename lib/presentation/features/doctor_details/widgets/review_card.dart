import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        '${review.date.day.toString().padLeft(2, '0')}.${review.date.month.toString().padLeft(2, '0')}.${review.date.year}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.patientName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(5, (starIndex) {
              return Icon(
                Icons.star_rounded,
                size: 16,
                color: starIndex < review.rating
                    ? Colors.amber
                    : Colors.grey[200],
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textDark,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
