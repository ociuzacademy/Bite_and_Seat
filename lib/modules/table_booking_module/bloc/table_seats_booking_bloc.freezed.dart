// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_seats_booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableSeatsBookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsBookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsBookingEvent()';
}


}

/// @nodoc
class $TableSeatsBookingEventCopyWith<$Res>  {
$TableSeatsBookingEventCopyWith(TableSeatsBookingEvent _, $Res Function(TableSeatsBookingEvent) __);
}


/// Adds pattern-matching-related methods to [TableSeatsBookingEvent].
extension TableSeatsBookingEventPatterns on TableSeatsBookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BookingTableSeats value)?  bookingTableSeats,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingTableSeats() when bookingTableSeats != null:
return bookingTableSeats(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BookingTableSeats value)  bookingTableSeats,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BookingTableSeats():
return bookingTableSeats(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BookingTableSeats value)?  bookingTableSeats,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BookingTableSeats() when bookingTableSeats != null:
return bookingTableSeats(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int orderId,  SelectedTablesModel selectedTables)?  bookingTableSeats,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingTableSeats() when bookingTableSeats != null:
return bookingTableSeats(_that.orderId,_that.selectedTables);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int orderId,  SelectedTablesModel selectedTables)  bookingTableSeats,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BookingTableSeats():
return bookingTableSeats(_that.orderId,_that.selectedTables);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int orderId,  SelectedTablesModel selectedTables)?  bookingTableSeats,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BookingTableSeats() when bookingTableSeats != null:
return bookingTableSeats(_that.orderId,_that.selectedTables);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TableSeatsBookingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsBookingEvent.started()';
}


}




/// @nodoc


class _BookingTableSeats implements TableSeatsBookingEvent {
  const _BookingTableSeats(this.orderId, this.selectedTables);
  

 final  int orderId;
 final  SelectedTablesModel selectedTables;

/// Create a copy of TableSeatsBookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingTableSeatsCopyWith<_BookingTableSeats> get copyWith => __$BookingTableSeatsCopyWithImpl<_BookingTableSeats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingTableSeats&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other.selectedTables, selectedTables));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,const DeepCollectionEquality().hash(selectedTables));

@override
String toString() {
  return 'TableSeatsBookingEvent.bookingTableSeats(orderId: $orderId, selectedTables: $selectedTables)';
}


}

/// @nodoc
abstract mixin class _$BookingTableSeatsCopyWith<$Res> implements $TableSeatsBookingEventCopyWith<$Res> {
  factory _$BookingTableSeatsCopyWith(_BookingTableSeats value, $Res Function(_BookingTableSeats) _then) = __$BookingTableSeatsCopyWithImpl;
@useResult
$Res call({
 int orderId, SelectedTablesModel selectedTables
});




}
/// @nodoc
class __$BookingTableSeatsCopyWithImpl<$Res>
    implements _$BookingTableSeatsCopyWith<$Res> {
  __$BookingTableSeatsCopyWithImpl(this._self, this._then);

  final _BookingTableSeats _self;
  final $Res Function(_BookingTableSeats) _then;

/// Create a copy of TableSeatsBookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? selectedTables = freezed,}) {
  return _then(_BookingTableSeats(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,freezed == selectedTables ? _self.selectedTables : selectedTables // ignore: cast_nullable_to_non_nullable
as SelectedTablesModel,
  ));
}


}

/// @nodoc
mixin _$TableSeatsBookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsBookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsBookingState()';
}


}

/// @nodoc
class $TableSeatsBookingStateCopyWith<$Res>  {
$TableSeatsBookingStateCopyWith(TableSeatsBookingState _, $Res Function(TableSeatsBookingState) __);
}


/// Adds pattern-matching-related methods to [TableSeatsBookingState].
extension TableSeatsBookingStatePatterns on TableSeatsBookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TableSeatsBookingInitial value)?  initial,TResult Function( TableSeatsBookingLoading value)?  tableSeatsBookingLoading,TResult Function( TableSeatsBookingError value)?  tableSeatsBookingError,TResult Function( TableSeatsBookingSuccess value)?  tableSeatsBookingSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TableSeatsBookingInitial() when initial != null:
return initial(_that);case TableSeatsBookingLoading() when tableSeatsBookingLoading != null:
return tableSeatsBookingLoading(_that);case TableSeatsBookingError() when tableSeatsBookingError != null:
return tableSeatsBookingError(_that);case TableSeatsBookingSuccess() when tableSeatsBookingSuccess != null:
return tableSeatsBookingSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TableSeatsBookingInitial value)  initial,required TResult Function( TableSeatsBookingLoading value)  tableSeatsBookingLoading,required TResult Function( TableSeatsBookingError value)  tableSeatsBookingError,required TResult Function( TableSeatsBookingSuccess value)  tableSeatsBookingSuccess,}){
final _that = this;
switch (_that) {
case TableSeatsBookingInitial():
return initial(_that);case TableSeatsBookingLoading():
return tableSeatsBookingLoading(_that);case TableSeatsBookingError():
return tableSeatsBookingError(_that);case TableSeatsBookingSuccess():
return tableSeatsBookingSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TableSeatsBookingInitial value)?  initial,TResult? Function( TableSeatsBookingLoading value)?  tableSeatsBookingLoading,TResult? Function( TableSeatsBookingError value)?  tableSeatsBookingError,TResult? Function( TableSeatsBookingSuccess value)?  tableSeatsBookingSuccess,}){
final _that = this;
switch (_that) {
case TableSeatsBookingInitial() when initial != null:
return initial(_that);case TableSeatsBookingLoading() when tableSeatsBookingLoading != null:
return tableSeatsBookingLoading(_that);case TableSeatsBookingError() when tableSeatsBookingError != null:
return tableSeatsBookingError(_that);case TableSeatsBookingSuccess() when tableSeatsBookingSuccess != null:
return tableSeatsBookingSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  tableSeatsBookingLoading,TResult Function( String errorMessage)?  tableSeatsBookingError,TResult Function( BookingResponseModel response)?  tableSeatsBookingSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TableSeatsBookingInitial() when initial != null:
return initial();case TableSeatsBookingLoading() when tableSeatsBookingLoading != null:
return tableSeatsBookingLoading();case TableSeatsBookingError() when tableSeatsBookingError != null:
return tableSeatsBookingError(_that.errorMessage);case TableSeatsBookingSuccess() when tableSeatsBookingSuccess != null:
return tableSeatsBookingSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  tableSeatsBookingLoading,required TResult Function( String errorMessage)  tableSeatsBookingError,required TResult Function( BookingResponseModel response)  tableSeatsBookingSuccess,}) {final _that = this;
switch (_that) {
case TableSeatsBookingInitial():
return initial();case TableSeatsBookingLoading():
return tableSeatsBookingLoading();case TableSeatsBookingError():
return tableSeatsBookingError(_that.errorMessage);case TableSeatsBookingSuccess():
return tableSeatsBookingSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  tableSeatsBookingLoading,TResult? Function( String errorMessage)?  tableSeatsBookingError,TResult? Function( BookingResponseModel response)?  tableSeatsBookingSuccess,}) {final _that = this;
switch (_that) {
case TableSeatsBookingInitial() when initial != null:
return initial();case TableSeatsBookingLoading() when tableSeatsBookingLoading != null:
return tableSeatsBookingLoading();case TableSeatsBookingError() when tableSeatsBookingError != null:
return tableSeatsBookingError(_that.errorMessage);case TableSeatsBookingSuccess() when tableSeatsBookingSuccess != null:
return tableSeatsBookingSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class TableSeatsBookingInitial implements TableSeatsBookingState {
  const TableSeatsBookingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsBookingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsBookingState.initial()';
}


}




/// @nodoc


class TableSeatsBookingLoading implements TableSeatsBookingState {
  const TableSeatsBookingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsBookingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsBookingState.tableSeatsBookingLoading()';
}


}




/// @nodoc


class TableSeatsBookingError implements TableSeatsBookingState {
  const TableSeatsBookingError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of TableSeatsBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableSeatsBookingErrorCopyWith<TableSeatsBookingError> get copyWith => _$TableSeatsBookingErrorCopyWithImpl<TableSeatsBookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsBookingError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TableSeatsBookingState.tableSeatsBookingError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TableSeatsBookingErrorCopyWith<$Res> implements $TableSeatsBookingStateCopyWith<$Res> {
  factory $TableSeatsBookingErrorCopyWith(TableSeatsBookingError value, $Res Function(TableSeatsBookingError) _then) = _$TableSeatsBookingErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TableSeatsBookingErrorCopyWithImpl<$Res>
    implements $TableSeatsBookingErrorCopyWith<$Res> {
  _$TableSeatsBookingErrorCopyWithImpl(this._self, this._then);

  final TableSeatsBookingError _self;
  final $Res Function(TableSeatsBookingError) _then;

/// Create a copy of TableSeatsBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TableSeatsBookingError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TableSeatsBookingSuccess implements TableSeatsBookingState {
  const TableSeatsBookingSuccess(this.response);
  

 final  BookingResponseModel response;

/// Create a copy of TableSeatsBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableSeatsBookingSuccessCopyWith<TableSeatsBookingSuccess> get copyWith => _$TableSeatsBookingSuccessCopyWithImpl<TableSeatsBookingSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsBookingSuccess&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'TableSeatsBookingState.tableSeatsBookingSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $TableSeatsBookingSuccessCopyWith<$Res> implements $TableSeatsBookingStateCopyWith<$Res> {
  factory $TableSeatsBookingSuccessCopyWith(TableSeatsBookingSuccess value, $Res Function(TableSeatsBookingSuccess) _then) = _$TableSeatsBookingSuccessCopyWithImpl;
@useResult
$Res call({
 BookingResponseModel response
});




}
/// @nodoc
class _$TableSeatsBookingSuccessCopyWithImpl<$Res>
    implements $TableSeatsBookingSuccessCopyWith<$Res> {
  _$TableSeatsBookingSuccessCopyWithImpl(this._self, this._then);

  final TableSeatsBookingSuccess _self;
  final $Res Function(TableSeatsBookingSuccess) _then;

/// Create a copy of TableSeatsBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(TableSeatsBookingSuccess(
freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as BookingResponseModel,
  ));
}


}

// dart format on
