// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/datasources/api_client.dart' as _i333;
import '../../data/datasources/local_storage.dart' as _i333;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/doctors_repository_impl.dart' as _i859;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/repositories/doctors_repository.dart' as _i844;
import '../../domain/usecases/auth/get_me_use_case.dart' as _i698;
import '../../domain/usecases/auth/get_saved_token_use_case.dart' as _i6;
import '../../domain/usecases/auth/login_use_case.dart' as _i629;
import '../../domain/usecases/auth/logout_use_case.dart' as _i635;
import '../../domain/usecases/doctors/book_appointment_use_case.dart' as _i776;
import '../../domain/usecases/doctors/get_doctor_details_use_case.dart'
    as _i460;
import '../../domain/usecases/doctors/get_doctors_use_case.dart' as _i314;
import '../../domain/usecases/doctors/get_reviews_use_case.dart' as _i685;
import '../../domain/usecases/doctors/get_schedule_use_case.dart' as _i547;
import '../../domain/usecases/doctors/get_specialties_use_case.dart' as _i299;
import '../../presentation/features/auth/auth_cubit.dart' as _i46;
import '../../presentation/features/booking/booking_cubit.dart' as _i499;
import '../../presentation/features/doctor_details/doctor_details_cubit.dart'
    as _i1047;
import '../../presentation/features/doctors/doctors_cubit.dart' as _i853;
import '../logging/talker_module.dart' as _i496;
import '../network/dio_client.dart' as _i667;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i496.AppTalker>(() => _i496.AppTalker());
    gh.lazySingleton<_i333.LocalStorage>(
      () => _i333.LocalStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<_i333.LocalStorage>(), gh<_i496.AppTalker>()),
    );
    gh.lazySingleton<_i333.ApiClient>(
      () => registerModule.apiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i844.DoctorsRepository>(
      () => _i859.DoctorsRepositoryImpl(
        gh<_i333.ApiClient>(),
        gh<_i333.LocalStorage>(),
      ),
    );
    gh.lazySingleton<_i1073.AuthRepository>(
      () => _i895.AuthRepositoryImpl(
        gh<_i333.ApiClient>(),
        gh<_i333.LocalStorage>(),
      ),
    );
    gh.lazySingleton<_i698.GetMeUseCase>(
      () => _i698.GetMeUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.lazySingleton<_i6.GetSavedTokenUseCase>(
      () => _i6.GetSavedTokenUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.lazySingleton<_i629.LoginUseCase>(
      () => _i629.LoginUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.lazySingleton<_i635.LogoutUseCase>(
      () => _i635.LogoutUseCase(gh<_i1073.AuthRepository>()),
    );
    gh.lazySingleton<_i776.BookAppointmentUseCase>(
      () => _i776.BookAppointmentUseCase(gh<_i844.DoctorsRepository>()),
    );
    gh.lazySingleton<_i460.GetDoctorDetailsUseCase>(
      () => _i460.GetDoctorDetailsUseCase(gh<_i844.DoctorsRepository>()),
    );
    gh.lazySingleton<_i314.GetDoctorsUseCase>(
      () => _i314.GetDoctorsUseCase(gh<_i844.DoctorsRepository>()),
    );
    gh.lazySingleton<_i685.GetReviewsUseCase>(
      () => _i685.GetReviewsUseCase(gh<_i844.DoctorsRepository>()),
    );
    gh.lazySingleton<_i547.GetScheduleUseCase>(
      () => _i547.GetScheduleUseCase(gh<_i844.DoctorsRepository>()),
    );
    gh.lazySingleton<_i299.GetSpecialtiesUseCase>(
      () => _i299.GetSpecialtiesUseCase(gh<_i844.DoctorsRepository>()),
    );
    gh.lazySingleton<_i46.AuthCubit>(
      () => _i46.AuthCubit(
        gh<_i629.LoginUseCase>(),
        gh<_i635.LogoutUseCase>(),
        gh<_i496.AppTalker>(),
      ),
    );
    gh.factory<_i1047.DoctorDetailsCubit>(
      () => _i1047.DoctorDetailsCubit(
        gh<_i460.GetDoctorDetailsUseCase>(),
        gh<_i547.GetScheduleUseCase>(),
        gh<_i685.GetReviewsUseCase>(),
        gh<_i299.GetSpecialtiesUseCase>(),
      ),
    );
    gh.factory<_i853.DoctorsCubit>(
      () => _i853.DoctorsCubit(
        gh<_i314.GetDoctorsUseCase>(),
        gh<_i299.GetSpecialtiesUseCase>(),
      ),
    );
    gh.factory<_i499.BookingCubit>(
      () => _i499.BookingCubit(gh<_i776.BookAppointmentUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i667.RegisterModule {}
