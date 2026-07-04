import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_task/core/error/failures.dart';
import 'package:test_task/domain/usecases/doctors/book_appointment_use_case.dart';
import 'package:test_task/presentation/features/booking/booking_cubit.dart';
import 'package:test_task/presentation/features/booking/booking_state.dart';

import '../../../helpers/mocks.dart';

void main() {
  late MockBookAppointmentUseCase bookAppointmentUseCase;
  late BookingCubit cubit;

  setUpAll(registerUseCaseFallbackValues);

  setUp(() {
    bookAppointmentUseCase = MockBookAppointmentUseCase();
    cubit = BookingCubit(bookAppointmentUseCase);
  });

  tearDown(() async {
    await cubit.close();
  });

  blocTest<BookingCubit, BookingState>(
    'emits success on successful booking',
    build: () {
      when(
        () => bookAppointmentUseCase(
          const BookAppointmentParams(
            scheduleSlotId: 'slot-1',
            complaints: 'Headache',
            chronicDiseases: 'None',
            height: 175,
            weight: 70,
          ),
        ),
      ).thenAnswer((_) async => right(unit));
      return cubit;
    },
    act: (cubit) => cubit.book(
      scheduleSlotId: 'slot-1',
      complaints: 'Headache',
      chronicDiseases: 'None',
      height: 175,
      weight: 70,
    ),
    expect: () => [
      const BookingState.loading(),
      const BookingState.success(),
    ],
  );

  blocTest<BookingCubit, BookingState>(
    'emits error on failed booking',
    build: () {
      when(() => bookAppointmentUseCase(any())).thenAnswer(
        (_) async =>
            left(const ServerFailure('Не удалось записаться на прием')),
      );
      return cubit;
    },
    act: (cubit) => cubit.book(
      scheduleSlotId: 'slot-1',
      complaints: 'Headache',
      height: 175,
      weight: 70,
    ),
    expect: () => [
      const BookingState.loading(),
      const BookingState.error('Не удалось записаться на прием'),
    ],
  );
}
