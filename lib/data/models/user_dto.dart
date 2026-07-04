import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String avatar,
    required String registrationDate,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

@freezed
abstract class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required bool success,
    required String token,
    required UserDto user,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}
