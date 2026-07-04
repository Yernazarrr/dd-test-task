// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDto {

 String get id; String get name; String get email; String get phone; String get avatar; String get registrationDate;
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDtoCopyWith<UserDto> get copyWith => _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,avatar,registrationDate);

@override
String toString() {
  return 'UserDto(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, registrationDate: $registrationDate)';
}


}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res>  {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) = _$UserDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String phone, String avatar, String registrationDate
});




}
/// @nodoc
class _$UserDtoCopyWithImpl<$Res>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? avatar = null,Object? registrationDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,registrationDate: null == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDto].
extension UserDtoPatterns on UserDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDto value)  $default,){
final _that = this;
switch (_that) {
case _UserDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String phone,  String avatar,  String registrationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.avatar,_that.registrationDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String phone,  String avatar,  String registrationDate)  $default,) {final _that = this;
switch (_that) {
case _UserDto():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.avatar,_that.registrationDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String phone,  String avatar,  String registrationDate)?  $default,) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.avatar,_that.registrationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDto implements UserDto {
  const _UserDto({required this.id, required this.name, required this.email, required this.phone, required this.avatar, required this.registrationDate});
  factory _UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String avatar;
@override final  String registrationDate;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDtoCopyWith<_UserDto> get copyWith => __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,avatar,registrationDate);

@override
String toString() {
  return 'UserDto(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, registrationDate: $registrationDate)';
}


}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) = __$UserDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String phone, String avatar, String registrationDate
});




}
/// @nodoc
class __$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? avatar = null,Object? registrationDate = null,}) {
  return _then(_UserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,registrationDate: null == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginResponseDto {

 bool get success; String get token; UserDto get user;
/// Create a copy of LoginResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseDtoCopyWith<LoginResponseDto> get copyWith => _$LoginResponseDtoCopyWithImpl<LoginResponseDto>(this as LoginResponseDto, _$identity);

  /// Serializes this LoginResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,token,user);

@override
String toString() {
  return 'LoginResponseDto(success: $success, token: $token, user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginResponseDtoCopyWith<$Res>  {
  factory $LoginResponseDtoCopyWith(LoginResponseDto value, $Res Function(LoginResponseDto) _then) = _$LoginResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool success, String token, UserDto user
});


$UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResponseDtoCopyWithImpl<$Res>
    implements $LoginResponseDtoCopyWith<$Res> {
  _$LoginResponseDtoCopyWithImpl(this._self, this._then);

  final LoginResponseDto _self;
  final $Res Function(LoginResponseDto) _then;

/// Create a copy of LoginResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? token = null,Object? user = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,
  ));
}
/// Create a copy of LoginResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponseDto].
extension LoginResponseDtoPatterns on LoginResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String token,  UserDto user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponseDto() when $default != null:
return $default(_that.success,_that.token,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String token,  UserDto user)  $default,) {final _that = this;
switch (_that) {
case _LoginResponseDto():
return $default(_that.success,_that.token,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String token,  UserDto user)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponseDto() when $default != null:
return $default(_that.success,_that.token,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponseDto implements LoginResponseDto {
  const _LoginResponseDto({required this.success, required this.token, required this.user});
  factory _LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);

@override final  bool success;
@override final  String token;
@override final  UserDto user;

/// Create a copy of LoginResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseDtoCopyWith<_LoginResponseDto> get copyWith => __$LoginResponseDtoCopyWithImpl<_LoginResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,token,user);

@override
String toString() {
  return 'LoginResponseDto(success: $success, token: $token, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseDtoCopyWith<$Res> implements $LoginResponseDtoCopyWith<$Res> {
  factory _$LoginResponseDtoCopyWith(_LoginResponseDto value, $Res Function(_LoginResponseDto) _then) = __$LoginResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool success, String token, UserDto user
});


@override $UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$LoginResponseDtoCopyWithImpl<$Res>
    implements _$LoginResponseDtoCopyWith<$Res> {
  __$LoginResponseDtoCopyWithImpl(this._self, this._then);

  final _LoginResponseDto _self;
  final $Res Function(_LoginResponseDto) _then;

/// Create a copy of LoginResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? token = null,Object? user = null,}) {
  return _then(_LoginResponseDto(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,
  ));
}

/// Create a copy of LoginResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
