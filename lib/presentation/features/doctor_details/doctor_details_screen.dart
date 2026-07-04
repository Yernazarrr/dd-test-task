import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/models/slot.dart';
import '../../core/error_view.dart';
import '../booking/booking_bottom_sheet.dart';
import 'doctor_details_cubit.dart';
import 'doctor_details_state.dart';
import 'widgets/doctor_about_section.dart';
import 'widgets/doctor_info_card.dart';
import 'widgets/doctor_reviews_section.dart';
import 'widgets/doctor_schedule_grid.dart';
import 'widgets/section_header.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  late final DoctorDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<DoctorDetailsCubit>();
    unawaited(_cubit.init(widget.doctorId));
  }

  @override
  void dispose() {
    unawaited(_cubit.close());
    super.dispose();
  }

  Future<void> _onBookSlot(
    BuildContext context,
    Slot slot,
    String doctorName,
  ) async {
    final success = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookingBottomSheet(
        slot: slot,
        doctorName: doctorName,
      ),
    );

    if (success == true) {
      await _cubit.init(widget.doctorId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        body: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
          builder: (context, state) {
            if (state.isLoadingDoctor && state.doctor == null) {
              return const Center(
                child: CircularProgressIndicator(color: AppTheme.primaryTeal),
              );
            }

            if (state.errorDoctor != null && state.doctor == null) {
              return Scaffold(
                appBar: AppBar(title: const Text('Детали')),
                body: ErrorView(
                  message: state.errorDoctor!,
                  onRetry: () => _cubit.init(widget.doctorId),
                ),
              );
            }

            final doctor = state.doctor;
            if (doctor == null) {
              return const Center(child: Text('Информация отсутствует'));
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 140,
                  pinned: true,
                  backgroundColor: AppTheme.bgLight,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      doctor.name.split(' ').take(2).join(' '),
                      style: const TextStyle(
                        color: AppTheme.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(left: 56, bottom: 14),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: DoctorInfoCard(
                      doctor: doctor,
                      specialtyName: state.specialtyName,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DoctorAboutSection(doctor: doctor),
                        const SectionHeader(
                          title: 'Доступное расписание (неделя)',
                        ),
                        const SizedBox(height: 12),
                        DoctorScheduleGrid(
                          isLoading: state.isLoadingSchedule,
                          errorMessage: state.errorSchedule,
                          schedule: state.schedule,
                          onSlotSelected: (slot) =>
                              _onBookSlot(context, slot, doctor.name),
                        ),
                        const SizedBox(height: 24),
                        const SectionHeader(title: 'Отзывы пациентов'),
                        const SizedBox(height: 12),
                        DoctorReviewsSection(
                          isLoading: state.isLoadingReviews,
                          errorMessage: state.errorReviews,
                          reviews: state.reviews,
                          pagination: state.reviewsPagination,
                          reviewsSortBy: state.reviewsSortBy,
                          reviewsSortOrder: state.reviewsSortOrder,
                          onSortChanged: (option) {
                            unawaited(
                              _cubit.updateReviewsSort(
                                widget.doctorId,
                                option['field']!,
                                option['order']!,
                              ),
                            );
                          },
                          onLoadMore: () =>
                              _cubit.loadMoreReviews(widget.doctorId),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 64)),
              ],
            );
          },
        ),
      ),
    );
  }
}
