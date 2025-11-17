// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MenuBookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuBookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuBookingEvent()';
}


}

/// @nodoc
class $MenuBookingEventCopyWith<$Res>  {
$MenuBookingEventCopyWith(MenuBookingEvent _, $Res Function(MenuBookingEvent) __);
}


/// Adds pattern-matching-related methods to [MenuBookingEvent].
extension MenuBookingEventPatterns on MenuBookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BookingMenu value)?  bookingMenu,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingMenu() when bookingMenu != null:
return bookingMenu(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BookingMenu value)  bookingMenu,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BookingMenu():
return bookingMenu(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BookingMenu value)?  bookingMenu,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingMenu() when bookingMenu != null:
return bookingMenu(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Step1BookingDetails bookingDetails)?  bookingMenu,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingMenu() when bookingMenu != null:
return bookingMenu(_that.bookingDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Step1BookingDetails bookingDetails)  bookingMenu,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BookingMenu():
return bookingMenu(_that.bookingDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Step1BookingDetails bookingDetails)?  bookingMenu,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingMenu() when bookingMenu != null:
return bookingMenu(_that.bookingDetails);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements MenuBookingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuBookingEvent.started()';
}


}




/// @nodoc


class _BookingMenu implements MenuBookingEvent {
  const _BookingMenu(this.bookingDetails);
  

 final  Step1BookingDetails bookingDetails;

/// Create a copy of MenuBookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingMenuCopyWith<_BookingMenu> get copyWith => __$BookingMenuCopyWithImpl<_BookingMenu>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingMenu&&(identical(other.bookingDetails, bookingDetails) || other.bookingDetails == bookingDetails));
}


@override
int get hashCode => Object.hash(runtimeType,bookingDetails);

@override
String toString() {
  return 'MenuBookingEvent.bookingMenu(bookingDetails: $bookingDetails)';
}


}

/// @nodoc
abstract mixin class _$BookingMenuCopyWith<$Res> implements $MenuBookingEventCopyWith<$Res> {
  factory _$BookingMenuCopyWith(_BookingMenu value, $Res Function(_BookingMenu) _then) = __$BookingMenuCopyWithImpl;
@useResult
$Res call({
 Step1BookingDetails bookingDetails
});




}
/// @nodoc
class __$BookingMenuCopyWithImpl<$Res>
    implements _$BookingMenuCopyWith<$Res> {
  __$BookingMenuCopyWithImpl(this._self, this._then);

  final _BookingMenu _self;
  final $Res Function(_BookingMenu) _then;

/// Create a copy of MenuBookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingDetails = null,}) {
  return _then(_BookingMenu(
null == bookingDetails ? _self.bookingDetails : bookingDetails // ignore: cast_nullable_to_non_nullable
as Step1BookingDetails,
  ));
}


}

/// @nodoc
mixin _$MenuBookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuBookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuBookingState()';
}


}

/// @nodoc
class $MenuBookingStateCopyWith<$Res>  {
$MenuBookingStateCopyWith(MenuBookingState _, $Res Function(MenuBookingState) __);
}


/// Adds pattern-matching-related methods to [MenuBookingState].
extension MenuBookingStatePatterns on MenuBookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MenuBookingInitial value)?  initial,TResult Function( MenuBookingLoading value)?  menuBookingLoading,TResult Function( MenuBookingError value)?  menuBookingError,TResult Function( MenuBookingSuccess value)?  menuBookingSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MenuBookingInitial() when initial != null:
return initial(_that);case MenuBookingLoading() when menuBookingLoading != null:
return menuBookingLoading(_that);case MenuBookingError() when menuBookingError != null:
return menuBookingError(_that);case MenuBookingSuccess() when menuBookingSuccess != null:
return menuBookingSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MenuBookingInitial value)  initial,required TResult Function( MenuBookingLoading value)  menuBookingLoading,required TResult Function( MenuBookingError value)  menuBookingError,required TResult Function( MenuBookingSuccess value)  menuBookingSuccess,}){
final _that = this;
switch (_that) {
case MenuBookingInitial():
return initial(_that);case MenuBookingLoading():
return menuBookingLoading(_that);case MenuBookingError():
return menuBookingError(_that);case MenuBookingSuccess():
return menuBookingSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MenuBookingInitial value)?  initial,TResult? Function( MenuBookingLoading value)?  menuBookingLoading,TResult? Function( MenuBookingError value)?  menuBookingError,TResult? Function( MenuBookingSuccess value)?  menuBookingSuccess,}){
final _that = this;
switch (_that) {
case MenuBookingInitial() when initial != null:
return initial(_that);case MenuBookingLoading() when menuBookingLoading != null:
return menuBookingLoading(_that);case MenuBookingError() when menuBookingError != null:
return menuBookingError(_that);case MenuBookingSuccess() when menuBookingSuccess != null:
return menuBookingSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  menuBookingLoading,TResult Function( String errorMessage)?  menuBookingError,TResult Function( BookingResponseModel response)?  menuBookingSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MenuBookingInitial() when initial != null:
return initial();case MenuBookingLoading() when menuBookingLoading != null:
return menuBookingLoading();case MenuBookingError() when menuBookingError != null:
return menuBookingError(_that.errorMessage);case MenuBookingSuccess() when menuBookingSuccess != null:
return menuBookingSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  menuBookingLoading,required TResult Function( String errorMessage)  menuBookingError,required TResult Function( BookingResponseModel response)  menuBookingSuccess,}) {final _that = this;
switch (_that) {
case MenuBookingInitial():
return initial();case MenuBookingLoading():
return menuBookingLoading();case MenuBookingError():
return menuBookingError(_that.errorMessage);case MenuBookingSuccess():
return menuBookingSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  menuBookingLoading,TResult? Function( String errorMessage)?  menuBookingError,TResult? Function( BookingResponseModel response)?  menuBookingSuccess,}) {final _that = this;
switch (_that) {
case MenuBookingInitial() when initial != null:
return initial();case MenuBookingLoading() when menuBookingLoading != null:
return menuBookingLoading();case MenuBookingError() when menuBookingError != null:
return menuBookingError(_that.errorMessage);case MenuBookingSuccess() when menuBookingSuccess != null:
return menuBookingSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class MenuBookingInitial implements MenuBookingState {
  const MenuBookingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuBookingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuBookingState.initial()';
}


}




/// @nodoc


class MenuBookingLoading implements MenuBookingState {
  const MenuBookingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuBookingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuBookingState.menuBookingLoading()';
}


}




/// @nodoc


class MenuBookingError implements MenuBookingState {
  const MenuBookingError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of MenuBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuBookingErrorCopyWith<MenuBookingError> get copyWith => _$MenuBookingErrorCopyWithImpl<MenuBookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuBookingError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'MenuBookingState.menuBookingError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MenuBookingErrorCopyWith<$Res> implements $MenuBookingStateCopyWith<$Res> {
  factory $MenuBookingErrorCopyWith(MenuBookingError value, $Res Function(MenuBookingError) _then) = _$MenuBookingErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$MenuBookingErrorCopyWithImpl<$Res>
    implements $MenuBookingErrorCopyWith<$Res> {
  _$MenuBookingErrorCopyWithImpl(this._self, this._then);

  final MenuBookingError _self;
  final $Res Function(MenuBookingError) _then;

/// Create a copy of MenuBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(MenuBookingError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MenuBookingSuccess implements MenuBookingState {
  const MenuBookingSuccess(this.response);
  

 final  BookingResponseModel response;

/// Create a copy of MenuBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuBookingSuccessCopyWith<MenuBookingSuccess> get copyWith => _$MenuBookingSuccessCopyWithImpl<MenuBookingSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuBookingSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'MenuBookingState.menuBookingSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $MenuBookingSuccessCopyWith<$Res> implements $MenuBookingStateCopyWith<$Res> {
  factory $MenuBookingSuccessCopyWith(MenuBookingSuccess value, $Res Function(MenuBookingSuccess) _then) = _$MenuBookingSuccessCopyWithImpl;
@useResult
$Res call({
 BookingResponseModel response
});




}
/// @nodoc
class _$MenuBookingSuccessCopyWithImpl<$Res>
    implements $MenuBookingSuccessCopyWith<$Res> {
  _$MenuBookingSuccessCopyWithImpl(this._self, this._then);

  final MenuBookingSuccess _self;
  final $Res Function(MenuBookingSuccess) _then;

/// Create a copy of MenuBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(MenuBookingSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as BookingResponseModel,
  ));
}


}

// dart format on
