// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todays_special_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodaysSpecialState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSpecialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSpecialState()';
}


}

/// @nodoc
class $TodaysSpecialStateCopyWith<$Res>  {
$TodaysSpecialStateCopyWith(TodaysSpecialState _, $Res Function(TodaysSpecialState) __);
}


/// Adds pattern-matching-related methods to [TodaysSpecialState].
extension TodaysSpecialStatePatterns on TodaysSpecialState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodaysSpecialInitial value)?  initial,TResult Function( TodaysSpecialLoading value)?  loading,TResult Function( TodaysSpecialError value)?  error,TResult Function( TodaysSpecialSuccess value)?  loaded,TResult Function( TodaysSpecialEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodaysSpecialInitial() when initial != null:
return initial(_that);case TodaysSpecialLoading() when loading != null:
return loading(_that);case TodaysSpecialError() when error != null:
return error(_that);case TodaysSpecialSuccess() when loaded != null:
return loaded(_that);case TodaysSpecialEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodaysSpecialInitial value)  initial,required TResult Function( TodaysSpecialLoading value)  loading,required TResult Function( TodaysSpecialError value)  error,required TResult Function( TodaysSpecialSuccess value)  loaded,required TResult Function( TodaysSpecialEmpty value)  empty,}){
final _that = this;
switch (_that) {
case TodaysSpecialInitial():
return initial(_that);case TodaysSpecialLoading():
return loading(_that);case TodaysSpecialError():
return error(_that);case TodaysSpecialSuccess():
return loaded(_that);case TodaysSpecialEmpty():
return empty(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodaysSpecialInitial value)?  initial,TResult? Function( TodaysSpecialLoading value)?  loading,TResult? Function( TodaysSpecialError value)?  error,TResult? Function( TodaysSpecialSuccess value)?  loaded,TResult? Function( TodaysSpecialEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case TodaysSpecialInitial() when initial != null:
return initial(_that);case TodaysSpecialLoading() when loading != null:
return loading(_that);case TodaysSpecialError() when error != null:
return error(_that);case TodaysSpecialSuccess() when loaded != null:
return loaded(_that);case TodaysSpecialEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String errorMessage)?  error,TResult Function( List<TodaysSpecialModel> todaysSpecial)?  loaded,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodaysSpecialInitial() when initial != null:
return initial();case TodaysSpecialLoading() when loading != null:
return loading();case TodaysSpecialError() when error != null:
return error(_that.errorMessage);case TodaysSpecialSuccess() when loaded != null:
return loaded(_that.todaysSpecial);case TodaysSpecialEmpty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String errorMessage)  error,required TResult Function( List<TodaysSpecialModel> todaysSpecial)  loaded,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case TodaysSpecialInitial():
return initial();case TodaysSpecialLoading():
return loading();case TodaysSpecialError():
return error(_that.errorMessage);case TodaysSpecialSuccess():
return loaded(_that.todaysSpecial);case TodaysSpecialEmpty():
return empty();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String errorMessage)?  error,TResult? Function( List<TodaysSpecialModel> todaysSpecial)?  loaded,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case TodaysSpecialInitial() when initial != null:
return initial();case TodaysSpecialLoading() when loading != null:
return loading();case TodaysSpecialError() when error != null:
return error(_that.errorMessage);case TodaysSpecialSuccess() when loaded != null:
return loaded(_that.todaysSpecial);case TodaysSpecialEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class TodaysSpecialInitial implements TodaysSpecialState {
  const TodaysSpecialInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSpecialInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSpecialState.initial()';
}


}




/// @nodoc


class TodaysSpecialLoading implements TodaysSpecialState {
  const TodaysSpecialLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSpecialLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSpecialState.loading()';
}


}




/// @nodoc


class TodaysSpecialError implements TodaysSpecialState {
  const TodaysSpecialError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of TodaysSpecialState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodaysSpecialErrorCopyWith<TodaysSpecialError> get copyWith => _$TodaysSpecialErrorCopyWithImpl<TodaysSpecialError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSpecialError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TodaysSpecialState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TodaysSpecialErrorCopyWith<$Res> implements $TodaysSpecialStateCopyWith<$Res> {
  factory $TodaysSpecialErrorCopyWith(TodaysSpecialError value, $Res Function(TodaysSpecialError) _then) = _$TodaysSpecialErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TodaysSpecialErrorCopyWithImpl<$Res>
    implements $TodaysSpecialErrorCopyWith<$Res> {
  _$TodaysSpecialErrorCopyWithImpl(this._self, this._then);

  final TodaysSpecialError _self;
  final $Res Function(TodaysSpecialError) _then;

/// Create a copy of TodaysSpecialState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TodaysSpecialError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TodaysSpecialSuccess implements TodaysSpecialState {
  const TodaysSpecialSuccess(final  List<TodaysSpecialModel> todaysSpecial): _todaysSpecial = todaysSpecial;
  

 final  List<TodaysSpecialModel> _todaysSpecial;
 List<TodaysSpecialModel> get todaysSpecial {
  if (_todaysSpecial is EqualUnmodifiableListView) return _todaysSpecial;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todaysSpecial);
}


/// Create a copy of TodaysSpecialState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodaysSpecialSuccessCopyWith<TodaysSpecialSuccess> get copyWith => _$TodaysSpecialSuccessCopyWithImpl<TodaysSpecialSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSpecialSuccess&&const DeepCollectionEquality().equals(other._todaysSpecial, _todaysSpecial));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todaysSpecial));

@override
String toString() {
  return 'TodaysSpecialState.loaded(todaysSpecial: $todaysSpecial)';
}


}

/// @nodoc
abstract mixin class $TodaysSpecialSuccessCopyWith<$Res> implements $TodaysSpecialStateCopyWith<$Res> {
  factory $TodaysSpecialSuccessCopyWith(TodaysSpecialSuccess value, $Res Function(TodaysSpecialSuccess) _then) = _$TodaysSpecialSuccessCopyWithImpl;
@useResult
$Res call({
 List<TodaysSpecialModel> todaysSpecial
});




}
/// @nodoc
class _$TodaysSpecialSuccessCopyWithImpl<$Res>
    implements $TodaysSpecialSuccessCopyWith<$Res> {
  _$TodaysSpecialSuccessCopyWithImpl(this._self, this._then);

  final TodaysSpecialSuccess _self;
  final $Res Function(TodaysSpecialSuccess) _then;

/// Create a copy of TodaysSpecialState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todaysSpecial = null,}) {
  return _then(TodaysSpecialSuccess(
null == todaysSpecial ? _self._todaysSpecial : todaysSpecial // ignore: cast_nullable_to_non_nullable
as List<TodaysSpecialModel>,
  ));
}


}

/// @nodoc


class TodaysSpecialEmpty implements TodaysSpecialState {
  const TodaysSpecialEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSpecialEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSpecialState.empty()';
}


}




// dart format on
