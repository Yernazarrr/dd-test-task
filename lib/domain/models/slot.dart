import 'package:equatable/equatable.dart';

class Slot extends Equatable {
  final String id;
  final DateTime startTime;
  final DateTime endTime;

  const Slot({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [id, startTime, endTime];
}
