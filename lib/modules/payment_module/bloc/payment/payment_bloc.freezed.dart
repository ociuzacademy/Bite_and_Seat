// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent()';
}


}

/// @nodoc
class $PaymentEventCopyWith<$Res>  {
$PaymentEventCopyWith(PaymentEvent _, $Res Function(PaymentEvent) __);
}


/// Adds pattern-matching-related methods to [PaymentEvent].
extension PaymentEventPatterns on PaymentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpiPaymentStarted value)?  upiPaymentStarted,TResult Function( _CardPaymentStarted value)?  cardPaymentStarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpiPaymentStarted() when upiPaymentStarted != null:
return upiPaymentStarted(_that);case _CardPaymentStarted() when cardPaymentStarted != null:
return cardPaymentStarted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpiPaymentStarted value)  upiPaymentStarted,required TResult Function( _CardPaymentStarted value)  cardPaymentStarted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpiPaymentStarted():
return upiPaymentStarted(_that);case _CardPaymentStarted():
return cardPaymentStarted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpiPaymentStarted value)?  upiPaymentStarted,TResult? Function( _CardPaymentStarted value)?  cardPaymentStarted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpiPaymentStarted() when upiPaymentStarted != null:
return upiPaymentStarted(_that);case _CardPaymentStarted() when cardPaymentStarted != null:
return cardPaymentStarted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UPIData upiData)?  upiPaymentStarted,TResult Function( CardData cardData)?  cardPaymentStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpiPaymentStarted() when upiPaymentStarted != null:
return upiPaymentStarted(_that.upiData);case _CardPaymentStarted() when cardPaymentStarted != null:
return cardPaymentStarted(_that.cardData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UPIData upiData)  upiPaymentStarted,required TResult Function( CardData cardData)  cardPaymentStarted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpiPaymentStarted():
return upiPaymentStarted(_that.upiData);case _CardPaymentStarted():
return cardPaymentStarted(_that.cardData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UPIData upiData)?  upiPaymentStarted,TResult? Function( CardData cardData)?  cardPaymentStarted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpiPaymentStarted() when upiPaymentStarted != null:
return upiPaymentStarted(_that.upiData);case _CardPaymentStarted() when cardPaymentStarted != null:
return cardPaymentStarted(_that.cardData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PaymentEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.started()';
}


}




/// @nodoc


class _UpiPaymentStarted implements PaymentEvent {
  const _UpiPaymentStarted(this.upiData);
  

 final  UPIData upiData;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpiPaymentStartedCopyWith<_UpiPaymentStarted> get copyWith => __$UpiPaymentStartedCopyWithImpl<_UpiPaymentStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpiPaymentStarted&&(identical(other.upiData, upiData) || other.upiData == upiData));
}


@override
int get hashCode => Object.hash(runtimeType,upiData);

@override
String toString() {
  return 'PaymentEvent.upiPaymentStarted(upiData: $upiData)';
}


}

/// @nodoc
abstract mixin class _$UpiPaymentStartedCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory _$UpiPaymentStartedCopyWith(_UpiPaymentStarted value, $Res Function(_UpiPaymentStarted) _then) = __$UpiPaymentStartedCopyWithImpl;
@useResult
$Res call({
 UPIData upiData
});




}
/// @nodoc
class __$UpiPaymentStartedCopyWithImpl<$Res>
    implements _$UpiPaymentStartedCopyWith<$Res> {
  __$UpiPaymentStartedCopyWithImpl(this._self, this._then);

  final _UpiPaymentStarted _self;
  final $Res Function(_UpiPaymentStarted) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? upiData = null,}) {
  return _then(_UpiPaymentStarted(
null == upiData ? _self.upiData : upiData // ignore: cast_nullable_to_non_nullable
as UPIData,
  ));
}


}

/// @nodoc


class _CardPaymentStarted implements PaymentEvent {
  const _CardPaymentStarted(this.cardData);
  

 final  CardData cardData;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardPaymentStartedCopyWith<_CardPaymentStarted> get copyWith => __$CardPaymentStartedCopyWithImpl<_CardPaymentStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardPaymentStarted&&(identical(other.cardData, cardData) || other.cardData == cardData));
}


@override
int get hashCode => Object.hash(runtimeType,cardData);

@override
String toString() {
  return 'PaymentEvent.cardPaymentStarted(cardData: $cardData)';
}


}

/// @nodoc
abstract mixin class _$CardPaymentStartedCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory _$CardPaymentStartedCopyWith(_CardPaymentStarted value, $Res Function(_CardPaymentStarted) _then) = __$CardPaymentStartedCopyWithImpl;
@useResult
$Res call({
 CardData cardData
});




}
/// @nodoc
class __$CardPaymentStartedCopyWithImpl<$Res>
    implements _$CardPaymentStartedCopyWith<$Res> {
  __$CardPaymentStartedCopyWithImpl(this._self, this._then);

  final _CardPaymentStarted _self;
  final $Res Function(_CardPaymentStarted) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cardData = null,}) {
  return _then(_CardPaymentStarted(
null == cardData ? _self.cardData : cardData // ignore: cast_nullable_to_non_nullable
as CardData,
  ));
}


}

/// @nodoc
mixin _$PaymentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState()';
}


}

/// @nodoc
class $PaymentStateCopyWith<$Res>  {
$PaymentStateCopyWith(PaymentState _, $Res Function(PaymentState) __);
}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaymentInitial value)?  initial,TResult Function( PaymentLoading value)?  paymentLoading,TResult Function( PaymentError value)?  paymentError,TResult Function( PaymentSuccess value)?  paymentSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial(_that);case PaymentLoading() when paymentLoading != null:
return paymentLoading(_that);case PaymentError() when paymentError != null:
return paymentError(_that);case PaymentSuccess() when paymentSuccess != null:
return paymentSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaymentInitial value)  initial,required TResult Function( PaymentLoading value)  paymentLoading,required TResult Function( PaymentError value)  paymentError,required TResult Function( PaymentSuccess value)  paymentSuccess,}){
final _that = this;
switch (_that) {
case PaymentInitial():
return initial(_that);case PaymentLoading():
return paymentLoading(_that);case PaymentError():
return paymentError(_that);case PaymentSuccess():
return paymentSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaymentInitial value)?  initial,TResult? Function( PaymentLoading value)?  paymentLoading,TResult? Function( PaymentError value)?  paymentError,TResult? Function( PaymentSuccess value)?  paymentSuccess,}){
final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial(_that);case PaymentLoading() when paymentLoading != null:
return paymentLoading(_that);case PaymentError() when paymentError != null:
return paymentError(_that);case PaymentSuccess() when paymentSuccess != null:
return paymentSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  paymentLoading,TResult Function( String errorMessage)?  paymentError,TResult Function( PaymentResponseModel response)?  paymentSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial();case PaymentLoading() when paymentLoading != null:
return paymentLoading();case PaymentError() when paymentError != null:
return paymentError(_that.errorMessage);case PaymentSuccess() when paymentSuccess != null:
return paymentSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  paymentLoading,required TResult Function( String errorMessage)  paymentError,required TResult Function( PaymentResponseModel response)  paymentSuccess,}) {final _that = this;
switch (_that) {
case PaymentInitial():
return initial();case PaymentLoading():
return paymentLoading();case PaymentError():
return paymentError(_that.errorMessage);case PaymentSuccess():
return paymentSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  paymentLoading,TResult? Function( String errorMessage)?  paymentError,TResult? Function( PaymentResponseModel response)?  paymentSuccess,}) {final _that = this;
switch (_that) {
case PaymentInitial() when initial != null:
return initial();case PaymentLoading() when paymentLoading != null:
return paymentLoading();case PaymentError() when paymentError != null:
return paymentError(_that.errorMessage);case PaymentSuccess() when paymentSuccess != null:
return paymentSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class PaymentInitial implements PaymentState {
  const PaymentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.initial()';
}


}




/// @nodoc


class PaymentLoading implements PaymentState {
  const PaymentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.paymentLoading()';
}


}




/// @nodoc


class PaymentError implements PaymentState {
  const PaymentError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentErrorCopyWith<PaymentError> get copyWith => _$PaymentErrorCopyWithImpl<PaymentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'PaymentState.paymentError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentErrorCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $PaymentErrorCopyWith(PaymentError value, $Res Function(PaymentError) _then) = _$PaymentErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PaymentErrorCopyWithImpl<$Res>
    implements $PaymentErrorCopyWith<$Res> {
  _$PaymentErrorCopyWithImpl(this._self, this._then);

  final PaymentError _self;
  final $Res Function(PaymentError) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PaymentError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PaymentSuccess implements PaymentState {
  const PaymentSuccess(this.response);
  

 final  PaymentResponseModel response;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentSuccessCopyWith<PaymentSuccess> get copyWith => _$PaymentSuccessCopyWithImpl<PaymentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentSuccess&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'PaymentState.paymentSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $PaymentSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $PaymentSuccessCopyWith(PaymentSuccess value, $Res Function(PaymentSuccess) _then) = _$PaymentSuccessCopyWithImpl;
@useResult
$Res call({
 PaymentResponseModel response
});




}
/// @nodoc
class _$PaymentSuccessCopyWithImpl<$Res>
    implements $PaymentSuccessCopyWith<$Res> {
  _$PaymentSuccessCopyWithImpl(this._self, this._then);

  final PaymentSuccess _self;
  final $Res Function(PaymentSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(PaymentSuccess(
freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as PaymentResponseModel,
  ));
}


}

// dart format on
