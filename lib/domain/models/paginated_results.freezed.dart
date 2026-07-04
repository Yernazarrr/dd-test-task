// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedDoctors {

 List<Doctor> get doctors; Pagination get pagination; bool get isFromCache;
/// Create a copy of PaginatedDoctors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedDoctorsCopyWith<PaginatedDoctors> get copyWith => _$PaginatedDoctorsCopyWithImpl<PaginatedDoctors>(this as PaginatedDoctors, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedDoctors&&const DeepCollectionEquality().equals(other.doctors, doctors)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(doctors),pagination,isFromCache);

@override
String toString() {
  return 'PaginatedDoctors(doctors: $doctors, pagination: $pagination, isFromCache: $isFromCache)';
}


}

/// @nodoc
abstract mixin class $PaginatedDoctorsCopyWith<$Res>  {
  factory $PaginatedDoctorsCopyWith(PaginatedDoctors value, $Res Function(PaginatedDoctors) _then) = _$PaginatedDoctorsCopyWithImpl;
@useResult
$Res call({
 List<Doctor> doctors, Pagination pagination, bool isFromCache
});




}
/// @nodoc
class _$PaginatedDoctorsCopyWithImpl<$Res>
    implements $PaginatedDoctorsCopyWith<$Res> {
  _$PaginatedDoctorsCopyWithImpl(this._self, this._then);

  final PaginatedDoctors _self;
  final $Res Function(PaginatedDoctors) _then;

/// Create a copy of PaginatedDoctors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctors = null,Object? pagination = null,Object? isFromCache = null,}) {
  return _then(_self.copyWith(
doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedDoctors].
extension PaginatedDoctorsPatterns on PaginatedDoctors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedDoctors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedDoctors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedDoctors value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedDoctors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedDoctors value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedDoctors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Doctor> doctors,  Pagination pagination,  bool isFromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedDoctors() when $default != null:
return $default(_that.doctors,_that.pagination,_that.isFromCache);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Doctor> doctors,  Pagination pagination,  bool isFromCache)  $default,) {final _that = this;
switch (_that) {
case _PaginatedDoctors():
return $default(_that.doctors,_that.pagination,_that.isFromCache);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Doctor> doctors,  Pagination pagination,  bool isFromCache)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedDoctors() when $default != null:
return $default(_that.doctors,_that.pagination,_that.isFromCache);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedDoctors implements PaginatedDoctors {
  const _PaginatedDoctors({required final  List<Doctor> doctors, required this.pagination, this.isFromCache = false}): _doctors = doctors;
  

 final  List<Doctor> _doctors;
@override List<Doctor> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

@override final  Pagination pagination;
@override@JsonKey() final  bool isFromCache;

/// Create a copy of PaginatedDoctors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedDoctorsCopyWith<_PaginatedDoctors> get copyWith => __$PaginatedDoctorsCopyWithImpl<_PaginatedDoctors>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedDoctors&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_doctors),pagination,isFromCache);

@override
String toString() {
  return 'PaginatedDoctors(doctors: $doctors, pagination: $pagination, isFromCache: $isFromCache)';
}


}

/// @nodoc
abstract mixin class _$PaginatedDoctorsCopyWith<$Res> implements $PaginatedDoctorsCopyWith<$Res> {
  factory _$PaginatedDoctorsCopyWith(_PaginatedDoctors value, $Res Function(_PaginatedDoctors) _then) = __$PaginatedDoctorsCopyWithImpl;
@override @useResult
$Res call({
 List<Doctor> doctors, Pagination pagination, bool isFromCache
});




}
/// @nodoc
class __$PaginatedDoctorsCopyWithImpl<$Res>
    implements _$PaginatedDoctorsCopyWith<$Res> {
  __$PaginatedDoctorsCopyWithImpl(this._self, this._then);

  final _PaginatedDoctors _self;
  final $Res Function(_PaginatedDoctors) _then;

/// Create a copy of PaginatedDoctors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctors = null,Object? pagination = null,Object? isFromCache = null,}) {
  return _then(_PaginatedDoctors(
doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PaginatedReviews {

 List<Review> get reviews; Pagination get pagination;
/// Create a copy of PaginatedReviews
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedReviewsCopyWith<PaginatedReviews> get copyWith => _$PaginatedReviewsCopyWithImpl<PaginatedReviews>(this as PaginatedReviews, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedReviews&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reviews),pagination);

@override
String toString() {
  return 'PaginatedReviews(reviews: $reviews, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $PaginatedReviewsCopyWith<$Res>  {
  factory $PaginatedReviewsCopyWith(PaginatedReviews value, $Res Function(PaginatedReviews) _then) = _$PaginatedReviewsCopyWithImpl;
@useResult
$Res call({
 List<Review> reviews, Pagination pagination
});




}
/// @nodoc
class _$PaginatedReviewsCopyWithImpl<$Res>
    implements $PaginatedReviewsCopyWith<$Res> {
  _$PaginatedReviewsCopyWithImpl(this._self, this._then);

  final PaginatedReviews _self;
  final $Res Function(PaginatedReviews) _then;

/// Create a copy of PaginatedReviews
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviews = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedReviews].
extension PaginatedReviewsPatterns on PaginatedReviews {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedReviews value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedReviews() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedReviews value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedReviews():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedReviews value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedReviews() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Review> reviews,  Pagination pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedReviews() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Review> reviews,  Pagination pagination)  $default,) {final _that = this;
switch (_that) {
case _PaginatedReviews():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Review> reviews,  Pagination pagination)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedReviews() when $default != null:
return $default(_that.reviews,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedReviews implements PaginatedReviews {
  const _PaginatedReviews({required final  List<Review> reviews, required this.pagination}): _reviews = reviews;
  

 final  List<Review> _reviews;
@override List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  Pagination pagination;

/// Create a copy of PaginatedReviews
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedReviewsCopyWith<_PaginatedReviews> get copyWith => __$PaginatedReviewsCopyWithImpl<_PaginatedReviews>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedReviews&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviews),pagination);

@override
String toString() {
  return 'PaginatedReviews(reviews: $reviews, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$PaginatedReviewsCopyWith<$Res> implements $PaginatedReviewsCopyWith<$Res> {
  factory _$PaginatedReviewsCopyWith(_PaginatedReviews value, $Res Function(_PaginatedReviews) _then) = __$PaginatedReviewsCopyWithImpl;
@override @useResult
$Res call({
 List<Review> reviews, Pagination pagination
});




}
/// @nodoc
class __$PaginatedReviewsCopyWithImpl<$Res>
    implements _$PaginatedReviewsCopyWith<$Res> {
  __$PaginatedReviewsCopyWithImpl(this._self, this._then);

  final _PaginatedReviews _self;
  final $Res Function(_PaginatedReviews) _then;

/// Create a copy of PaginatedReviews
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviews = null,Object? pagination = null,}) {
  return _then(_PaginatedReviews(
reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}


}

// dart format on
