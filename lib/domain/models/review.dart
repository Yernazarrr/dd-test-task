import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String patientName;
  final int rating;
  final String comment;
  final DateTime date;

  const Review({
    required this.id,
    required this.patientName,
    required this.rating,
    required this.comment,
    required this.date,
  });

  @override
  List<Object?> get props => [id, patientName, rating, comment, date];
}
