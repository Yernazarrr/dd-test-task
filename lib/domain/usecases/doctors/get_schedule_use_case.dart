import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../models/slot.dart';
import '../../repositories/doctors_repository.dart';

@lazySingleton
class GetScheduleUseCase implements UseCase<List<Slot>, GetScheduleParams> {
  const GetScheduleUseCase(this._repository);

  final DoctorsRepository _repository;

  @override
  Future<Either<Failure, List<Slot>>> call(GetScheduleParams params) {
    return _repository.getDoctorSchedule(params.doctorId);
  }
}

class GetScheduleParams extends Equatable {
  const GetScheduleParams({required this.doctorId});

  final String doctorId;

  @override
  List<Object?> get props => [doctorId];
}
