// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorsState {

 List<Doctor> get doctors; List<Specialty> get specialties; bool get isLoadingDoctors; bool get isLoadingSpecialties; String? get errorMessage; int get currentPage; bool get hasNextPage; String get search; String? get selectedSpecialtyId; double? get minRating; String get sortBy; String get sortOrder; bool get isOffline;
/// Create a copy of DoctorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorsStateCopyWith<DoctorsState> get copyWith => _$DoctorsStateCopyWithImpl<DoctorsState>(this as DoctorsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsState&&const DeepCollectionEquality().equals(other.doctors, doctors)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&(identical(other.isLoadingDoctors, isLoadingDoctors) || other.isLoadingDoctors == isLoadingDoctors)&&(identical(other.isLoadingSpecialties, isLoadingSpecialties) || other.isLoadingSpecialties == isLoadingSpecialties)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.search, search) || other.search == search)&&(identical(other.selectedSpecialtyId, selectedSpecialtyId) || other.selectedSpecialtyId == selectedSpecialtyId)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(doctors),const DeepCollectionEquality().hash(specialties),isLoadingDoctors,isLoadingSpecialties,errorMessage,currentPage,hasNextPage,search,selectedSpecialtyId,minRating,sortBy,sortOrder,isOffline);

@override
String toString() {
  return 'DoctorsState(doctors: $doctors, specialties: $specialties, isLoadingDoctors: $isLoadingDoctors, isLoadingSpecialties: $isLoadingSpecialties, errorMessage: $errorMessage, currentPage: $currentPage, hasNextPage: $hasNextPage, search: $search, selectedSpecialtyId: $selectedSpecialtyId, minRating: $minRating, sortBy: $sortBy, sortOrder: $sortOrder, isOffline: $isOffline)';
}


}

/// @nodoc
abstract mixin class $DoctorsStateCopyWith<$Res>  {
  factory $DoctorsStateCopyWith(DoctorsState value, $Res Function(DoctorsState) _then) = _$DoctorsStateCopyWithImpl;
@useResult
$Res call({
 List<Doctor> doctors, List<Specialty> specialties, bool isLoadingDoctors, bool isLoadingSpecialties, String? errorMessage, int currentPage, bool hasNextPage, String search, String? selectedSpecialtyId, double? minRating, String sortBy, String sortOrder, bool isOffline
});




}
/// @nodoc
class _$DoctorsStateCopyWithImpl<$Res>
    implements $DoctorsStateCopyWith<$Res> {
  _$DoctorsStateCopyWithImpl(this._self, this._then);

  final DoctorsState _self;
  final $Res Function(DoctorsState) _then;

/// Create a copy of DoctorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctors = null,Object? specialties = null,Object? isLoadingDoctors = null,Object? isLoadingSpecialties = null,Object? errorMessage = freezed,Object? currentPage = null,Object? hasNextPage = null,Object? search = null,Object? selectedSpecialtyId = freezed,Object? minRating = freezed,Object? sortBy = null,Object? sortOrder = null,Object? isOffline = null,}) {
  return _then(_self.copyWith(
doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<Specialty>,isLoadingDoctors: null == isLoadingDoctors ? _self.isLoadingDoctors : isLoadingDoctors // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSpecialties: null == isLoadingSpecialties ? _self.isLoadingSpecialties : isLoadingSpecialties // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,selectedSpecialtyId: freezed == selectedSpecialtyId ? _self.selectedSpecialtyId : selectedSpecialtyId // ignore: cast_nullable_to_non_nullable
as String?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorsState].
extension DoctorsStatePatterns on DoctorsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorsState value)  $default,){
final _that = this;
switch (_that) {
case _DoctorsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorsState value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Doctor> doctors,  List<Specialty> specialties,  bool isLoadingDoctors,  bool isLoadingSpecialties,  String? errorMessage,  int currentPage,  bool hasNextPage,  String search,  String? selectedSpecialtyId,  double? minRating,  String sortBy,  String sortOrder,  bool isOffline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorsState() when $default != null:
return $default(_that.doctors,_that.specialties,_that.isLoadingDoctors,_that.isLoadingSpecialties,_that.errorMessage,_that.currentPage,_that.hasNextPage,_that.search,_that.selectedSpecialtyId,_that.minRating,_that.sortBy,_that.sortOrder,_that.isOffline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Doctor> doctors,  List<Specialty> specialties,  bool isLoadingDoctors,  bool isLoadingSpecialties,  String? errorMessage,  int currentPage,  bool hasNextPage,  String search,  String? selectedSpecialtyId,  double? minRating,  String sortBy,  String sortOrder,  bool isOffline)  $default,) {final _that = this;
switch (_that) {
case _DoctorsState():
return $default(_that.doctors,_that.specialties,_that.isLoadingDoctors,_that.isLoadingSpecialties,_that.errorMessage,_that.currentPage,_that.hasNextPage,_that.search,_that.selectedSpecialtyId,_that.minRating,_that.sortBy,_that.sortOrder,_that.isOffline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Doctor> doctors,  List<Specialty> specialties,  bool isLoadingDoctors,  bool isLoadingSpecialties,  String? errorMessage,  int currentPage,  bool hasNextPage,  String search,  String? selectedSpecialtyId,  double? minRating,  String sortBy,  String sortOrder,  bool isOffline)?  $default,) {final _that = this;
switch (_that) {
case _DoctorsState() when $default != null:
return $default(_that.doctors,_that.specialties,_that.isLoadingDoctors,_that.isLoadingSpecialties,_that.errorMessage,_that.currentPage,_that.hasNextPage,_that.search,_that.selectedSpecialtyId,_that.minRating,_that.sortBy,_that.sortOrder,_that.isOffline);case _:
  return null;

}
}

}

/// @nodoc


class _DoctorsState implements DoctorsState {
  const _DoctorsState({required final  List<Doctor> doctors, required final  List<Specialty> specialties, required this.isLoadingDoctors, required this.isLoadingSpecialties, required this.errorMessage, required this.currentPage, required this.hasNextPage, required this.search, required this.selectedSpecialtyId, required this.minRating, required this.sortBy, required this.sortOrder, required this.isOffline}): _doctors = doctors,_specialties = specialties;
  

 final  List<Doctor> _doctors;
@override List<Doctor> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

 final  List<Specialty> _specialties;
@override List<Specialty> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

@override final  bool isLoadingDoctors;
@override final  bool isLoadingSpecialties;
@override final  String? errorMessage;
@override final  int currentPage;
@override final  bool hasNextPage;
@override final  String search;
@override final  String? selectedSpecialtyId;
@override final  double? minRating;
@override final  String sortBy;
@override final  String sortOrder;
@override final  bool isOffline;

/// Create a copy of DoctorsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorsStateCopyWith<_DoctorsState> get copyWith => __$DoctorsStateCopyWithImpl<_DoctorsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorsState&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&(identical(other.isLoadingDoctors, isLoadingDoctors) || other.isLoadingDoctors == isLoadingDoctors)&&(identical(other.isLoadingSpecialties, isLoadingSpecialties) || other.isLoadingSpecialties == isLoadingSpecialties)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.search, search) || other.search == search)&&(identical(other.selectedSpecialtyId, selectedSpecialtyId) || other.selectedSpecialtyId == selectedSpecialtyId)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_doctors),const DeepCollectionEquality().hash(_specialties),isLoadingDoctors,isLoadingSpecialties,errorMessage,currentPage,hasNextPage,search,selectedSpecialtyId,minRating,sortBy,sortOrder,isOffline);

@override
String toString() {
  return 'DoctorsState(doctors: $doctors, specialties: $specialties, isLoadingDoctors: $isLoadingDoctors, isLoadingSpecialties: $isLoadingSpecialties, errorMessage: $errorMessage, currentPage: $currentPage, hasNextPage: $hasNextPage, search: $search, selectedSpecialtyId: $selectedSpecialtyId, minRating: $minRating, sortBy: $sortBy, sortOrder: $sortOrder, isOffline: $isOffline)';
}


}

/// @nodoc
abstract mixin class _$DoctorsStateCopyWith<$Res> implements $DoctorsStateCopyWith<$Res> {
  factory _$DoctorsStateCopyWith(_DoctorsState value, $Res Function(_DoctorsState) _then) = __$DoctorsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Doctor> doctors, List<Specialty> specialties, bool isLoadingDoctors, bool isLoadingSpecialties, String? errorMessage, int currentPage, bool hasNextPage, String search, String? selectedSpecialtyId, double? minRating, String sortBy, String sortOrder, bool isOffline
});




}
/// @nodoc
class __$DoctorsStateCopyWithImpl<$Res>
    implements _$DoctorsStateCopyWith<$Res> {
  __$DoctorsStateCopyWithImpl(this._self, this._then);

  final _DoctorsState _self;
  final $Res Function(_DoctorsState) _then;

/// Create a copy of DoctorsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctors = null,Object? specialties = null,Object? isLoadingDoctors = null,Object? isLoadingSpecialties = null,Object? errorMessage = freezed,Object? currentPage = null,Object? hasNextPage = null,Object? search = null,Object? selectedSpecialtyId = freezed,Object? minRating = freezed,Object? sortBy = null,Object? sortOrder = null,Object? isOffline = null,}) {
  return _then(_DoctorsState(
doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<Doctor>,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<Specialty>,isLoadingDoctors: null == isLoadingDoctors ? _self.isLoadingDoctors : isLoadingDoctors // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSpecialties: null == isLoadingSpecialties ? _self.isLoadingSpecialties : isLoadingSpecialties // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,selectedSpecialtyId: freezed == selectedSpecialtyId ? _self.selectedSpecialtyId : selectedSpecialtyId // ignore: cast_nullable_to_non_nullable
as String?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
