import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../booking_state.dart';

class BookingFormView extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController complaintsController;
  final TextEditingController diseasesController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final String dateText;
  final String timeText;
  final String? attachedFileName;
  final BookingState state;
  final VoidCallback onClose;
  final VoidCallback onAttachFile;
  final VoidCallback onRemoveFile;
  final Future<void> Function() onSubmit;

  const BookingFormView({
    super.key,
    required this.formKey,
    required this.complaintsController,
    required this.diseasesController,
    required this.heightController,
    required this.weightController,
    required this.dateText,
    required this.timeText,
    required this.attachedFileName,
    required this.state,
    required this.onClose,
    required this.onAttachFile,
    required this.onRemoveFile,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
    final error = state.maybeWhen(error: (message) => message, orElse: () => null);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Запись на прием',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: onClose,
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.primaryTeal.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: AppTheme.primaryTeal,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$dateText в $timeText',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryTealDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: heightController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Рост (см)',
                      hintText: '175',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Укажите рост';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Неверно';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: weightController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Вес (кг)',
                      hintText: '70',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Укажите вес';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Неверно';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: complaintsController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Жалобы пациента',
                hintText: 'Опишите ваши симптомы...',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Пожалуйста, опишите симптомы';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: diseasesController,
              decoration: const InputDecoration(
                labelText: 'Хронические заболевания (опционально)',
                hintText: 'Например: гипертония, диабет',
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: isLoading ? null : onAttachFile,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderGrey),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.attach_file_rounded,
                      color: AppTheme.textMuted,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        attachedFileName ??
                            'Прикрепить результаты анализов (PDF)',
                        style: TextStyle(
                          fontSize: 14,
                          color: attachedFileName != null
                              ? AppTheme.textDark
                              : AppTheme.textMuted,
                          fontWeight: attachedFileName != null
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (attachedFileName != null) ...[
                      IconButton(
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: AppTheme.textMuted,
                        ),
                        onPressed: isLoading ? null : onRemoveFile,
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: AppTheme.primaryTeal,
                        size: 20,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (error != null) ...[
              Text(
                error,
                style: const TextStyle(color: Colors.redAccent, fontSize: 13),
              ),
              const SizedBox(height: 12),
            ],
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : () => unawaited(onSubmit()),
                child: isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text('Записаться на прием'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
