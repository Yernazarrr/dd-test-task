import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../data/datasources/api_client.dart';
import '../../data/datasources/local_storage.dart';
import '../logging/talker_module.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(LocalStorage localStorage, AppTalker appTalker) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://dd-tz-frontend.vercel.app',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = localStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          if (options.data is! FormData) {
            options.headers['Content-Type'] = 'application/json';
          }
          return handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          talker: appTalker.talker,
          settings: TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseTime: true,
            requestPen: talkerRequestPen,
            responsePen: talkerResponsePen,
            errorPen: talkerErrorPen,
            hiddenHeaders: talkerHiddenHeaders,
          ),
        ),
      );
    }

    return dio;
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);
}
