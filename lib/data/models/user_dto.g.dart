// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  avatar: json['avatar'] as String,
  registrationDate: json['registrationDate'] as String,
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'avatar': instance.avatar,
  'registrationDate': instance.registrationDate,
};

_LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    _LoginResponseDto(
      success: json['success'] as bool,
      token: json['token'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseDtoToJson(_LoginResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'user': instance.user,
    };
