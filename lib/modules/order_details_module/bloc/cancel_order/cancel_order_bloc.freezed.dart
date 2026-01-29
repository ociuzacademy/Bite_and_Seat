// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CancelOrderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderEvent()';
}


}

/// @nodoc
class $CancelOrderEventCopyWith<$Res>  {
$CancelOrderEventCopyWith(CancelOrderEvent _, $Res Function(CancelOrderEvent) __);
}


/// Adds pattern-matching-related methods to [CancelOrderEvent].
extension CancelOrderEventPatterns on CancelOrderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CancelOrder value)?  cancelOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CancelOrder value)  cancelOrder,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CancelOrder():
return cancelOrder(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CancelOrder value)?  cancelOrder,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int orderId)?  cancelOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int orderId)  cancelOrder,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CancelOrder():
return cancelOrder(_that.orderId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int orderId)?  cancelOrder,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CancelOrderEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderEvent.started()';
}


}




/// @nodoc


class _CancelOrder implements CancelOrderEvent {
  const _CancelOrder({required this.orderId});
  

 final  int orderId;

/// Create a copy of CancelOrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelOrderCopyWith<_CancelOrder> get copyWith => __$CancelOrderCopyWithImpl<_CancelOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrder&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'CancelOrderEvent.cancelOrder(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$CancelOrderCopyWith<$Res> implements $CancelOrderEventCopyWith<$Res> {
  factory _$CancelOrderCopyWith(_CancelOrder value, $Res Function(_CancelOrder) _then) = __$CancelOrderCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$CancelOrderCopyWithImpl<$Res>
    implements _$CancelOrderCopyWith<$Res> {
  __$CancelOrderCopyWithImpl(this._self, this._then);

  final _CancelOrder _self;
  final $Res Function(_CancelOrder) _then;

/// Create a copy of CancelOrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_CancelOrder(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CancelOrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderState()';
}


}

/// @nodoc
class $CancelOrderStateCopyWith<$Res>  {
$CancelOrderStateCopyWith(CancelOrderState _, $Res Function(CancelOrderState) __);
}


/// Adds pattern-matching-related methods to [CancelOrderState].
extension CancelOrderStatePatterns on CancelOrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CancelOrderInitial value)?  initial,TResult Function( CancelOrderLoading value)?  loading,TResult Function( CancelOrderSuccess value)?  success,TResult Function( CancelOrderError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial(_that);case CancelOrderLoading() when loading != null:
return loading(_that);case CancelOrderSuccess() when success != null:
return success(_that);case CancelOrderError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CancelOrderInitial value)  initial,required TResult Function( CancelOrderLoading value)  loading,required TResult Function( CancelOrderSuccess value)  success,required TResult Function( CancelOrderError value)  error,}){
final _that = this;
switch (_that) {
case CancelOrderInitial():
return initial(_that);case CancelOrderLoading():
return loading(_that);case CancelOrderSuccess():
return success(_that);case CancelOrderError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CancelOrderInitial value)?  initial,TResult? Function( CancelOrderLoading value)?  loading,TResult? Function( CancelOrderSuccess value)?  success,TResult? Function( CancelOrderError value)?  error,}){
final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial(_that);case CancelOrderLoading() when loading != null:
return loading(_that);case CancelOrderSuccess() when success != null:
return success(_that);case CancelOrderError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CancelOrderResponseModel response)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial();case CancelOrderLoading() when loading != null:
return loading();case CancelOrderSuccess() when success != null:
return success(_that.response);case CancelOrderError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CancelOrderResponseModel response)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CancelOrderInitial():
return initial();case CancelOrderLoading():
return loading();case CancelOrderSuccess():
return success(_that.response);case CancelOrderError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CancelOrderResponseModel response)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CancelOrderInitial() when initial != null:
return initial();case CancelOrderLoading() when loading != null:
return loading();case CancelOrderSuccess() when success != null:
return success(_that.response);case CancelOrderError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CancelOrderInitial implements CancelOrderState {
  const CancelOrderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderState.initial()';
}


}




/// @nodoc


class CancelOrderLoading implements CancelOrderState {
  const CancelOrderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CancelOrderState.loading()';
}


}




/// @nodoc


class CancelOrderSuccess implements CancelOrderState {
  const CancelOrderSuccess(this.response);
  

 final  CancelOrderResponseModel response;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelOrderSuccessCopyWith<CancelOrderSuccess> get copyWith => _$CancelOrderSuccessCopyWithImpl<CancelOrderSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'CancelOrderState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $CancelOrderSuccessCopyWith<$Res> implements $CancelOrderStateCopyWith<$Res> {
  factory $CancelOrderSuccessCopyWith(CancelOrderSuccess value, $Res Function(CancelOrderSuccess) _then) = _$CancelOrderSuccessCopyWithImpl;
@useResult
$Res call({
 CancelOrderResponseModel response
});




}
/// @nodoc
class _$CancelOrderSuccessCopyWithImpl<$Res>
    implements $CancelOrderSuccessCopyWith<$Res> {
  _$CancelOrderSuccessCopyWithImpl(this._self, this._then);

  final CancelOrderSuccess _self;
  final $Res Function(CancelOrderSuccess) _then;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CancelOrderSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CancelOrderResponseModel,
  ));
}


}

/// @nodoc


class CancelOrderError implements CancelOrderState {
  const CancelOrderError(this.message);
  

 final  String message;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelOrderErrorCopyWith<CancelOrderError> get copyWith => _$CancelOrderErrorCopyWithImpl<CancelOrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CancelOrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CancelOrderErrorCopyWith<$Res> implements $CancelOrderStateCopyWith<$Res> {
  factory $CancelOrderErrorCopyWith(CancelOrderError value, $Res Function(CancelOrderError) _then) = _$CancelOrderErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CancelOrderErrorCopyWithImpl<$Res>
    implements $CancelOrderErrorCopyWith<$Res> {
  _$CancelOrderErrorCopyWithImpl(this._self, this._then);

  final CancelOrderError _self;
  final $Res Function(CancelOrderError) _then;

/// Create a copy of CancelOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CancelOrderError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
