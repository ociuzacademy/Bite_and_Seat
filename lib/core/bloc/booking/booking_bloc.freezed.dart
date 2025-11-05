// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingEvent()';
}


}

/// @nodoc
class $BookingEventCopyWith<$Res>  {
$BookingEventCopyWith(BookingEvent _, $Res Function(BookingEvent) __);
}


/// Adds pattern-matching-related methods to [BookingEvent].
extension BookingEventPatterns on BookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Step1BookingStarted value)?  step1BookingStarted,TResult Function( _Step2BookingStarted value)?  step2BookingStarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Step1BookingStarted() when step1BookingStarted != null:
return step1BookingStarted(_that);case _Step2BookingStarted() when step2BookingStarted != null:
return step2BookingStarted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Step1BookingStarted value)  step1BookingStarted,required TResult Function( _Step2BookingStarted value)  step2BookingStarted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Step1BookingStarted():
return step1BookingStarted(_that);case _Step2BookingStarted():
return step2BookingStarted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Step1BookingStarted value)?  step1BookingStarted,TResult? Function( _Step2BookingStarted value)?  step2BookingStarted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Step1BookingStarted() when step1BookingStarted != null:
return step1BookingStarted(_that);case _Step2BookingStarted() when step2BookingStarted != null:
return step2BookingStarted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Step1BookingDetails bookingDetails)?  step1BookingStarted,TResult Function( int orderId,  Step2BookingDetails bookingDetails)?  step2BookingStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Step1BookingStarted() when step1BookingStarted != null:
return step1BookingStarted(_that.bookingDetails);case _Step2BookingStarted() when step2BookingStarted != null:
return step2BookingStarted(_that.orderId,_that.bookingDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Step1BookingDetails bookingDetails)  step1BookingStarted,required TResult Function( int orderId,  Step2BookingDetails bookingDetails)  step2BookingStarted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Step1BookingStarted():
return step1BookingStarted(_that.bookingDetails);case _Step2BookingStarted():
return step2BookingStarted(_that.orderId,_that.bookingDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Step1BookingDetails bookingDetails)?  step1BookingStarted,TResult? Function( int orderId,  Step2BookingDetails bookingDetails)?  step2BookingStarted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Step1BookingStarted() when step1BookingStarted != null:
return step1BookingStarted(_that.bookingDetails);case _Step2BookingStarted() when step2BookingStarted != null:
return step2BookingStarted(_that.orderId,_that.bookingDetails);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements BookingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingEvent.started()';
}


}




/// @nodoc


class _Step1BookingStarted implements BookingEvent {
  const _Step1BookingStarted(this.bookingDetails);
  

 final  Step1BookingDetails bookingDetails;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Step1BookingStartedCopyWith<_Step1BookingStarted> get copyWith => __$Step1BookingStartedCopyWithImpl<_Step1BookingStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Step1BookingStarted&&(identical(other.bookingDetails, bookingDetails) || other.bookingDetails == bookingDetails));
}


@override
int get hashCode => Object.hash(runtimeType,bookingDetails);

@override
String toString() {
  return 'BookingEvent.step1BookingStarted(bookingDetails: $bookingDetails)';
}


}

/// @nodoc
abstract mixin class _$Step1BookingStartedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$Step1BookingStartedCopyWith(_Step1BookingStarted value, $Res Function(_Step1BookingStarted) _then) = __$Step1BookingStartedCopyWithImpl;
@useResult
$Res call({
 Step1BookingDetails bookingDetails
});




}
/// @nodoc
class __$Step1BookingStartedCopyWithImpl<$Res>
    implements _$Step1BookingStartedCopyWith<$Res> {
  __$Step1BookingStartedCopyWithImpl(this._self, this._then);

  final _Step1BookingStarted _self;
  final $Res Function(_Step1BookingStarted) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingDetails = null,}) {
  return _then(_Step1BookingStarted(
null == bookingDetails ? _self.bookingDetails : bookingDetails // ignore: cast_nullable_to_non_nullable
as Step1BookingDetails,
  ));
}


}

/// @nodoc


class _Step2BookingStarted implements BookingEvent {
  const _Step2BookingStarted(this.orderId, this.bookingDetails);
  

 final  int orderId;
 final  Step2BookingDetails bookingDetails;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Step2BookingStartedCopyWith<_Step2BookingStarted> get copyWith => __$Step2BookingStartedCopyWithImpl<_Step2BookingStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Step2BookingStarted&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.bookingDetails, bookingDetails) || other.bookingDetails == bookingDetails));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,bookingDetails);

@override
String toString() {
  return 'BookingEvent.step2BookingStarted(orderId: $orderId, bookingDetails: $bookingDetails)';
}


}

/// @nodoc
abstract mixin class _$Step2BookingStartedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$Step2BookingStartedCopyWith(_Step2BookingStarted value, $Res Function(_Step2BookingStarted) _then) = __$Step2BookingStartedCopyWithImpl;
@useResult
$Res call({
 int orderId, Step2BookingDetails bookingDetails
});




}
/// @nodoc
class __$Step2BookingStartedCopyWithImpl<$Res>
    implements _$Step2BookingStartedCopyWith<$Res> {
  __$Step2BookingStartedCopyWithImpl(this._self, this._then);

  final _Step2BookingStarted _self;
  final $Res Function(_Step2BookingStarted) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? bookingDetails = null,}) {
  return _then(_Step2BookingStarted(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,null == bookingDetails ? _self.bookingDetails : bookingDetails // ignore: cast_nullable_to_non_nullable
as Step2BookingDetails,
  ));
}


}

/// @nodoc
mixin _$BookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState()';
}


}

/// @nodoc
class $BookingStateCopyWith<$Res>  {
$BookingStateCopyWith(BookingState _, $Res Function(BookingState) __);
}


/// Adds pattern-matching-related methods to [BookingState].
extension BookingStatePatterns on BookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookingInitial value)?  initial,TResult Function( BookingLoading value)?  bookingLoading,TResult Function( BookingError value)?  bookingError,TResult Function( Step1Completed value)?  step1Completed,TResult Function( Step2Completed value)?  step2Completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial(_that);case BookingLoading() when bookingLoading != null:
return bookingLoading(_that);case BookingError() when bookingError != null:
return bookingError(_that);case Step1Completed() when step1Completed != null:
return step1Completed(_that);case Step2Completed() when step2Completed != null:
return step2Completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookingInitial value)  initial,required TResult Function( BookingLoading value)  bookingLoading,required TResult Function( BookingError value)  bookingError,required TResult Function( Step1Completed value)  step1Completed,required TResult Function( Step2Completed value)  step2Completed,}){
final _that = this;
switch (_that) {
case BookingInitial():
return initial(_that);case BookingLoading():
return bookingLoading(_that);case BookingError():
return bookingError(_that);case Step1Completed():
return step1Completed(_that);case Step2Completed():
return step2Completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookingInitial value)?  initial,TResult? Function( BookingLoading value)?  bookingLoading,TResult? Function( BookingError value)?  bookingError,TResult? Function( Step1Completed value)?  step1Completed,TResult? Function( Step2Completed value)?  step2Completed,}){
final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial(_that);case BookingLoading() when bookingLoading != null:
return bookingLoading(_that);case BookingError() when bookingError != null:
return bookingError(_that);case Step1Completed() when step1Completed != null:
return step1Completed(_that);case Step2Completed() when step2Completed != null:
return step2Completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  bookingLoading,TResult Function( String errorMessage)?  bookingError,TResult Function( BookingResponseModel response)?  step1Completed,TResult Function( BookingResponseModel response)?  step2Completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial();case BookingLoading() when bookingLoading != null:
return bookingLoading();case BookingError() when bookingError != null:
return bookingError(_that.errorMessage);case Step1Completed() when step1Completed != null:
return step1Completed(_that.response);case Step2Completed() when step2Completed != null:
return step2Completed(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  bookingLoading,required TResult Function( String errorMessage)  bookingError,required TResult Function( BookingResponseModel response)  step1Completed,required TResult Function( BookingResponseModel response)  step2Completed,}) {final _that = this;
switch (_that) {
case BookingInitial():
return initial();case BookingLoading():
return bookingLoading();case BookingError():
return bookingError(_that.errorMessage);case Step1Completed():
return step1Completed(_that.response);case Step2Completed():
return step2Completed(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  bookingLoading,TResult? Function( String errorMessage)?  bookingError,TResult? Function( BookingResponseModel response)?  step1Completed,TResult? Function( BookingResponseModel response)?  step2Completed,}) {final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial();case BookingLoading() when bookingLoading != null:
return bookingLoading();case BookingError() when bookingError != null:
return bookingError(_that.errorMessage);case Step1Completed() when step1Completed != null:
return step1Completed(_that.response);case Step2Completed() when step2Completed != null:
return step2Completed(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class BookingInitial implements BookingState {
  const BookingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState.initial()';
}


}




/// @nodoc


class BookingLoading implements BookingState {
  const BookingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState.bookingLoading()';
}


}




/// @nodoc


class BookingError implements BookingState {
  const BookingError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingErrorCopyWith<BookingError> get copyWith => _$BookingErrorCopyWithImpl<BookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'BookingState.bookingError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BookingErrorCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $BookingErrorCopyWith(BookingError value, $Res Function(BookingError) _then) = _$BookingErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$BookingErrorCopyWithImpl<$Res>
    implements $BookingErrorCopyWith<$Res> {
  _$BookingErrorCopyWithImpl(this._self, this._then);

  final BookingError _self;
  final $Res Function(BookingError) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(BookingError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Step1Completed implements BookingState {
  const Step1Completed(this.response);
  

 final  BookingResponseModel response;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Step1CompletedCopyWith<Step1Completed> get copyWith => _$Step1CompletedCopyWithImpl<Step1Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Step1Completed&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'BookingState.step1Completed(response: $response)';
}


}

/// @nodoc
abstract mixin class $Step1CompletedCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $Step1CompletedCopyWith(Step1Completed value, $Res Function(Step1Completed) _then) = _$Step1CompletedCopyWithImpl;
@useResult
$Res call({
 BookingResponseModel response
});




}
/// @nodoc
class _$Step1CompletedCopyWithImpl<$Res>
    implements $Step1CompletedCopyWith<$Res> {
  _$Step1CompletedCopyWithImpl(this._self, this._then);

  final Step1Completed _self;
  final $Res Function(Step1Completed) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(Step1Completed(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as BookingResponseModel,
  ));
}


}

/// @nodoc


class Step2Completed implements BookingState {
  const Step2Completed(this.response);
  

 final  BookingResponseModel response;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Step2CompletedCopyWith<Step2Completed> get copyWith => _$Step2CompletedCopyWithImpl<Step2Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Step2Completed&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'BookingState.step2Completed(response: $response)';
}


}

/// @nodoc
abstract mixin class $Step2CompletedCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $Step2CompletedCopyWith(Step2Completed value, $Res Function(Step2Completed) _then) = _$Step2CompletedCopyWithImpl;
@useResult
$Res call({
 BookingResponseModel response
});




}
/// @nodoc
class _$Step2CompletedCopyWithImpl<$Res>
    implements $Step2CompletedCopyWith<$Res> {
  _$Step2CompletedCopyWithImpl(this._self, this._then);

  final Step2Completed _self;
  final $Res Function(Step2Completed) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(Step2Completed(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as BookingResponseModel,
  ));
}


}

// dart format on
