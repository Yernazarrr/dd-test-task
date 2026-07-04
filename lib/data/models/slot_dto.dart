import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_dto.freezed.dart';
part 'slot_dto.g.dart';

@freezed
abstract class SlotDto with _$SlotDto {
  const factory SlotDto({
    required String id,
    required String startTime,
    required String endTime,
  }) = _SlotDto;

  factory SlotDto.fromJson(Map<String, dynamic> json) =>
      _$SlotDtoFromJson(json);
}
