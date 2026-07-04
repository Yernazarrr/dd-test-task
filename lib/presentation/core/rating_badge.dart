import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int? reviewCount;

  const RatingBadge({
    super.key,
    required this.rating,
    this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFF1E293B),
          ),
        ),
        if (reviewCount != null) ...[
          const SizedBox(width: 4),
          Text(
            '($reviewCount)',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ],
    );
  }
}
