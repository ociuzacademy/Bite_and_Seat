// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot_booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeSlotBookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotBookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotBookingEvent()';
}


}

/// @nodoc
class $TimeSlotBookingEventCopyWith<$Res>  {
$TimeSlotBookingEventCopyWith(TimeSlotBookingEvent _, $Res Function(TimeSlotBookingEvent) __);
}


/// Adds pattern-matching-related methods to [TimeSlotBookingEvent].
extension TimeSlotBookingEventPatterns on TimeSlotBookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BookingTimeSlot value)?  bookingTimeSlot,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingTimeSlot() when bookingTimeSlot != null:
return bookingTimeSlot(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BookingTimeSlot value)  bookingTimeSlot,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BookingTimeSlot():
return bookingTimeSlot(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BookingTimeSlot value)?  bookingTimeSlot,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingTimeSlot() when bookingTimeSlot != null:
return bookingTimeSlot(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int orderId,  Step2BookingDetails bookingDetails)?  bookingTimeSlot,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingTimeSlot() when bookingTimeSlot != null:
return bookingTimeSlot(_that.orderId,_that.bookingDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int orderId,  Step2BookingDetails bookingDetails)  bookingTimeSlot,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BookingTimeSlot():
return bookingTimeSlot(_that.orderId,_that.bookingDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int orderId,  Step2BookingDetails bookingDetails)?  bookingTimeSlot,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingTimeSlot() when bookingTimeSlot != null:
return bookingTimeSlot(_that.orderId,_that.bookingDetails);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TimeSlotBookingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotBookingEvent.started()';
}


}




/// @nodoc


class _BookingTimeSlot implements TimeSlotBookingEvent {
  const _BookingTimeSlot(this.orderId, this.bookingDetails);
  

 final  int orderId;
 final  Step2BookingDetails bookingDetails;

/// Create a copy of TimeSlotBookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingTimeSlotCopyWith<_BookingTimeSlot> get copyWith => __$BookingTimeSlotCopyWithImpl<_BookingTimeSlot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingTimeSlot&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.bookingDetails, bookingDetails) || other.bookingDetails == bookingDetails));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,bookingDetails);

@override
String toString() {
  return 'TimeSlotBookingEvent.bookingTimeSlot(orderId: $orderId, bookingDetails: $bookingDetails)';
}


}

/// @nodoc
abstract mixin class _$BookingTimeSlotCopyWith<$Res> implements $TimeSlotBookingEventCopyWith<$Res> {
  factory _$BookingTimeSlotCopyWith(_BookingTimeSlot value, $Res Function(_BookingTimeSlot) _then) = __$BookingTimeSlotCopyWithImpl;
@useResult
$Res call({
 int orderId, Step2BookingDetails bookingDetails
});




}
/// @nodoc
class __$BookingTimeSlotCopyWithImpl<$Res>
    implements _$BookingTimeSlotCopyWith<$Res> {
  __$BookingTimeSlotCopyWithImpl(this._self, this._then);

  final _BookingTimeSlot _self;
  final $Res Function(_BookingTimeSlot) _then;

/// Create a copy of TimeSlotBookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? bookingDetails = null,}) {
  return _then(_BookingTimeSlot(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,null == bookingDetails ? _self.bookingDetails : bookingDetails // ignore: cast_nullable_to_non_nullable
as Step2BookingDetails,
  ));
}


}

/// @nodoc
mixin _$TimeSlotBookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotBookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotBookingState()';
}


}

/// @nodoc
class $TimeSlotBookingStateCopyWith<$Res>  {
$TimeSlotBookingStateCopyWith(TimeSlotBookingState _, $Res Function(TimeSlotBookingState) __);
}


/// Adds pattern-matching-related methods to [TimeSlotBookingState].
extension TimeSlotBookingStatePatterns on TimeSlotBookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimeSlotBookingInitial value)?  initial,TResult Function( TimeSlotBookingLoading value)?  timeSlotBookingLoading,TResult Function( TimeSlotBookingError value)?  timeSlotBookingError,TResult Function( TimeSlotBookingSuccess value)?  timeSlotBookingSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimeSlotBookingInitial() when initial != null:
return initial(_that);case TimeSlotBookingLoading() when timeSlotBookingLoading != null:
return timeSlotBookingLoading(_that);case TimeSlotBookingError() when timeSlotBookingError != null:
return timeSlotBookingError(_that);case TimeSlotBookingSuccess() when timeSlotBookingSuccess != null:
return timeSlotBookingSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimeSlotBookingInitial value)  initial,required TResult Function( TimeSlotBookingLoading value)  timeSlotBookingLoading,required TResult Function( TimeSlotBookingError value)  timeSlotBookingError,required TResult Function( TimeSlotBookingSuccess value)  timeSlotBookingSuccess,}){
final _that = this;
switch (_that) {
case TimeSlotBookingInitial():
return initial(_that);case TimeSlotBookingLoading():
return timeSlotBookingLoading(_that);case TimeSlotBookingError():
return timeSlotBookingError(_that);case TimeSlotBookingSuccess():
return timeSlotBookingSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimeSlotBookingInitial value)?  initial,TResult? Function( TimeSlotBookingLoading value)?  timeSlotBookingLoading,TResult? Function( TimeSlotBookingError value)?  timeSlotBookingError,TResult? Function( TimeSlotBookingSuccess value)?  timeSlotBookingSuccess,}){
final _that = this;
switch (_that) {
case TimeSlotBookingInitial() when initial != null:
return initial(_that);case TimeSlotBookingLoading() when timeSlotBookingLoading != null:
return timeSlotBookingLoading(_that);case TimeSlotBookingError() when timeSlotBookingError != null:
return timeSlotBookingError(_that);case TimeSlotBookingSuccess() when timeSlotBookingSuccess != null:
return timeSlotBookingSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  timeSlotBookingLoading,TResult Function( String errorMessage)?  timeSlotBookingError,TResult Function( BookingResponseModel response)?  timeSlotBookingSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimeSlotBookingInitial() when initial != null:
return initial();case TimeSlotBookingLoading() when timeSlotBookingLoading != null:
return timeSlotBookingLoading();case TimeSlotBookingError() when timeSlotBookingError != null:
return timeSlotBookingError(_that.errorMessage);case TimeSlotBookingSuccess() when timeSlotBookingSuccess != null:
return timeSlotBookingSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  timeSlotBookingLoading,required TResult Function( String errorMessage)  timeSlotBookingError,required TResult Function( BookingResponseModel response)  timeSlotBookingSuccess,}) {final _that = this;
switch (_that) {
case TimeSlotBookingInitial():
return initial();case TimeSlotBookingLoading():
return timeSlotBookingLoading();case TimeSlotBookingError():
return timeSlotBookingError(_that.errorMessage);case TimeSlotBookingSuccess():
return timeSlotBookingSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  timeSlotBookingLoading,TResult? Function( String errorMessage)?  timeSlotBookingError,TResult? Function( BookingResponseModel response)?  timeSlotBookingSuccess,}) {final _that = this;
switch (_that) {
case TimeSlotBookingInitial() when initial != null:
return initial();case TimeSlotBookingLoading() when timeSlotBookingLoading != null:
return timeSlotBookingLoading();case TimeSlotBookingError() when timeSlotBookingError != null:
return timeSlotBookingError(_that.errorMessage);case TimeSlotBookingSuccess() when timeSlotBookingSuccess != null:
return timeSlotBookingSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class TimeSlotBookingInitial implements TimeSlotBookingState {
  const TimeSlotBookingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotBookingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotBookingState.initial()';
}


}




/// @nodoc


class TimeSlotBookingLoading implements TimeSlotBookingState {
  const TimeSlotBookingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotBookingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotBookingState.timeSlotBookingLoading()';
}


}




/// @nodoc


class TimeSlotBookingError implements TimeSlotBookingState {
  const TimeSlotBookingError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of TimeSlotBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotBookingErrorCopyWith<TimeSlotBookingError> get copyWith => _$TimeSlotBookingErrorCopyWithImpl<TimeSlotBookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotBookingError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TimeSlotBookingState.timeSlotBookingError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TimeSlotBookingErrorCopyWith<$Res> implements $TimeSlotBookingStateCopyWith<$Res> {
  factory $TimeSlotBookingErrorCopyWith(TimeSlotBookingError value, $Res Function(TimeSlotBookingError) _then) = _$TimeSlotBookingErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TimeSlotBookingErrorCopyWithImpl<$Res>
    implements $TimeSlotBookingErrorCopyWith<$Res> {
  _$TimeSlotBookingErrorCopyWithImpl(this._self, this._then);

  final TimeSlotBookingError _self;
  final $Res Function(TimeSlotBookingError) _then;

/// Create a copy of TimeSlotBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TimeSlotBookingError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TimeSlotBookingSuccess implements TimeSlotBookingState {
  const TimeSlotBookingSuccess(this.response);
  

 final  BookingResponseModel response;

/// Create a copy of TimeSlotBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotBookingSuccessCopyWith<TimeSlotBookingSuccess> get copyWith => _$TimeSlotBookingSuccessCopyWithImpl<TimeSlotBookingSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotBookingSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'TimeSlotBookingState.timeSlotBookingSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $TimeSlotBookingSuccessCopyWith<$Res> implements $TimeSlotBookingStateCopyWith<$Res> {
  factory $TimeSlotBookingSuccessCopyWith(TimeSlotBookingSuccess value, $Res Function(TimeSlotBookingSuccess) _then) = _$TimeSlotBookingSuccessCopyWithImpl;
@useResult
$Res call({
 BookingResponseModel response
});




}
/// @nodoc
class _$TimeSlotBookingSuccessCopyWithImpl<$Res>
    implements $TimeSlotBookingSuccessCopyWith<$Res> {
  _$TimeSlotBookingSuccessCopyWithImpl(this._self, this._then);

  final TimeSlotBookingSuccess _self;
  final $Res Function(TimeSlotBookingSuccess) _then;

/// Create a copy of TimeSlotBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(TimeSlotBookingSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as BookingResponseModel,
  ));
}


}

// dart format on
