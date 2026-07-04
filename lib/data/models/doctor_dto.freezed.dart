// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorDto {

 String get id; String get name; String get specialty; double get rating; int get reviewCount; int get experience; String get avatar; String get education; String get description; List<String> get achievements; int get price; List<SlotDto>? get todaySlots;
/// Create a copy of DoctorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorDtoCopyWith<DoctorDto> get copyWith => _$DoctorDtoCopyWithImpl<DoctorDto>(this as DoctorDto, _$identity);

  /// Serializes this DoctorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.education, education) || other.education == education)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.todaySlots, todaySlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,specialty,rating,reviewCount,experience,avatar,education,description,const DeepCollectionEquality().hash(achievements),price,const DeepCollectionEquality().hash(todaySlots));

@override
String toString() {
  return 'DoctorDto(id: $id, name: $name, specialty: $specialty, rating: $rating, reviewCount: $reviewCount, experience: $experience, avatar: $avatar, education: $education, description: $description, achievements: $achievements, price: $price, todaySlots: $todaySlots)';
}


}

/// @nodoc
abstract mixin class $DoctorDtoCopyWith<$Res>  {
  factory $DoctorDtoCopyWith(DoctorDto value, $Res Function(DoctorDto) _then) = _$DoctorDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String specialty, double rating, int reviewCount, int experience, String avatar, String education, String description, List<String> achievements, int price, List<SlotDto>? todaySlots
});




}
/// @nodoc
class _$DoctorDtoCopyWithImpl<$Res>
    implements $DoctorDtoCopyWith<$Res> {
  _$DoctorDtoCopyWithImpl(this._self, this._then);

  final DoctorDto _self;
  final $Res Function(DoctorDto) _then;

/// Create a copy of DoctorDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? rating = null,Object? reviewCount = null,Object? experience = null,Object? avatar = null,Object? education = null,Object? description = null,Object? achievements = null,Object? price = null,Object? todaySlots = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,todaySlots: freezed == todaySlots ? _self.todaySlots : todaySlots // ignore: cast_nullable_to_non_nullable
as List<SlotDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorDto].
extension DoctorDtoPatterns on DoctorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorDto value)  $default,){
final _that = this;
switch (_that) {
case _DoctorDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String specialty,  double rating,  int reviewCount,  int experience,  String avatar,  String education,  String description,  List<String> achievements,  int price,  List<SlotDto>? todaySlots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorDto() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.rating,_that.reviewCount,_that.experience,_that.avatar,_that.education,_that.description,_that.achievements,_that.price,_that.todaySlots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String specialty,  double rating,  int reviewCount,  int experience,  String avatar,  String education,  String description,  List<String> achievements,  int price,  List<SlotDto>? todaySlots)  $default,) {final _that = this;
switch (_that) {
case _DoctorDto():
return $default(_that.id,_that.name,_that.specialty,_that.rating,_that.reviewCount,_that.experience,_that.avatar,_that.education,_that.description,_that.achievements,_that.price,_that.todaySlots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String specialty,  double rating,  int reviewCount,  int experience,  String avatar,  String education,  String description,  List<String> achievements,  int price,  List<SlotDto>? todaySlots)?  $default,) {final _that = this;
switch (_that) {
case _DoctorDto() when $default != null:
return $default(_that.id,_that.name,_that.specialty,_that.rating,_that.reviewCount,_that.experience,_that.avatar,_that.education,_that.description,_that.achievements,_that.price,_that.todaySlots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorDto implements DoctorDto {
  const _DoctorDto({required this.id, required this.name, required this.specialty, required this.rating, required this.reviewCount, required this.experience, required this.avatar, required this.education, required this.description, required final  List<String> achievements, required this.price, final  List<SlotDto>? todaySlots}): _achievements = achievements,_todaySlots = todaySlots;
  factory _DoctorDto.fromJson(Map<String, dynamic> json) => _$DoctorDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String specialty;
@override final  double rating;
@override final  int reviewCount;
@override final  int experience;
@override final  String avatar;
@override final  String education;
@override final  String description;
 final  List<String> _achievements;
@override List<String> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@override final  int price;
 final  List<SlotDto>? _todaySlots;
@override List<SlotDto>? get todaySlots {
  final value = _todaySlots;
  if (value == null) return null;
  if (_todaySlots is EqualUnmodifiableListView) return _todaySlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DoctorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorDtoCopyWith<_DoctorDto> get copyWith => __$DoctorDtoCopyWithImpl<_DoctorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.education, education) || other.education == education)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._todaySlots, _todaySlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,specialty,rating,reviewCount,experience,avatar,education,description,const DeepCollectionEquality().hash(_achievements),price,const DeepCollectionEquality().hash(_todaySlots));

@override
String toString() {
  return 'DoctorDto(id: $id, name: $name, specialty: $specialty, rating: $rating, reviewCount: $reviewCount, experience: $experience, avatar: $avatar, education: $education, description: $description, achievements: $achievements, price: $price, todaySlots: $todaySlots)';
}


}

/// @nodoc
abstract mixin class _$DoctorDtoCopyWith<$Res> implements $DoctorDtoCopyWith<$Res> {
  factory _$DoctorDtoCopyWith(_DoctorDto value, $Res Function(_DoctorDto) _then) = __$DoctorDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String specialty, double rating, int reviewCount, int experience, String avatar, String education, String description, List<String> achievements, int price, List<SlotDto>? todaySlots
});




}
/// @nodoc
class __$DoctorDtoCopyWithImpl<$Res>
    implements _$DoctorDtoCopyWith<$Res> {
  __$DoctorDtoCopyWithImpl(this._self, this._then);

  final _DoctorDto _self;
  final $Res Function(_DoctorDto) _then;

/// Create a copy of DoctorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? specialty = null,Object? rating = null,Object? reviewCount = null,Object? experience = null,Object? avatar = null,Object? education = null,Object? description = null,Object? achievements = null,Object? price = null,Object? todaySlots = freezed,}) {
  return _then(_DoctorDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,todaySlots: freezed == todaySlots ? _self._todaySlots : todaySlots // ignore: cast_nullable_to_non_nullable
as List<SlotDto>?,
  ));
}


}


/// @nodoc
mixin _$DoctorsResponseDto {

 List<DoctorDto> get doctors; PaginationDto get pagination;
/// Create a copy of DoctorsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorsResponseDtoCopyWith<DoctorsResponseDto> get copyWith => _$DoctorsResponseDtoCopyWithImpl<DoctorsResponseDto>(this as DoctorsResponseDto, _$identity);

  /// Serializes this DoctorsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsResponseDto&&const DeepCollectionEquality().equals(other.doctors, doctors)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(doctors),pagination);

@override
String toString() {
  return 'DoctorsResponseDto(doctors: $doctors, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $DoctorsResponseDtoCopyWith<$Res>  {
  factory $DoctorsResponseDtoCopyWith(DoctorsResponseDto value, $Res Function(DoctorsResponseDto) _then) = _$DoctorsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<DoctorDto> doctors, PaginationDto pagination
});


$PaginationDtoCopyWith<$Res> get pagination;

}
/// @nodoc
class _$DoctorsResponseDtoCopyWithImpl<$Res>
    implements $DoctorsResponseDtoCopyWith<$Res> {
  _$DoctorsResponseDtoCopyWithImpl(this._self, this._then);

  final DoctorsResponseDto _self;
  final $Res Function(DoctorsResponseDto) _then;

/// Create a copy of DoctorsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctors = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<DoctorDto>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationDto,
  ));
}
/// Create a copy of DoctorsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationDtoCopyWith<$Res> get pagination {
  
  return $PaginationDtoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [DoctorsResponseDto].
extension DoctorsResponseDtoPatterns on DoctorsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _DoctorsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DoctorDto> doctors,  PaginationDto pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorsResponseDto() when $default != null:
return $default(_that.doctors,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DoctorDto> doctors,  PaginationDto pagination)  $default,) {final _that = this;
switch (_that) {
case _DoctorsResponseDto():
return $default(_that.doctors,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DoctorDto> doctors,  PaginationDto pagination)?  $default,) {final _that = this;
switch (_that) {
case _DoctorsResponseDto() when $default != null:
return $default(_that.doctors,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorsResponseDto implements DoctorsResponseDto {
  const _DoctorsResponseDto({required final  List<DoctorDto> doctors, required this.pagination}): _doctors = doctors;
  factory _DoctorsResponseDto.fromJson(Map<String, dynamic> json) => _$DoctorsResponseDtoFromJson(json);

 final  List<DoctorDto> _doctors;
@override List<DoctorDto> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

@override final  PaginationDto pagination;

/// Create a copy of DoctorsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorsResponseDtoCopyWith<_DoctorsResponseDto> get copyWith => __$DoctorsResponseDtoCopyWithImpl<_DoctorsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorsResponseDto&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_doctors),pagination);

@override
String toString() {
  return 'DoctorsResponseDto(doctors: $doctors, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$DoctorsResponseDtoCopyWith<$Res> implements $DoctorsResponseDtoCopyWith<$Res> {
  factory _$DoctorsResponseDtoCopyWith(_DoctorsResponseDto value, $Res Function(_DoctorsResponseDto) _then) = __$DoctorsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<DoctorDto> doctors, PaginationDto pagination
});


@override $PaginationDtoCopyWith<$Res> get pagination;

}
/// @nodoc
class __$DoctorsResponseDtoCopyWithImpl<$Res>
    implements _$DoctorsResponseDtoCopyWith<$Res> {
  __$DoctorsResponseDtoCopyWithImpl(this._self, this._then);

  final _DoctorsResponseDto _self;
  final $Res Function(_DoctorsResponseDto) _then;

/// Create a copy of DoctorsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctors = null,Object? pagination = null,}) {
  return _then(_DoctorsResponseDto(
doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<DoctorDto>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationDto,
  ));
}

/// Create a copy of DoctorsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationDtoCopyWith<$Res> get pagination {
  
  return $PaginationDtoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
