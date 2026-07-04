import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/slot.dart';

class DoctorScheduleGrid extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final List<Slot> schedule;
  final ValueChanged<Slot> onSlotSelected;

  const DoctorScheduleGrid({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.schedule,
    required this.onSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.primaryTeal),
      );
    }

    if (errorMessage != null) {
      return Text(
        'Не удалось загрузить расписание: $errorMessage',
        style: const TextStyle(color: Colors.redAccent),
      );
    }

    if (schedule.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGrey),
        ),
        child: const Center(
          child: Text(
            'Нет свободных слотов для записи на этой неделе',
            style: TextStyle(color: AppTheme.textMuted),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.2,
      ),
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        final slot = schedule[index];
        final timeText =
            '${slot.startTime.hour.toString().padLeft(2, '0')}:${slot.startTime.minute.toString().padLeft(2, '0')}';
        final dayText = '${slot.startTime.day}/${slot.startTime.month}';

        return InkWell(
          onTap: () => onSlotSelected(slot),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.primaryTeal.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryTealDark,
                  ),
                ),
                Text(
                  dayText,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppTheme.primaryTeal,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
