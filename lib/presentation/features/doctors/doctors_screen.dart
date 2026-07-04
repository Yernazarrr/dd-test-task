import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/utils/debouncer.dart';
import '../../core/error_view.dart';
import '../../core/shimmer_loading.dart';
import 'doctors_cubit.dart';
import 'doctors_state.dart';
import 'widgets/doctors_empty_state.dart';
import 'widgets/doctors_filter_bar.dart';
import 'widgets/doctors_list_view.dart';
import 'widgets/doctors_offline_banner.dart';
import 'widgets/doctors_search_field.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  late final DoctorsCubit _cubit;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _cubit = getIt<DoctorsCubit>();
    unawaited(_cubit.init());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    unawaited(_cubit.close());
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      unawaited(_cubit.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Поиск врача'),
          centerTitle: false,
          actions: [
            IconButton(
              tooltip: 'Профиль',
              icon: const Icon(Icons.person_outline_rounded),
              onPressed: () => const ProfileRoute().push<void>(context),
            ),
          ],
        ),
        body: Column(
          children: [
            DoctorsSearchField(
              controller: _searchController,
              onSearchChanged: (value) {
                _debouncer.run(() => _cubit.updateSearch(value));
              },
              onClear: () {
                _searchController.clear();
                unawaited(_cubit.updateSearch(''));
              },
            ),
            const DoctorsFilterBar(),
            Expanded(
              child: BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  if (state.doctors.isEmpty &&
                      (state.isLoadingDoctors || state.isLoadingSpecialties)) {
                    return const ShimmerLoading();
                  }

                  if (state.errorMessage != null && state.doctors.isEmpty) {
                    return ErrorView(
                      message: state.errorMessage!,
                      onRetry: () => _cubit.loadDoctors(refresh: true),
                    );
                  }

                  if (state.doctors.isEmpty) {
                    return const DoctorsEmptyState();
                  }

                  return Column(
                    children: [
                      if (state.isOffline) const DoctorsOfflineBanner(),
                      Expanded(
                        child: DoctorsListView(
                          scrollController: _scrollController,
                          doctors: state.doctors,
                          specialties: state.specialties,
                          hasNextPage: state.hasNextPage,
                          onRefresh: () => _cubit.loadDoctors(refresh: true),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
