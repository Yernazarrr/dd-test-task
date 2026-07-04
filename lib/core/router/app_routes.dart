import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/auth/login_screen.dart';
import '../../presentation/features/auth/profile_screen.dart';
import '../../presentation/features/doctor_details/doctor_details_screen.dart';
import '../../presentation/features/doctors/doctors_screen.dart';

part 'app_routes.g.dart';

@TypedGoRoute<LoginRoute>(
  path: '/login',
  name: 'login',
)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<DoctorsRoute>(
  path: '/',
  name: 'doctors',
)
class DoctorsRoute extends GoRouteData with $DoctorsRoute {
  const DoctorsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DoctorsScreen();
  }
}

@TypedGoRoute<DoctorDetailsRoute>(
  path: '/doctor/:id',
  name: 'doctor_details',
)
class DoctorDetailsRoute extends GoRouteData with $DoctorDetailsRoute {
  const DoctorDetailsRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (id.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('Врач не найден')),
      );
    }

    return DoctorDetailsScreen(doctorId: id);
  }
}

@TypedGoRoute<ProfileRoute>(
  path: '/profile',
  name: 'profile',
)
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}
