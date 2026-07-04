import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/doctors_repository.dart';

@lazySingleton
class BookAppointmentUseCase implements UseCase<Unit, BookAppointmentParams> {
  const BookAppointmentUseCase(this._repository);

  final DoctorsRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(BookAppointmentParams params) {
    return _repository.bookAppointment(
      scheduleSlotId: params.scheduleSlotId,
      complaints: params.complaints,
      chronicDiseases: params.chronicDiseases,
      height: params.height,
      weight: params.weight,
      filePath: params.filePath,
    );
  }
}

class BookAppointmentParams extends Equatable {
  const BookAppointmentParams({
    required this.scheduleSlotId,
    required this.complaints,
    this.chronicDiseases,
    required this.height,
    required this.weight,
    this.filePath,
  });

  final String scheduleSlotId;
  final String complaints;
  final String? chronicDiseases;
  final double height;
  final double weight;
  final String? filePath;

  @override
  List<Object?> get props => [
    scheduleSlotId,
    complaints,
    chronicDiseases,
    height,
    weight,
    filePath,
  ];
}
