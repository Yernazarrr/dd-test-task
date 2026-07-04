// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginRoute,
  $doctorsRoute,
  $doctorDetailsRoute,
  $profileRoute,
];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  name: 'login',
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorsRoute => GoRouteData.$route(
  path: '/',
  name: 'doctors',
  factory: $DoctorsRoute._fromState,
);

mixin $DoctorsRoute on GoRouteData {
  static DoctorsRoute _fromState(GoRouterState state) => const DoctorsRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $doctorDetailsRoute => GoRouteData.$route(
  path: '/doctor/:id',
  name: 'doctor_details',
  factory: $DoctorDetailsRoute._fromState,
);

mixin $DoctorDetailsRoute on GoRouteData {
  static DoctorDetailsRoute _fromState(GoRouterState state) =>
      DoctorDetailsRoute(id: state.pathParameters['id']!);

  DoctorDetailsRoute get _self => this as DoctorDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/doctor/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile',
  name: 'profile',
  factory: $ProfileRoute._fromState,
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
