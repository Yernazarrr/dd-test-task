import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/specialty.dart';
import '../doctors_cubit.dart';
import '../doctors_state.dart';

class DoctorsFilterBar extends StatelessWidget {
  const DoctorsFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        final cubit = context.read<DoctorsCubit>();

        final selectedSpecialty = state.specialties.firstWhere(
          (item) => item.id == state.selectedSpecialtyId,
          orElse: () => const Specialty(id: '', name: 'Все специальности'),
        );

        var sortLabel = 'Сортировка';
        if (state.sortBy == 'rating') sortLabel = 'По рейтингу';
        if (state.sortBy == 'experience') sortLabel = 'По стажу';
        if (state.sortBy == 'price') sortLabel = 'По цене';
        if (state.sortBy == 'name') sortLabel = 'По имени';

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                FilterChip(
                  label: Text(
                    state.selectedSpecialtyId == null
                        ? 'Специальность'
                        : selectedSpecialty.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  selected: state.selectedSpecialtyId != null,
                  onSelected: (_) async =>
                      _showSpecialtySheet(context, state, cubit),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    state.minRating == null
                        ? 'Рейтинг'
                        : 'От ${state.minRating} ★',
                  ),
                  selected: state.minRating != null,
                  onSelected: (_) async =>
                      _showRatingSheet(context, state, cubit),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(sortLabel),
                      const SizedBox(width: 4),
                      Icon(
                        state.sortOrder == 'asc'
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        size: 14,
                      ),
                    ],
                  ),
                  selected: state.sortBy != 'rating' || state.sortOrder != 'desc',
                  onSelected: (_) async => _showSortSheet(context, state, cubit),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSpecialtySheet(
    BuildContext context,
    DoctorsState state,
    DoctorsCubit cubit,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final sheetHeight = MediaQuery.sizeOf(context).height * 0.55;

        return SafeArea(
          child: SizedBox(
            height: sheetHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Выберите специальность',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text('Все специальности'),
                        trailing: state.selectedSpecialtyId == null
                            ? const Icon(Icons.check, color: AppTheme.primaryTeal)
                            : null,
                        onTap: () {
                          unawaited(cubit.selectSpecialty(null));
                          Navigator.pop(context);
                        },
                      ),
                      ...state.specialties.map((specialty) {
                        final isSelected =
                            state.selectedSpecialtyId == specialty.id;
                        return ListTile(
                          title: Text(specialty.name),
                          trailing: isSelected
                              ? const Icon(
                                  Icons.check,
                                  color: AppTheme.primaryTeal,
                                )
                              : null,
                          onTap: () {
                            unawaited(cubit.selectSpecialty(specialty.id));
                            Navigator.pop(context);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showRatingSheet(
    BuildContext context,
    DoctorsState state,
    DoctorsCubit cubit,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Минимальный рейтинг',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [null, 3.0, 4.0, 4.5].map((value) {
                    final isSelected = state.minRating == value;
                    final text = value == null ? 'Все' : '$value+ ★';
                    return ChoiceChip(
                      label: Text(text),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          unawaited(cubit.updateMinRating(value));
                          Navigator.pop(context);
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSortSheet(
    BuildContext context,
    DoctorsState state,
    DoctorsCubit cubit,
  ) async {
    const sortOptions = [
      {'field': 'rating', 'label': 'Рейтинг'},
      {'field': 'experience', 'label': 'Стаж работы'},
      {'field': 'price', 'label': 'Стоимость консультации'},
      {'field': 'name', 'label': 'Имя врача'},
    ];

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final sheetHeight = MediaQuery.sizeOf(context).height * 0.45;

        return SafeArea(
          child: SizedBox(
            height: sheetHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Сортировка списка',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    children: [
                      ...sortOptions.map((option) {
                        final field = option['field']!;
                        final isSelectedField = state.sortBy == field;

                        return ListTile(
                          title: Text(option['label']!),
                          subtitle: isSelectedField
                              ? Text(
                                  state.sortOrder == 'desc'
                                      ? 'По убыванию'
                                      : 'По возрастанию',
                                )
                              : null,
                          trailing: isSelectedField
                              ? IconButton(
                                  icon: Icon(
                                    state.sortOrder == 'desc'
                                        ? Icons.arrow_downward_rounded
                                        : Icons.arrow_upward_rounded,
                                    color: AppTheme.primaryTeal,
                                  ),
                                  onPressed: () {
                                    final nextOrder = state.sortOrder == 'desc'
                                        ? 'asc'
                                        : 'desc';
                                    unawaited(cubit.updateSort(field, nextOrder));
                                    Navigator.pop(context);
                                  },
                                )
                              : null,
                          onTap: () {
                            final order = isSelectedField
                                ? (state.sortOrder == 'desc' ? 'asc' : 'desc')
                                : 'desc';
                            unawaited(cubit.updateSort(field, order));
                            Navigator.pop(context);
                          },
                        );
                      }),
                    ],
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
