import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/doctors/book_appointment_use_case.dart';
import 'booking_state.dart';

@injectable
class BookingCubit extends Cubit<BookingState> {
  final BookAppointmentUseCase _bookAppointmentUseCase;

  BookingCubit(this._bookAppointmentUseCase)
    : super(const BookingState.initial());

  Future<void> book({
    required String scheduleSlotId,
    required String complaints,
    String? chronicDiseases,
    required double height,
    required double weight,
    String? filePath,
  }) async {
    emit(const BookingState.loading());
    final result = await _bookAppointmentUseCase(
      BookAppointmentParams(
        scheduleSlotId: scheduleSlotId,
        complaints: complaints,
        chronicDiseases: chronicDiseases,
        height: height,
        weight: weight,
        filePath: filePath,
      ),
    );
    result.fold(
      (failure) => emit(BookingState.error(failure.message)),
      (_) => emit(const BookingState.success()),
    );
  }
}
