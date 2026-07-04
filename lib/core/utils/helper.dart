import 'package:dio/dio.dart';

String extractErrorMessage(DioException e, String fallback) {
  final data = e.response?.data;
  if (data is Map<String, dynamic>) {
    final message = data['message'];
    if (message is String) return message;
  }
  return fallback;
}

bool isNetworkDioException(DioException e) {
  return e.type == DioExceptionType.connectionError ||
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.unknown;
}

bool canUseDoctorsCacheFallback({
  int? page,
  String? search,
  String? specialty,
  double? minRating,
}) {
  return (page == null || page == 1) &&
      (search == null || search.isEmpty) &&
      (specialty == null || specialty.isEmpty) &&
      minRating == null;
}

String formatExperienceYears(int years) {
  if (years % 10 == 1 && years % 100 != 11) {
    return '$years год';
  }
  if ([2, 3, 4].contains(years % 10) && ![12, 13, 14].contains(years % 100)) {
    return '$years года';
  }
  return '$years лет';
}
