import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class DoctorsSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClear;

  const DoctorsSearchField({
    super.key,
    required this.controller,
    required this.onSearchChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, child) {
          return TextField(
            controller: controller,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Поиск по имени врача...',
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppTheme.textMuted,
              ),
              suffixIcon: value.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear_rounded,
                        color: AppTheme.textMuted,
                      ),
                      onPressed: onClear,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
