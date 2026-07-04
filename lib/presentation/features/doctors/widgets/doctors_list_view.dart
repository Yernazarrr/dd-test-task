import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../domain/models/doctor.dart';
import '../../../../domain/models/specialty.dart';
import '../../../core/doctor_card.dart';

class DoctorsListView extends StatelessWidget {
  final ScrollController scrollController;
  final List<Doctor> doctors;
  final List<Specialty> specialties;
  final bool hasNextPage;
  final Future<void> Function() onRefresh;

  const DoctorsListView({
    super.key,
    required this.scrollController,
    required this.doctors,
    required this.specialties,
    required this.hasNextPage,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppTheme.primaryTeal,
      child: ListView.builder(
        controller: scrollController,
        itemCount: doctors.length + (hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == doctors.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.primaryTeal,
                  ),
                ),
              ),
            );
          }

          final doctor = doctors[index];
          final specialty = specialties.firstWhere(
            (item) => item.id == doctor.specialtyId,
            orElse: () => const Specialty(id: '', name: 'Врач-специалист'),
          );

          return DoctorCard(
            doctor: doctor,
            specialtyName: specialty.name,
          );
        },
      ),
    );
  }
}
