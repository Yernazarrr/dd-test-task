// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorDetailsState {

 Doctor? get doctor; List<Slot> get schedule; List<Review> get reviews; Pagination? get reviewsPagination; bool get isLoadingDoctor; bool get isLoadingSchedule; bool get isLoadingReviews; String? get errorDoctor; String? get errorSchedule; String? get errorReviews; int get reviewsPage; String get reviewsSortBy; String get reviewsSortOrder; String? get specialtyName;
/// Create a copy of DoctorDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorDetailsStateCopyWith<DoctorDetailsState> get copyWith => _$DoctorDetailsStateCopyWithImpl<DoctorDetailsState>(this as DoctorDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorDetailsState&&(identical(other.doctor, doctor) || other.doctor == doctor)&&const DeepCollectionEquality().equals(other.schedule, schedule)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.reviewsPagination, reviewsPagination) || other.reviewsPagination == reviewsPagination)&&(identical(other.isLoadingDoctor, isLoadingDoctor) || other.isLoadingDoctor == isLoadingDoctor)&&(identical(other.isLoadingSchedule, isLoadingSchedule) || other.isLoadingSchedule == isLoadingSchedule)&&(identical(other.isLoadingReviews, isLoadingReviews) || other.isLoadingReviews == isLoadingReviews)&&(identical(other.errorDoctor, errorDoctor) || other.errorDoctor == errorDoctor)&&(identical(other.errorSchedule, errorSchedule) || other.errorSchedule == errorSchedule)&&(identical(other.errorReviews, errorReviews) || other.errorReviews == errorReviews)&&(identical(other.reviewsPage, reviewsPage) || other.reviewsPage == reviewsPage)&&(identical(other.reviewsSortBy, reviewsSortBy) || other.reviewsSortBy == reviewsSortBy)&&(identical(other.reviewsSortOrder, reviewsSortOrder) || other.reviewsSortOrder == reviewsSortOrder)&&(identical(other.specialtyName, specialtyName) || other.specialtyName == specialtyName));
}


@override
int get hashCode => Object.hash(runtimeType,doctor,const DeepCollectionEquality().hash(schedule),const DeepCollectionEquality().hash(reviews),reviewsPagination,isLoadingDoctor,isLoadingSchedule,isLoadingReviews,errorDoctor,errorSchedule,errorReviews,reviewsPage,reviewsSortBy,reviewsSortOrder,specialtyName);

@override
String toString() {
  return 'DoctorDetailsState(doctor: $doctor, schedule: $schedule, reviews: $reviews, reviewsPagination: $reviewsPagination, isLoadingDoctor: $isLoadingDoctor, isLoadingSchedule: $isLoadingSchedule, isLoadingReviews: $isLoadingReviews, errorDoctor: $errorDoctor, errorSchedule: $errorSchedule, errorReviews: $errorReviews, reviewsPage: $reviewsPage, reviewsSortBy: $reviewsSortBy, reviewsSortOrder: $reviewsSortOrder, specialtyName: $specialtyName)';
}


}

/// @nodoc
abstract mixin class $DoctorDetailsStateCopyWith<$Res>  {
  factory $DoctorDetailsStateCopyWith(DoctorDetailsState value, $Res Function(DoctorDetailsState) _then) = _$DoctorDetailsStateCopyWithImpl;
@useResult
$Res call({
 Doctor? doctor, List<Slot> schedule, List<Review> reviews, Pagination? reviewsPagination, bool isLoadingDoctor, bool isLoadingSchedule, bool isLoadingReviews, String? errorDoctor, String? errorSchedule, String? errorReviews, int reviewsPage, String reviewsSortBy, String reviewsSortOrder, String? specialtyName
});




}
/// @nodoc
class _$DoctorDetailsStateCopyWithImpl<$Res>
    implements $DoctorDetailsStateCopyWith<$Res> {
  _$DoctorDetailsStateCopyWithImpl(this._self, this._then);

  final DoctorDetailsState _self;
  final $Res Function(DoctorDetailsState) _then;

/// Create a copy of DoctorDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctor = freezed,Object? schedule = null,Object? reviews = null,Object? reviewsPagination = freezed,Object? isLoadingDoctor = null,Object? isLoadingSchedule = null,Object? isLoadingReviews = null,Object? errorDoctor = freezed,Object? errorSchedule = freezed,Object? errorReviews = freezed,Object? reviewsPage = null,Object? reviewsSortBy = null,Object? reviewsSortOrder = null,Object? specialtyName = freezed,}) {
  return _then(_self.copyWith(
doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as Doctor?,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<Slot>,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,reviewsPagination: freezed == reviewsPagination ? _self.reviewsPagination : reviewsPagination // ignore: cast_nullable_to_non_nullable
as Pagination?,isLoadingDoctor: null == isLoadingDoctor ? _self.isLoadingDoctor : isLoadingDoctor // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSchedule: null == isLoadingSchedule ? _self.isLoadingSchedule : isLoadingSchedule // ignore: cast_nullable_to_non_nullable
as bool,isLoadingReviews: null == isLoadingReviews ? _self.isLoadingReviews : isLoadingReviews // ignore: cast_nullable_to_non_nullable
as bool,errorDoctor: freezed == errorDoctor ? _self.errorDoctor : errorDoctor // ignore: cast_nullable_to_non_nullable
as String?,errorSchedule: freezed == errorSchedule ? _self.errorSchedule : errorSchedule // ignore: cast_nullable_to_non_nullable
as String?,errorReviews: freezed == errorReviews ? _self.errorReviews : errorReviews // ignore: cast_nullable_to_non_nullable
as String?,reviewsPage: null == reviewsPage ? _self.reviewsPage : reviewsPage // ignore: cast_nullable_to_non_nullable
as int,reviewsSortBy: null == reviewsSortBy ? _self.reviewsSortBy : reviewsSortBy // ignore: cast_nullable_to_non_nullable
as String,reviewsSortOrder: null == reviewsSortOrder ? _self.reviewsSortOrder : reviewsSortOrder // ignore: cast_nullable_to_non_nullable
as String,specialtyName: freezed == specialtyName ? _self.specialtyName : specialtyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorDetailsState].
extension DoctorDetailsStatePatterns on DoctorDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _DoctorDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Doctor? doctor,  List<Slot> schedule,  List<Review> reviews,  Pagination? reviewsPagination,  bool isLoadingDoctor,  bool isLoadingSchedule,  bool isLoadingReviews,  String? errorDoctor,  String? errorSchedule,  String? errorReviews,  int reviewsPage,  String reviewsSortBy,  String reviewsSortOrder,  String? specialtyName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorDetailsState() when $default != null:
return $default(_that.doctor,_that.schedule,_that.reviews,_that.reviewsPagination,_that.isLoadingDoctor,_that.isLoadingSchedule,_that.isLoadingReviews,_that.errorDoctor,_that.errorSchedule,_that.errorReviews,_that.reviewsPage,_that.reviewsSortBy,_that.reviewsSortOrder,_that.specialtyName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Doctor? doctor,  List<Slot> schedule,  List<Review> reviews,  Pagination? reviewsPagination,  bool isLoadingDoctor,  bool isLoadingSchedule,  bool isLoadingReviews,  String? errorDoctor,  String? errorSchedule,  String? errorReviews,  int reviewsPage,  String reviewsSortBy,  String reviewsSortOrder,  String? specialtyName)  $default,) {final _that = this;
switch (_that) {
case _DoctorDetailsState():
return $default(_that.doctor,_that.schedule,_that.reviews,_that.reviewsPagination,_that.isLoadingDoctor,_that.isLoadingSchedule,_that.isLoadingReviews,_that.errorDoctor,_that.errorSchedule,_that.errorReviews,_that.reviewsPage,_that.reviewsSortBy,_that.reviewsSortOrder,_that.specialtyName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Doctor? doctor,  List<Slot> schedule,  List<Review> reviews,  Pagination? reviewsPagination,  bool isLoadingDoctor,  bool isLoadingSchedule,  bool isLoadingReviews,  String? errorDoctor,  String? errorSchedule,  String? errorReviews,  int reviewsPage,  String reviewsSortBy,  String reviewsSortOrder,  String? specialtyName)?  $default,) {final _that = this;
switch (_that) {
case _DoctorDetailsState() when $default != null:
return $default(_that.doctor,_that.schedule,_that.reviews,_that.reviewsPagination,_that.isLoadingDoctor,_that.isLoadingSchedule,_that.isLoadingReviews,_that.errorDoctor,_that.errorSchedule,_that.errorReviews,_that.reviewsPage,_that.reviewsSortBy,_that.reviewsSortOrder,_that.specialtyName);case _:
  return null;

}
}

}

/// @nodoc


class _DoctorDetailsState implements DoctorDetailsState {
  const _DoctorDetailsState({required this.doctor, required final  List<Slot> schedule, required final  List<Review> reviews, required this.reviewsPagination, required this.isLoadingDoctor, required this.isLoadingSchedule, required this.isLoadingReviews, required this.errorDoctor, required this.errorSchedule, required this.errorReviews, required this.reviewsPage, required this.reviewsSortBy, required this.reviewsSortOrder, this.specialtyName}): _schedule = schedule,_reviews = reviews;
  

@override final  Doctor? doctor;
 final  List<Slot> _schedule;
@override List<Slot> get schedule {
  if (_schedule is EqualUnmodifiableListView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedule);
}

 final  List<Review> _reviews;
@override List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  Pagination? reviewsPagination;
@override final  bool isLoadingDoctor;
@override final  bool isLoadingSchedule;
@override final  bool isLoadingReviews;
@override final  String? errorDoctor;
@override final  String? errorSchedule;
@override final  String? errorReviews;
@override final  int reviewsPage;
@override final  String reviewsSortBy;
@override final  String reviewsSortOrder;
@override final  String? specialtyName;

/// Create a copy of DoctorDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorDetailsStateCopyWith<_DoctorDetailsState> get copyWith => __$DoctorDetailsStateCopyWithImpl<_DoctorDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorDetailsState&&(identical(other.doctor, doctor) || other.doctor == doctor)&&const DeepCollectionEquality().equals(other._schedule, _schedule)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.reviewsPagination, reviewsPagination) || other.reviewsPagination == reviewsPagination)&&(identical(other.isLoadingDoctor, isLoadingDoctor) || other.isLoadingDoctor == isLoadingDoctor)&&(identical(other.isLoadingSchedule, isLoadingSchedule) || other.isLoadingSchedule == isLoadingSchedule)&&(identical(other.isLoadingReviews, isLoadingReviews) || other.isLoadingReviews == isLoadingReviews)&&(identical(other.errorDoctor, errorDoctor) || other.errorDoctor == errorDoctor)&&(identical(other.errorSchedule, errorSchedule) || other.errorSchedule == errorSchedule)&&(identical(other.errorReviews, errorReviews) || other.errorReviews == errorReviews)&&(identical(other.reviewsPage, reviewsPage) || other.reviewsPage == reviewsPage)&&(identical(other.reviewsSortBy, reviewsSortBy) || other.reviewsSortBy == reviewsSortBy)&&(identical(other.reviewsSortOrder, reviewsSortOrder) || other.reviewsSortOrder == reviewsSortOrder)&&(identical(other.specialtyName, specialtyName) || other.specialtyName == specialtyName));
}


@override
int get hashCode => Object.hash(runtimeType,doctor,const DeepCollectionEquality().hash(_schedule),const DeepCollectionEquality().hash(_reviews),reviewsPagination,isLoadingDoctor,isLoadingSchedule,isLoadingReviews,errorDoctor,errorSchedule,errorReviews,reviewsPage,reviewsSortBy,reviewsSortOrder,specialtyName);

@override
String toString() {
  return 'DoctorDetailsState(doctor: $doctor, schedule: $schedule, reviews: $reviews, reviewsPagination: $reviewsPagination, isLoadingDoctor: $isLoadingDoctor, isLoadingSchedule: $isLoadingSchedule, isLoadingReviews: $isLoadingReviews, errorDoctor: $errorDoctor, errorSchedule: $errorSchedule, errorReviews: $errorReviews, reviewsPage: $reviewsPage, reviewsSortBy: $reviewsSortBy, reviewsSortOrder: $reviewsSortOrder, specialtyName: $specialtyName)';
}


}

/// @nodoc
abstract mixin class _$DoctorDetailsStateCopyWith<$Res> implements $DoctorDetailsStateCopyWith<$Res> {
  factory _$DoctorDetailsStateCopyWith(_DoctorDetailsState value, $Res Function(_DoctorDetailsState) _then) = __$DoctorDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Doctor? doctor, List<Slot> schedule, List<Review> reviews, Pagination? reviewsPagination, bool isLoadingDoctor, bool isLoadingSchedule, bool isLoadingReviews, String? errorDoctor, String? errorSchedule, String? errorReviews, int reviewsPage, String reviewsSortBy, String reviewsSortOrder, String? specialtyName
});




}
/// @nodoc
class __$DoctorDetailsStateCopyWithImpl<$Res>
    implements _$DoctorDetailsStateCopyWith<$Res> {
  __$DoctorDetailsStateCopyWithImpl(this._self, this._then);

  final _DoctorDetailsState _self;
  final $Res Function(_DoctorDetailsState) _then;

/// Create a copy of DoctorDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctor = freezed,Object? schedule = null,Object? reviews = null,Object? reviewsPagination = freezed,Object? isLoadingDoctor = null,Object? isLoadingSchedule = null,Object? isLoadingReviews = null,Object? errorDoctor = freezed,Object? errorSchedule = freezed,Object? errorReviews = freezed,Object? reviewsPage = null,Object? reviewsSortBy = null,Object? reviewsSortOrder = null,Object? specialtyName = freezed,}) {
  return _then(_DoctorDetailsState(
doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as Doctor?,schedule: null == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<Slot>,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,reviewsPagination: freezed == reviewsPagination ? _self.reviewsPagination : reviewsPagination // ignore: cast_nullable_to_non_nullable
as Pagination?,isLoadingDoctor: null == isLoadingDoctor ? _self.isLoadingDoctor : isLoadingDoctor // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSchedule: null == isLoadingSchedule ? _self.isLoadingSchedule : isLoadingSchedule // ignore: cast_nullable_to_non_nullable
as bool,isLoadingReviews: null == isLoadingReviews ? _self.isLoadingReviews : isLoadingReviews // ignore: cast_nullable_to_non_nullable
as bool,errorDoctor: freezed == errorDoctor ? _self.errorDoctor : errorDoctor // ignore: cast_nullable_to_non_nullable
as String?,errorSchedule: freezed == errorSchedule ? _self.errorSchedule : errorSchedule // ignore: cast_nullable_to_non_nullable
as String?,errorReviews: freezed == errorReviews ? _self.errorReviews : errorReviews // ignore: cast_nullable_to_non_nullable
as String?,reviewsPage: null == reviewsPage ? _self.reviewsPage : reviewsPage // ignore: cast_nullable_to_non_nullable
as int,reviewsSortBy: null == reviewsSortBy ? _self.reviewsSortBy : reviewsSortBy // ignore: cast_nullable_to_non_nullable
as String,reviewsSortOrder: null == reviewsSortOrder ? _self.reviewsSortOrder : reviewsSortOrder // ignore: cast_nullable_to_non_nullable
as String,specialtyName: freezed == specialtyName ? _self.specialtyName : specialtyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
