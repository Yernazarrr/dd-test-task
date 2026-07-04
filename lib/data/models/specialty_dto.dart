import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialty_dto.freezed.dart';
part 'specialty_dto.g.dart';

@freezed
abstract class SpecialtyDto with _$SpecialtyDto {
  const factory SpecialtyDto({
    required String id,
    required String name,
  }) = _SpecialtyDto;

  factory SpecialtyDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyDtoFromJson(json);
}
