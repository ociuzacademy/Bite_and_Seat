// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderInitial value)?  initial,TResult Function( OrderLoading value)?  orderLoading,TResult Function( OrderError value)?  orderError,TResult Function( OrderDetailsSuccess value)?  orderDetailsSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial(_that);case OrderLoading() when orderLoading != null:
return orderLoading(_that);case OrderError() when orderError != null:
return orderError(_that);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderInitial value)  initial,required TResult Function( OrderLoading value)  orderLoading,required TResult Function( OrderError value)  orderError,required TResult Function( OrderDetailsSuccess value)  orderDetailsSuccess,}){
final _that = this;
switch (_that) {
case OrderInitial():
return initial(_that);case OrderLoading():
return orderLoading(_that);case OrderError():
return orderError(_that);case OrderDetailsSuccess():
return orderDetailsSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderInitial value)?  initial,TResult? Function( OrderLoading value)?  orderLoading,TResult? Function( OrderError value)?  orderError,TResult? Function( OrderDetailsSuccess value)?  orderDetailsSuccess,}){
final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial(_that);case OrderLoading() when orderLoading != null:
return orderLoading(_that);case OrderError() when orderError != null:
return orderError(_that);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  orderLoading,TResult Function( String errorMessage)?  orderError,TResult Function( OrderDetailsModel orderDetails)?  orderDetailsSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial();case OrderLoading() when orderLoading != null:
return orderLoading();case OrderError() when orderError != null:
return orderError(_that.errorMessage);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that.orderDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  orderLoading,required TResult Function( String errorMessage)  orderError,required TResult Function( OrderDetailsModel orderDetails)  orderDetailsSuccess,}) {final _that = this;
switch (_that) {
case OrderInitial():
return initial();case OrderLoading():
return orderLoading();case OrderError():
return orderError(_that.errorMessage);case OrderDetailsSuccess():
return orderDetailsSuccess(_that.orderDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  orderLoading,TResult? Function( String errorMessage)?  orderError,TResult? Function( OrderDetailsModel orderDetails)?  orderDetailsSuccess,}) {final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial();case OrderLoading() when orderLoading != null:
return orderLoading();case OrderError() when orderError != null:
return orderError(_that.errorMessage);case OrderDetailsSuccess() when orderDetailsSuccess != null:
return orderDetailsSuccess(_that.orderDetails);case _:
  return null;

}
}

}

/// @nodoc


class OrderInitial implements OrderState {
  const OrderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.initial()';
}


}




/// @nodoc


class OrderLoading implements OrderState {
  const OrderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.orderLoading()';
}


}




/// @nodoc


class OrderError implements OrderState {
  const OrderError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderErrorCopyWith<OrderError> get copyWith => _$OrderErrorCopyWithImpl<OrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'OrderState.orderError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OrderErrorCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $OrderErrorCopyWith(OrderError value, $Res Function(OrderError) _then) = _$OrderErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$OrderErrorCopyWithImpl<$Res>
    implements $OrderErrorCopyWith<$Res> {
  _$OrderErrorCopyWithImpl(this._self, this._then);

  final OrderError _self;
  final $Res Function(OrderError) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(OrderError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrderDetailsSuccess implements OrderState {
  const OrderDetailsSuccess(this.orderDetails);
  

 final  OrderDetailsModel orderDetails;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsSuccessCopyWith<OrderDetailsSuccess> get copyWith => _$OrderDetailsSuccessCopyWithImpl<OrderDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsSuccess&&(identical(other.orderDetails, orderDetails) || other.orderDetails == orderDetails));
}


@override
int get hashCode => Object.hash(runtimeType,orderDetails);

@override
String toString() {
  return 'OrderState.orderDetailsSuccess(orderDetails: $orderDetails)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsSuccessCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $OrderDetailsSuccessCopyWith(OrderDetailsSuccess value, $Res Function(OrderDetailsSuccess) _then) = _$OrderDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 OrderDetailsModel orderDetails
});




}
/// @nodoc
class _$OrderDetailsSuccessCopyWithImpl<$Res>
    implements $OrderDetailsSuccessCopyWith<$Res> {
  _$OrderDetailsSuccessCopyWithImpl(this._self, this._then);

  final OrderDetailsSuccess _self;
  final $Res Function(OrderDetailsSuccess) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderDetails = null,}) {
  return _then(OrderDetailsSuccess(
null == orderDetails ? _self.orderDetails : orderDetails // ignore: cast_nullable_to_non_nullable
as OrderDetailsModel,
  ));
}


}

// dart format on
