// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_feedback_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitFeedbackEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFeedbackEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitFeedbackEvent()';
}


}

/// @nodoc
class $SubmitFeedbackEventCopyWith<$Res>  {
$SubmitFeedbackEventCopyWith(SubmitFeedbackEvent _, $Res Function(SubmitFeedbackEvent) __);
}


/// Adds pattern-matching-related methods to [SubmitFeedbackEvent].
extension SubmitFeedbackEventPatterns on SubmitFeedbackEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SubmittingFeedback value)?  submittingFeedback,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SubmittingFeedback value)  submittingFeedback,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SubmittingFeedback():
return submittingFeedback(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SubmittingFeedback value)?  submittingFeedback,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( FeedbackData feedbackData)?  submittingFeedback,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that.feedbackData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( FeedbackData feedbackData)  submittingFeedback,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SubmittingFeedback():
return submittingFeedback(_that.feedbackData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( FeedbackData feedbackData)?  submittingFeedback,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingFeedback() when submittingFeedback != null:
return submittingFeedback(_that.feedbackData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SubmitFeedbackEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitFeedbackEvent.started()';
}


}




/// @nodoc


class _SubmittingFeedback implements SubmitFeedbackEvent {
  const _SubmittingFeedback(this.feedbackData);
  

 final  FeedbackData feedbackData;

/// Create a copy of SubmitFeedbackEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingFeedbackCopyWith<_SubmittingFeedback> get copyWith => __$SubmittingFeedbackCopyWithImpl<_SubmittingFeedback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittingFeedback&&const DeepCollectionEquality().equals(other.feedbackData, feedbackData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(feedbackData));

@override
String toString() {
  return 'SubmitFeedbackEvent.submittingFeedback(feedbackData: $feedbackData)';
}


}

/// @nodoc
abstract mixin class _$SubmittingFeedbackCopyWith<$Res> implements $SubmitFeedbackEventCopyWith<$Res> {
  factory _$SubmittingFeedbackCopyWith(_SubmittingFeedback value, $Res Function(_SubmittingFeedback) _then) = __$SubmittingFeedbackCopyWithImpl;
@useResult
$Res call({
 FeedbackData feedbackData
});




}
/// @nodoc
class __$SubmittingFeedbackCopyWithImpl<$Res>
    implements _$SubmittingFeedbackCopyWith<$Res> {
  __$SubmittingFeedbackCopyWithImpl(this._self, this._then);

  final _SubmittingFeedback _self;
  final $Res Function(_SubmittingFeedback) _then;

/// Create a copy of SubmitFeedbackEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? feedbackData = freezed,}) {
  return _then(_SubmittingFeedback(
freezed == feedbackData ? _self.feedbackData : feedbackData // ignore: cast_nullable_to_non_nullable
as FeedbackData,
  ));
}


}

/// @nodoc
mixin _$SubmitFeedbackState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFeedbackState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitFeedbackState()';
}


}

/// @nodoc
class $SubmitFeedbackStateCopyWith<$Res>  {
$SubmitFeedbackStateCopyWith(SubmitFeedbackState _, $Res Function(SubmitFeedbackState) __);
}


/// Adds pattern-matching-related methods to [SubmitFeedbackState].
extension SubmitFeedbackStatePatterns on SubmitFeedbackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubmitFeedbackInitial value)?  initial,TResult Function( SubmitFeedbackLoading value)?  submitFeedbackLoading,TResult Function( SubmitFeedbackError value)?  submitFeedbackError,TResult Function( SubmitFeedbackSuccess value)?  submitFeedbackSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubmitFeedbackInitial() when initial != null:
return initial(_that);case SubmitFeedbackLoading() when submitFeedbackLoading != null:
return submitFeedbackLoading(_that);case SubmitFeedbackError() when submitFeedbackError != null:
return submitFeedbackError(_that);case SubmitFeedbackSuccess() when submitFeedbackSuccess != null:
return submitFeedbackSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubmitFeedbackInitial value)  initial,required TResult Function( SubmitFeedbackLoading value)  submitFeedbackLoading,required TResult Function( SubmitFeedbackError value)  submitFeedbackError,required TResult Function( SubmitFeedbackSuccess value)  submitFeedbackSuccess,}){
final _that = this;
switch (_that) {
case SubmitFeedbackInitial():
return initial(_that);case SubmitFeedbackLoading():
return submitFeedbackLoading(_that);case SubmitFeedbackError():
return submitFeedbackError(_that);case SubmitFeedbackSuccess():
return submitFeedbackSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubmitFeedbackInitial value)?  initial,TResult? Function( SubmitFeedbackLoading value)?  submitFeedbackLoading,TResult? Function( SubmitFeedbackError value)?  submitFeedbackError,TResult? Function( SubmitFeedbackSuccess value)?  submitFeedbackSuccess,}){
final _that = this;
switch (_that) {
case SubmitFeedbackInitial() when initial != null:
return initial(_that);case SubmitFeedbackLoading() when submitFeedbackLoading != null:
return submitFeedbackLoading(_that);case SubmitFeedbackError() when submitFeedbackError != null:
return submitFeedbackError(_that);case SubmitFeedbackSuccess() when submitFeedbackSuccess != null:
return submitFeedbackSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitFeedbackLoading,TResult Function( String errorMessage)?  submitFeedbackError,TResult Function( SubmitFeedbackResponseModel response)?  submitFeedbackSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubmitFeedbackInitial() when initial != null:
return initial();case SubmitFeedbackLoading() when submitFeedbackLoading != null:
return submitFeedbackLoading();case SubmitFeedbackError() when submitFeedbackError != null:
return submitFeedbackError(_that.errorMessage);case SubmitFeedbackSuccess() when submitFeedbackSuccess != null:
return submitFeedbackSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitFeedbackLoading,required TResult Function( String errorMessage)  submitFeedbackError,required TResult Function( SubmitFeedbackResponseModel response)  submitFeedbackSuccess,}) {final _that = this;
switch (_that) {
case SubmitFeedbackInitial():
return initial();case SubmitFeedbackLoading():
return submitFeedbackLoading();case SubmitFeedbackError():
return submitFeedbackError(_that.errorMessage);case SubmitFeedbackSuccess():
return submitFeedbackSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitFeedbackLoading,TResult? Function( String errorMessage)?  submitFeedbackError,TResult? Function( SubmitFeedbackResponseModel response)?  submitFeedbackSuccess,}) {final _that = this;
switch (_that) {
case SubmitFeedbackInitial() when initial != null:
return initial();case SubmitFeedbackLoading() when submitFeedbackLoading != null:
return submitFeedbackLoading();case SubmitFeedbackError() when submitFeedbackError != null:
return submitFeedbackError(_that.errorMessage);case SubmitFeedbackSuccess() when submitFeedbackSuccess != null:
return submitFeedbackSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class SubmitFeedbackInitial implements SubmitFeedbackState {
  const SubmitFeedbackInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFeedbackInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitFeedbackState.initial()';
}


}




/// @nodoc


class SubmitFeedbackLoading implements SubmitFeedbackState {
  const SubmitFeedbackLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFeedbackLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitFeedbackState.submitFeedbackLoading()';
}


}




/// @nodoc


class SubmitFeedbackError implements SubmitFeedbackState {
  const SubmitFeedbackError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of SubmitFeedbackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitFeedbackErrorCopyWith<SubmitFeedbackError> get copyWith => _$SubmitFeedbackErrorCopyWithImpl<SubmitFeedbackError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFeedbackError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'SubmitFeedbackState.submitFeedbackError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SubmitFeedbackErrorCopyWith<$Res> implements $SubmitFeedbackStateCopyWith<$Res> {
  factory $SubmitFeedbackErrorCopyWith(SubmitFeedbackError value, $Res Function(SubmitFeedbackError) _then) = _$SubmitFeedbackErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SubmitFeedbackErrorCopyWithImpl<$Res>
    implements $SubmitFeedbackErrorCopyWith<$Res> {
  _$SubmitFeedbackErrorCopyWithImpl(this._self, this._then);

  final SubmitFeedbackError _self;
  final $Res Function(SubmitFeedbackError) _then;

/// Create a copy of SubmitFeedbackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SubmitFeedbackError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubmitFeedbackSuccess implements SubmitFeedbackState {
  const SubmitFeedbackSuccess(this.response);
  

 final  SubmitFeedbackResponseModel response;

/// Create a copy of SubmitFeedbackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitFeedbackSuccessCopyWith<SubmitFeedbackSuccess> get copyWith => _$SubmitFeedbackSuccessCopyWithImpl<SubmitFeedbackSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFeedbackSuccess&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'SubmitFeedbackState.submitFeedbackSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $SubmitFeedbackSuccessCopyWith<$Res> implements $SubmitFeedbackStateCopyWith<$Res> {
  factory $SubmitFeedbackSuccessCopyWith(SubmitFeedbackSuccess value, $Res Function(SubmitFeedbackSuccess) _then) = _$SubmitFeedbackSuccessCopyWithImpl;
@useResult
$Res call({
 SubmitFeedbackResponseModel response
});




}
/// @nodoc
class _$SubmitFeedbackSuccessCopyWithImpl<$Res>
    implements $SubmitFeedbackSuccessCopyWith<$Res> {
  _$SubmitFeedbackSuccessCopyWithImpl(this._self, this._then);

  final SubmitFeedbackSuccess _self;
  final $Res Function(SubmitFeedbackSuccess) _then;

/// Create a copy of SubmitFeedbackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(SubmitFeedbackSuccess(
freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as SubmitFeedbackResponseModel,
  ));
}


}

// dart format on
