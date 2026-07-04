import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../models/doctor.dart';
import '../../repositories/doctors_repository.dart';

@lazySingleton
class GetDoctorDetailsUseCase
    implements UseCase<Doctor, GetDoctorDetailsParams> {
  const GetDoctorDetailsUseCase(this._repository);

  final DoctorsRepository _repository;

  @override
  Future<Either<Failure, Doctor>> call(GetDoctorDetailsParams params) {
    return _repository.getDoctorDetails(params.doctorId);
  }
}

class GetDoctorDetailsParams extends Equatable {
  const GetDoctorDetailsParams({required this.doctorId});

  final String doctorId;

  @override
  List<Object?> get props => [doctorId];
}
