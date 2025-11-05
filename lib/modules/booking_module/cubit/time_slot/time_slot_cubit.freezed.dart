// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeSlotState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimeSlotState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimeSlotState()';
}


}

/// @nodoc
class $TimeSlotStateCopyWith<$Res>  {
$TimeSlotStateCopyWith(TimeSlotState _, $Res Function(TimeSlotState) __);
}


/// Adds pattern-matching-related methods to [TimeSlotState].
extension TimeSlotStatePatterns on TimeSlotState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimeSlotInitial value)?  initial,TResult Function( TimeSlotLoading value)?  timeSlotLoading,TResult Function( TimeSlotError value)?  timeSlotError,TResult Function( CategoryTimeSlotsSuccess value)?  categoryTimeSlotsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimeSlotInitial() when initial != null:
return initial(_that);case TimeSlotLoading() when timeSlotLoading != null:
return timeSlotLoading(_that);case TimeSlotError() when timeSlotError != null:
return timeSlotError(_that);case CategoryTimeSlotsSuccess() when categoryTimeSlotsSuccess != null:
return categoryTimeSlotsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimeSlotInitial value)  initial,required TResult Function( TimeSlotLoading value)  timeSlotLoading,required TResult Function( TimeSlotError value)  timeSlotError,required TResult Function( CategoryTimeSlotsSuccess value)  categoryTimeSlotsSuccess,}){
final _that = this;
switch (_that) {
case TimeSlotInitial():
return initial(_that);case TimeSlotLoading():
return timeSlotLoading(_that);case TimeSlotError():
return timeSlotError(_that);case CategoryTimeSlotsSuccess():
return categoryTimeSlotsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimeSlotInitial value)?  initial,TResult? Function( TimeSlotLoading value)?  timeSlotLoading,TResult? Function( TimeSlotError value)?  timeSlotError,TResult? Function( CategoryTimeSlotsSuccess value)?  categoryTimeSlotsSuccess,}){
final _that = this;
switch (_that) {
case TimeSlotInitial() when initial != null:
return initial(_that);case TimeSlotLoading() when timeSlotLoading != null:
return timeSlotLoading(_that);case TimeSlotError() when timeSlotError != null:
return timeSlotError(_that);case CategoryTimeSlotsSuccess() when categoryTimeSlotsSuccess != null:
return categoryTimeSlotsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  timeSlotLoading,TResult Function( String errorMessage)?  timeSlotError,TResult Function( List<CategoryTimeSlotModel> timeSlots)?  categoryTimeSlotsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimeSlotInitial() when initial != null:
return initial();case TimeSlotLoading() when timeSlotLoading != null:
return timeSlotLoading();case TimeSlotError() when timeSlotError != null:
return timeSlotError(_that.errorMessage);case CategoryTimeSlotsSuccess() when categoryTimeSlotsSuccess != null:
return categoryTimeSlotsSuccess(_that.timeSlots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  timeSlotLoading,required TResult Function( String errorMessage)  timeSlotError,required TResult Function( List<CategoryTimeSlotModel> timeSlots)  categoryTimeSlotsSuccess,}) {final _that = this;
switch (_that) {
case TimeSlotInitial():
return initial();case TimeSlotLoading():
return timeSlotLoading();case TimeSlotError():
return timeSlotError(_that.errorMessage);case CategoryTimeSlotsSuccess():
return categoryTimeSlotsSuccess(_that.timeSlots);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  timeSlotLoading,TResult? Function( String errorMessage)?  timeSlotError,TResult? Function( List<CategoryTimeSlotModel> timeSlots)?  categoryTimeSlotsSuccess,}) {final _that = this;
switch (_that) {
case TimeSlotInitial() when initial != null:
return initial();case TimeSlotLoading() when timeSlotLoading != null:
return timeSlotLoading();case TimeSlotError() when timeSlotError != null:
return timeSlotError(_that.errorMessage);case CategoryTimeSlotsSuccess() when categoryTimeSlotsSuccess != null:
return categoryTimeSlotsSuccess(_that.timeSlots);case _:
  return null;

}
}

}

/// @nodoc


class TimeSlotInitial with DiagnosticableTreeMixin implements TimeSlotState {
  const TimeSlotInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimeSlotState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimeSlotState.initial()';
}


}




/// @nodoc


class TimeSlotLoading with DiagnosticableTreeMixin implements TimeSlotState {
  const TimeSlotLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimeSlotState.timeSlotLoading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimeSlotState.timeSlotLoading()';
}


}




/// @nodoc


class TimeSlotError with DiagnosticableTreeMixin implements TimeSlotState {
  const TimeSlotError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of TimeSlotState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotErrorCopyWith<TimeSlotError> get copyWith => _$TimeSlotErrorCopyWithImpl<TimeSlotError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimeSlotState.timeSlotError'))
    ..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimeSlotState.timeSlotError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TimeSlotErrorCopyWith<$Res> implements $TimeSlotStateCopyWith<$Res> {
  factory $TimeSlotErrorCopyWith(TimeSlotError value, $Res Function(TimeSlotError) _then) = _$TimeSlotErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TimeSlotErrorCopyWithImpl<$Res>
    implements $TimeSlotErrorCopyWith<$Res> {
  _$TimeSlotErrorCopyWithImpl(this._self, this._then);

  final TimeSlotError _self;
  final $Res Function(TimeSlotError) _then;

/// Create a copy of TimeSlotState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TimeSlotError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CategoryTimeSlotsSuccess with DiagnosticableTreeMixin implements TimeSlotState {
  const CategoryTimeSlotsSuccess(final  List<CategoryTimeSlotModel> timeSlots): _timeSlots = timeSlots;
  

 final  List<CategoryTimeSlotModel> _timeSlots;
 List<CategoryTimeSlotModel> get timeSlots {
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeSlots);
}


/// Create a copy of TimeSlotState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryTimeSlotsSuccessCopyWith<CategoryTimeSlotsSuccess> get copyWith => _$CategoryTimeSlotsSuccessCopyWithImpl<CategoryTimeSlotsSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimeSlotState.categoryTimeSlotsSuccess'))
    ..add(DiagnosticsProperty('timeSlots', timeSlots));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryTimeSlotsSuccess&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timeSlots));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimeSlotState.categoryTimeSlotsSuccess(timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class $CategoryTimeSlotsSuccessCopyWith<$Res> implements $TimeSlotStateCopyWith<$Res> {
  factory $CategoryTimeSlotsSuccessCopyWith(CategoryTimeSlotsSuccess value, $Res Function(CategoryTimeSlotsSuccess) _then) = _$CategoryTimeSlotsSuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryTimeSlotModel> timeSlots
});




}
/// @nodoc
class _$CategoryTimeSlotsSuccessCopyWithImpl<$Res>
    implements $CategoryTimeSlotsSuccessCopyWith<$Res> {
  _$CategoryTimeSlotsSuccessCopyWithImpl(this._self, this._then);

  final CategoryTimeSlotsSuccess _self;
  final $Res Function(CategoryTimeSlotsSuccess) _then;

/// Create a copy of TimeSlotState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeSlots = null,}) {
  return _then(CategoryTimeSlotsSuccess(
null == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<CategoryTimeSlotModel>,
  ));
}


}

// dart format on
