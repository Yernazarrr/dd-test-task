import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/pagination.dart';
import '../../../../domain/models/review.dart';
import 'review_card.dart';

class DoctorReviewsSection extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final List<Review> reviews;
  final Pagination? pagination;
  final String reviewsSortBy;
  final String reviewsSortOrder;
  final ValueChanged<Map<String, String>> onSortChanged;
  final VoidCallback onLoadMore;

  const DoctorReviewsSection({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.reviews,
    required this.pagination,
    required this.reviewsSortBy,
    required this.reviewsSortOrder,
    required this.onSortChanged,
    required this.onLoadMore,
  });

  static const _sortOptions = [
    {'field': 'date', 'order': 'desc', 'label': 'Новые'},
    {'field': 'date', 'order': 'asc', 'label': 'Старые'},
    {'field': 'rating', 'order': 'desc', 'label': 'Рейтинг (выс.)'},
    {'field': 'rating', 'order': 'asc', 'label': 'Рейтинг (низ.)'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _sortOptions.map((option) {
              final isSelected =
                  reviewsSortBy == option['field'] &&
                  reviewsSortOrder == option['order'];
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ChoiceChip(
                  label: Text(option['label']!),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      onSortChanged(option);
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 12),
        _buildReviewsList(),
      ],
    );
  }

  Widget _buildReviewsList() {
    if (isLoading && reviews.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(color: AppTheme.primaryTeal),
        ),
      );
    }

    if (errorMessage != null && reviews.isEmpty) {
      return Text(
        'Не удалось загрузить отзывы: $errorMessage',
        style: const TextStyle(color: Colors.redAccent),
      );
    }

    if (reviews.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            'Отзывов пока нет',
            style: TextStyle(color: AppTheme.textMuted),
          ),
        ),
      );
    }

    final hasNext = pagination?.hasNext == true;

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) => ReviewCard(review: reviews[index]),
        ),
        if (hasNext) ...[
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: isLoading ? null : onLoadMore,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: AppTheme.primaryTeal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.primaryTeal,
                        ),
                      ),
                    )
                  : const Text(
                      'Загрузить еще отзывы',
                      style: TextStyle(
                        color: AppTheme.primaryTeal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ],
    );
  }
}
