import 'package:equatable/equatable.dart';

class Specialty extends Equatable {
  final String id;
  final String name;

  const Specialty({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
