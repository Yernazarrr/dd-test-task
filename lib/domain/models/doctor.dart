import 'package:equatable/equatable.dart';

import 'slot.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String specialtyId;
  final double rating;
  final int reviewCount;
  final int experience;
  final String avatar;
  final String education;
  final String description;
  final List<String> achievements;
  final int price;
  final List<Slot> todaySlots;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialtyId,
    required this.rating,
    required this.reviewCount,
    required this.experience,
    required this.avatar,
    required this.education,
    required this.description,
    required this.achievements,
    required this.price,
    required this.todaySlots,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    specialtyId,
    rating,
    reviewCount,
    experience,
    avatar,
    education,
    description,
    achievements,
    price,
    todaySlots,
  ];
}
