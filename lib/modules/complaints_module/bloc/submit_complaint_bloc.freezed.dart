// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_complaint_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitComplaintEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitComplaintEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitComplaintEvent()';
}


}

/// @nodoc
class $SubmitComplaintEventCopyWith<$Res>  {
$SubmitComplaintEventCopyWith(SubmitComplaintEvent _, $Res Function(SubmitComplaintEvent) __);
}


/// Adds pattern-matching-related methods to [SubmitComplaintEvent].
extension SubmitComplaintEventPatterns on SubmitComplaintEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SubmittingComplaint value)?  submittingComplaint,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SubmittingComplaint value)  submittingComplaint,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SubmittingComplaint():
return submittingComplaint(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SubmittingComplaint value)?  submittingComplaint,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ComplaintsData complaintsData)?  submittingComplaint,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that.complaintsData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ComplaintsData complaintsData)  submittingComplaint,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SubmittingComplaint():
return submittingComplaint(_that.complaintsData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ComplaintsData complaintsData)?  submittingComplaint,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SubmittingComplaint() when submittingComplaint != null:
return submittingComplaint(_that.complaintsData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SubmitComplaintEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitComplaintEvent.started()';
}


}




/// @nodoc


class _SubmittingComplaint implements SubmitComplaintEvent {
  const _SubmittingComplaint(this.complaintsData);
  

 final  ComplaintsData complaintsData;

/// Create a copy of SubmitComplaintEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittingComplaintCopyWith<_SubmittingComplaint> get copyWith => __$SubmittingComplaintCopyWithImpl<_SubmittingComplaint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittingComplaint&&(identical(other.complaintsData, complaintsData) || other.complaintsData == complaintsData));
}


@override
int get hashCode => Object.hash(runtimeType,complaintsData);

@override
String toString() {
  return 'SubmitComplaintEvent.submittingComplaint(complaintsData: $complaintsData)';
}


}

/// @nodoc
abstract mixin class _$SubmittingComplaintCopyWith<$Res> implements $SubmitComplaintEventCopyWith<$Res> {
  factory _$SubmittingComplaintCopyWith(_SubmittingComplaint value, $Res Function(_SubmittingComplaint) _then) = __$SubmittingComplaintCopyWithImpl;
@useResult
$Res call({
 ComplaintsData complaintsData
});




}
/// @nodoc
class __$SubmittingComplaintCopyWithImpl<$Res>
    implements _$SubmittingComplaintCopyWith<$Res> {
  __$SubmittingComplaintCopyWithImpl(this._self, this._then);

  final _SubmittingComplaint _self;
  final $Res Function(_SubmittingComplaint) _then;

/// Create a copy of SubmitComplaintEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? complaintsData = null,}) {
  return _then(_SubmittingComplaint(
null == complaintsData ? _self.complaintsData : complaintsData // ignore: cast_nullable_to_non_nullable
as ComplaintsData,
  ));
}


}

/// @nodoc
mixin _$SubmitComplaintState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitComplaintState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitComplaintState()';
}


}

/// @nodoc
class $SubmitComplaintStateCopyWith<$Res>  {
$SubmitComplaintStateCopyWith(SubmitComplaintState _, $Res Function(SubmitComplaintState) __);
}


/// Adds pattern-matching-related methods to [SubmitComplaintState].
extension SubmitComplaintStatePatterns on SubmitComplaintState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubmitComplaintInitial value)?  initial,TResult Function( SubmitComplaintLoading value)?  submitComplaintLoading,TResult Function( SubmitComplaintError value)?  submitComplaintError,TResult Function( SubmitComplaintSuccess value)?  submitComplaintSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubmitComplaintInitial() when initial != null:
return initial(_that);case SubmitComplaintLoading() when submitComplaintLoading != null:
return submitComplaintLoading(_that);case SubmitComplaintError() when submitComplaintError != null:
return submitComplaintError(_that);case SubmitComplaintSuccess() when submitComplaintSuccess != null:
return submitComplaintSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubmitComplaintInitial value)  initial,required TResult Function( SubmitComplaintLoading value)  submitComplaintLoading,required TResult Function( SubmitComplaintError value)  submitComplaintError,required TResult Function( SubmitComplaintSuccess value)  submitComplaintSuccess,}){
final _that = this;
switch (_that) {
case SubmitComplaintInitial():
return initial(_that);case SubmitComplaintLoading():
return submitComplaintLoading(_that);case SubmitComplaintError():
return submitComplaintError(_that);case SubmitComplaintSuccess():
return submitComplaintSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubmitComplaintInitial value)?  initial,TResult? Function( SubmitComplaintLoading value)?  submitComplaintLoading,TResult? Function( SubmitComplaintError value)?  submitComplaintError,TResult? Function( SubmitComplaintSuccess value)?  submitComplaintSuccess,}){
final _that = this;
switch (_that) {
case SubmitComplaintInitial() when initial != null:
return initial(_that);case SubmitComplaintLoading() when submitComplaintLoading != null:
return submitComplaintLoading(_that);case SubmitComplaintError() when submitComplaintError != null:
return submitComplaintError(_that);case SubmitComplaintSuccess() when submitComplaintSuccess != null:
return submitComplaintSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitComplaintLoading,TResult Function( String errorMessage)?  submitComplaintError,TResult Function( SubmitReportResponseModel response)?  submitComplaintSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubmitComplaintInitial() when initial != null:
return initial();case SubmitComplaintLoading() when submitComplaintLoading != null:
return submitComplaintLoading();case SubmitComplaintError() when submitComplaintError != null:
return submitComplaintError(_that.errorMessage);case SubmitComplaintSuccess() when submitComplaintSuccess != null:
return submitComplaintSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitComplaintLoading,required TResult Function( String errorMessage)  submitComplaintError,required TResult Function( SubmitReportResponseModel response)  submitComplaintSuccess,}) {final _that = this;
switch (_that) {
case SubmitComplaintInitial():
return initial();case SubmitComplaintLoading():
return submitComplaintLoading();case SubmitComplaintError():
return submitComplaintError(_that.errorMessage);case SubmitComplaintSuccess():
return submitComplaintSuccess(_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitComplaintLoading,TResult? Function( String errorMessage)?  submitComplaintError,TResult? Function( SubmitReportResponseModel response)?  submitComplaintSuccess,}) {final _that = this;
switch (_that) {
case SubmitComplaintInitial() when initial != null:
return initial();case SubmitComplaintLoading() when submitComplaintLoading != null:
return submitComplaintLoading();case SubmitComplaintError() when submitComplaintError != null:
return submitComplaintError(_that.errorMessage);case SubmitComplaintSuccess() when submitComplaintSuccess != null:
return submitComplaintSuccess(_that.response);case _:
  return null;

}
}

}

/// @nodoc


class SubmitComplaintInitial implements SubmitComplaintState {
  const SubmitComplaintInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitComplaintInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitComplaintState.initial()';
}


}




/// @nodoc


class SubmitComplaintLoading implements SubmitComplaintState {
  const SubmitComplaintLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitComplaintLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmitComplaintState.submitComplaintLoading()';
}


}




/// @nodoc


class SubmitComplaintError implements SubmitComplaintState {
  const SubmitComplaintError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of SubmitComplaintState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitComplaintErrorCopyWith<SubmitComplaintError> get copyWith => _$SubmitComplaintErrorCopyWithImpl<SubmitComplaintError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitComplaintError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'SubmitComplaintState.submitComplaintError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SubmitComplaintErrorCopyWith<$Res> implements $SubmitComplaintStateCopyWith<$Res> {
  factory $SubmitComplaintErrorCopyWith(SubmitComplaintError value, $Res Function(SubmitComplaintError) _then) = _$SubmitComplaintErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SubmitComplaintErrorCopyWithImpl<$Res>
    implements $SubmitComplaintErrorCopyWith<$Res> {
  _$SubmitComplaintErrorCopyWithImpl(this._self, this._then);

  final SubmitComplaintError _self;
  final $Res Function(SubmitComplaintError) _then;

/// Create a copy of SubmitComplaintState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SubmitComplaintError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubmitComplaintSuccess implements SubmitComplaintState {
  const SubmitComplaintSuccess(this.response);
  

 final  SubmitReportResponseModel response;

/// Create a copy of SubmitComplaintState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitComplaintSuccessCopyWith<SubmitComplaintSuccess> get copyWith => _$SubmitComplaintSuccessCopyWithImpl<SubmitComplaintSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitComplaintSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'SubmitComplaintState.submitComplaintSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $SubmitComplaintSuccessCopyWith<$Res> implements $SubmitComplaintStateCopyWith<$Res> {
  factory $SubmitComplaintSuccessCopyWith(SubmitComplaintSuccess value, $Res Function(SubmitComplaintSuccess) _then) = _$SubmitComplaintSuccessCopyWithImpl;
@useResult
$Res call({
 SubmitReportResponseModel response
});




}
/// @nodoc
class _$SubmitComplaintSuccessCopyWithImpl<$Res>
    implements $SubmitComplaintSuccessCopyWith<$Res> {
  _$SubmitComplaintSuccessCopyWithImpl(this._self, this._then);

  final SubmitComplaintSuccess _self;
  final $Res Function(SubmitComplaintSuccess) _then;

/// Create a copy of SubmitComplaintState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(SubmitComplaintSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as SubmitReportResponseModel,
  ));
}


}

// dart format on
