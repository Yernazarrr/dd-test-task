// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewDto {

 String get id; String get patientName; int get rating; String get comment; String get date;
/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDtoCopyWith<ReviewDto> get copyWith => _$ReviewDtoCopyWithImpl<ReviewDto>(this as ReviewDto, _$identity);

  /// Serializes this ReviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientName,rating,comment,date);

@override
String toString() {
  return 'ReviewDto(id: $id, patientName: $patientName, rating: $rating, comment: $comment, date: $date)';
}


}

/// @nodoc
abstract mixin class $ReviewDtoCopyWith<$Res>  {
  factory $ReviewDtoCopyWith(ReviewDto value, $Res Function(ReviewDto) _then) = _$ReviewDtoCopyWithImpl;
@useResult
$Res call({
 String id, String patientName, int rating, String comment, String date
});




}
/// @nodoc
class _$ReviewDtoCopyWithImpl<$Res>
    implements $ReviewDtoCopyWith<$Res> {
  _$ReviewDtoCopyWithImpl(this._self, this._then);

  final ReviewDto _self;
  final $Res Function(ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientName = null,Object? rating = null,Object? comment = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewDto].
extension ReviewDtoPatterns on ReviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDto value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientName,  int rating,  String comment,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.id,_that.patientName,_that.rating,_that.comment,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientName,  int rating,  String comment,  String date)  $default,) {final _that = this;
switch (_that) {
case _ReviewDto():
return $default(_that.id,_that.patientName,_that.rating,_that.comment,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientName,  int rating,  String comment,  String date)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDto() when $default != null:
return $default(_that.id,_that.patientName,_that.rating,_that.comment,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDto implements ReviewDto {
  const _ReviewDto({required this.id, required this.patientName, required this.rating, required this.comment, required this.date});
  factory _ReviewDto.fromJson(Map<String, dynamic> json) => _$ReviewDtoFromJson(json);

@override final  String id;
@override final  String patientName;
@override final  int rating;
@override final  String comment;
@override final  String date;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDtoCopyWith<_ReviewDto> get copyWith => __$ReviewDtoCopyWithImpl<_ReviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDto&&(identical(other.id, id) || other.id == id)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientName,rating,comment,date);

@override
String toString() {
  return 'ReviewDto(id: $id, patientName: $patientName, rating: $rating, comment: $comment, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ReviewDtoCopyWith<$Res> implements $ReviewDtoCopyWith<$Res> {
  factory _$ReviewDtoCopyWith(_ReviewDto value, $Res Function(_ReviewDto) _then) = __$ReviewDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientName, int rating, String comment, String date
});




}
/// @nodoc
class __$ReviewDtoCopyWithImpl<$Res>
    implements _$ReviewDtoCopyWith<$Res> {
  __$ReviewDtoCopyWithImpl(this._self, this._then);

  final _ReviewDto _self;
  final $Res Function(_ReviewDto) _then;

/// Create a copy of ReviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientName = null,Object? rating = null,Object? comment = null,Object? date = null,}) {
  return _then(_ReviewDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReviewsResponseDto {

 List<ReviewDto> get reviews; PaginationDto get pagination;
/// Create a copy of ReviewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewsResponseDtoCopyWith<ReviewsResponseDto> get copyWith => _$ReviewsResponseDtoCopyWithImpl<ReviewsResponseDto>(this as ReviewsResponseDto, _$identity);

  /// Serializes this ReviewsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewsResponseDto&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reviews),pagination);

@override
String toString() {
  return 'ReviewsResponseDto(reviews: $reviews, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $ReviewsResponseDtoCopyWith<$Res>  {
  factory $ReviewsResponseDtoCopyWith(ReviewsResponseDto value, $Res Function(ReviewsResponseDto) _then) = _$ReviewsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<ReviewDto> reviews, PaginationDto pagination
});


$PaginationDtoCopyWith<$Res> get pagination;

}
/// @nodoc
class _$ReviewsResponseDtoCopyWithImpl<$Res>
    implements $ReviewsResponseDtoCopyWith<$Res> {
  _$ReviewsResponseDtoCopyWithImpl(this._self, this._then);

  final ReviewsResponseDto _self;
  final $Res Function(ReviewsResponseDto) _then;

/// Create a copy of ReviewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviews = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDto>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationDto,
  ));
}
/// Create a copy of ReviewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationDtoCopyWith<$Res> get pagination {
  
  return $PaginationDtoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewsResponseDto].
extension ReviewsResponseDtoPatterns on ReviewsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ReviewsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReviewDto> reviews,  PaginationDto pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewsResponseDto() when $default != null:
return $default(_that.reviews,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReviewDto> reviews,  PaginationDto pagination)  $default,) {final _that = this;
switch (_that) {
case _ReviewsResponseDto():
return $default(_that.reviews,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReviewDto> reviews,  PaginationDto pagination)?  $default,) {final _that = this;
switch (_that) {
case _ReviewsResponseDto() when $default != null:
return $default(_that.reviews,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewsResponseDto implements ReviewsResponseDto {
  const _ReviewsResponseDto({required final  List<ReviewDto> reviews, required this.pagination}): _reviews = reviews;
  factory _ReviewsResponseDto.fromJson(Map<String, dynamic> json) => _$ReviewsResponseDtoFromJson(json);

 final  List<ReviewDto> _reviews;
@override List<ReviewDto> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  PaginationDto pagination;

/// Create a copy of ReviewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewsResponseDtoCopyWith<_ReviewsResponseDto> get copyWith => __$ReviewsResponseDtoCopyWithImpl<_ReviewsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewsResponseDto&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviews),pagination);

@override
String toString() {
  return 'ReviewsResponseDto(reviews: $reviews, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$ReviewsResponseDtoCopyWith<$Res> implements $ReviewsResponseDtoCopyWith<$Res> {
  factory _$ReviewsResponseDtoCopyWith(_ReviewsResponseDto value, $Res Function(_ReviewsResponseDto) _then) = __$ReviewsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ReviewDto> reviews, PaginationDto pagination
});


@override $PaginationDtoCopyWith<$Res> get pagination;

}
/// @nodoc
class __$ReviewsResponseDtoCopyWithImpl<$Res>
    implements _$ReviewsResponseDtoCopyWith<$Res> {
  __$ReviewsResponseDtoCopyWithImpl(this._self, this._then);

  final _ReviewsResponseDto _self;
  final $Res Function(_ReviewsResponseDto) _then;

/// Create a copy of ReviewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviews = null,Object? pagination = null,}) {
  return _then(_ReviewsResponseDto(
reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewDto>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationDto,
  ));
}

/// Create a copy of ReviewsResponseDto
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
