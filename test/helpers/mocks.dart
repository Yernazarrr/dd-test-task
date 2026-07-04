import 'package:mocktail/mocktail.dart';
import 'package:talker/talker.dart';
import 'package:test_task/core/logging/talker_module.dart';
import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/data/datasources/api_client.dart';
import 'package:test_task/data/datasources/local_storage.dart';
import 'package:test_task/domain/usecases/auth/get_me_use_case.dart';
import 'package:test_task/domain/usecases/auth/get_saved_token_use_case.dart';
import 'package:test_task/domain/usecases/auth/login_params.dart';
import 'package:test_task/domain/usecases/auth/login_use_case.dart';
import 'package:test_task/domain/usecases/auth/logout_use_case.dart';
import 'package:test_task/domain/usecases/doctors/book_appointment_use_case.dart';
import 'package:test_task/domain/usecases/doctors/get_doctors_use_case.dart';
import 'package:test_task/domain/usecases/doctors/get_specialties_use_case.dart';
import 'package:test_task/presentation/features/auth/auth_cubit.dart';

class MockGetSavedTokenUseCase extends Mock implements GetSavedTokenUseCase {}

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockGetMeUseCase extends Mock implements GetMeUseCase {}

class MockGetDoctorsUseCase extends Mock implements GetDoctorsUseCase {}

class MockGetSpecialtiesUseCase extends Mock implements GetSpecialtiesUseCase {}

class MockBookAppointmentUseCase extends Mock
    implements BookAppointmentUseCase {}

class MockApiClient extends Mock implements ApiClient {}

class MockLocalStorage extends Mock implements LocalStorage {}

class MockAuthCubit extends Mock implements AuthCubit {}

class MockAppTalker extends Mock implements AppTalker {}

Talker createTestTalker() =>
    Talker(settings: TalkerSettings(useConsoleLogs: false));

void registerUseCaseFallbackValues() {
  registerFallbackValue(const NoParams());
  registerFallbackValue(const LoginParams(email: '', password: ''));
  registerFallbackValue(const GetDoctorsParams());
  registerFallbackValue(
    const BookAppointmentParams(
      scheduleSlotId: '',
      complaints: '',
      height: 0,
      weight: 0,
    ),
  );
}
