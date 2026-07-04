import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/logging/talker_module.dart';
import '../../../core/usecase/usecase.dart';
import '../../../domain/usecases/auth/login_params.dart';
import '../../../domain/usecases/auth/login_use_case.dart';
import '../../../domain/usecases/auth/logout_use_case.dart';
import 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final AppTalker _logger;

  AuthCubit(
    this._loginUseCase,
    this._logoutUseCase,
    this._logger,
  ) : super(const AuthState.initial());

  Future<void> appStarted() async {
    _logger.info('[Auth] App started, waiting for manual login');
    emit(const AuthState.unauthenticated());
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    _logger.info('[Auth] Login attempt for $email');

    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );
    result.fold(
      (failure) {
        _logger.error('[Auth] Login failed: ${failure.message}');
        emit(AuthState.error(failure.message));
      },
      (user) {
        _logger.success('[Auth] Login successful for ${user.email}');
        emit(AuthState.authenticated(user));
      },
    );
  }

  Future<void> logout() async {
    _logger.info('[Auth] Logout requested');
    final result = await _logoutUseCase(const NoParams());
    result.fold(
      (failure) {
        _logger.error('[Auth] Logout failed: ${failure.message}');
        emit(AuthState.error(failure.message));
      },
      (_) {
        _logger.success('[Auth] Logout successful');
        emit(const AuthState.unauthenticated());
      },
    );
  }
}
