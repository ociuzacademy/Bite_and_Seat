// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyMenuState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMenuState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyMenuState()';
}


}

/// @nodoc
class $DailyMenuStateCopyWith<$Res>  {
$DailyMenuStateCopyWith(DailyMenuState _, $Res Function(DailyMenuState) __);
}


/// Adds pattern-matching-related methods to [DailyMenuState].
extension DailyMenuStatePatterns on DailyMenuState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyMenuInitial value)?  initial,TResult Function( DailyMenuLoading value)?  dailyMenuLoading,TResult Function( DailyMenuError value)?  dailyMenuError,TResult Function( DailyMenuUnavailable value)?  dailyMenuUnavailable,TResult Function( DailyMenuSuccess value)?  dailyMenuSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyMenuInitial() when initial != null:
return initial(_that);case DailyMenuLoading() when dailyMenuLoading != null:
return dailyMenuLoading(_that);case DailyMenuError() when dailyMenuError != null:
return dailyMenuError(_that);case DailyMenuUnavailable() when dailyMenuUnavailable != null:
return dailyMenuUnavailable(_that);case DailyMenuSuccess() when dailyMenuSuccess != null:
return dailyMenuSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyMenuInitial value)  initial,required TResult Function( DailyMenuLoading value)  dailyMenuLoading,required TResult Function( DailyMenuError value)  dailyMenuError,required TResult Function( DailyMenuUnavailable value)  dailyMenuUnavailable,required TResult Function( DailyMenuSuccess value)  dailyMenuSuccess,}){
final _that = this;
switch (_that) {
case DailyMenuInitial():
return initial(_that);case DailyMenuLoading():
return dailyMenuLoading(_that);case DailyMenuError():
return dailyMenuError(_that);case DailyMenuUnavailable():
return dailyMenuUnavailable(_that);case DailyMenuSuccess():
return dailyMenuSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyMenuInitial value)?  initial,TResult? Function( DailyMenuLoading value)?  dailyMenuLoading,TResult? Function( DailyMenuError value)?  dailyMenuError,TResult? Function( DailyMenuUnavailable value)?  dailyMenuUnavailable,TResult? Function( DailyMenuSuccess value)?  dailyMenuSuccess,}){
final _that = this;
switch (_that) {
case DailyMenuInitial() when initial != null:
return initial(_that);case DailyMenuLoading() when dailyMenuLoading != null:
return dailyMenuLoading(_that);case DailyMenuError() when dailyMenuError != null:
return dailyMenuError(_that);case DailyMenuUnavailable() when dailyMenuUnavailable != null:
return dailyMenuUnavailable(_that);case DailyMenuSuccess() when dailyMenuSuccess != null:
return dailyMenuSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  dailyMenuLoading,TResult Function( String errorMessage)?  dailyMenuError,TResult Function( DateTime date,  String message)?  dailyMenuUnavailable,TResult Function( DailyMenuModel dailyMenu)?  dailyMenuSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyMenuInitial() when initial != null:
return initial();case DailyMenuLoading() when dailyMenuLoading != null:
return dailyMenuLoading();case DailyMenuError() when dailyMenuError != null:
return dailyMenuError(_that.errorMessage);case DailyMenuUnavailable() when dailyMenuUnavailable != null:
return dailyMenuUnavailable(_that.date,_that.message);case DailyMenuSuccess() when dailyMenuSuccess != null:
return dailyMenuSuccess(_that.dailyMenu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  dailyMenuLoading,required TResult Function( String errorMessage)  dailyMenuError,required TResult Function( DateTime date,  String message)  dailyMenuUnavailable,required TResult Function( DailyMenuModel dailyMenu)  dailyMenuSuccess,}) {final _that = this;
switch (_that) {
case DailyMenuInitial():
return initial();case DailyMenuLoading():
return dailyMenuLoading();case DailyMenuError():
return dailyMenuError(_that.errorMessage);case DailyMenuUnavailable():
return dailyMenuUnavailable(_that.date,_that.message);case DailyMenuSuccess():
return dailyMenuSuccess(_that.dailyMenu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  dailyMenuLoading,TResult? Function( String errorMessage)?  dailyMenuError,TResult? Function( DateTime date,  String message)?  dailyMenuUnavailable,TResult? Function( DailyMenuModel dailyMenu)?  dailyMenuSuccess,}) {final _that = this;
switch (_that) {
case DailyMenuInitial() when initial != null:
return initial();case DailyMenuLoading() when dailyMenuLoading != null:
return dailyMenuLoading();case DailyMenuError() when dailyMenuError != null:
return dailyMenuError(_that.errorMessage);case DailyMenuUnavailable() when dailyMenuUnavailable != null:
return dailyMenuUnavailable(_that.date,_that.message);case DailyMenuSuccess() when dailyMenuSuccess != null:
return dailyMenuSuccess(_that.dailyMenu);case _:
  return null;

}
}

}

/// @nodoc


class DailyMenuInitial implements DailyMenuState {
  const DailyMenuInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMenuInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyMenuState.initial()';
}


}




/// @nodoc


class DailyMenuLoading implements DailyMenuState {
  const DailyMenuLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMenuLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyMenuState.dailyMenuLoading()';
}


}




/// @nodoc


class DailyMenuError implements DailyMenuState {
  const DailyMenuError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of DailyMenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyMenuErrorCopyWith<DailyMenuError> get copyWith => _$DailyMenuErrorCopyWithImpl<DailyMenuError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMenuError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'DailyMenuState.dailyMenuError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DailyMenuErrorCopyWith<$Res> implements $DailyMenuStateCopyWith<$Res> {
  factory $DailyMenuErrorCopyWith(DailyMenuError value, $Res Function(DailyMenuError) _then) = _$DailyMenuErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$DailyMenuErrorCopyWithImpl<$Res>
    implements $DailyMenuErrorCopyWith<$Res> {
  _$DailyMenuErrorCopyWithImpl(this._self, this._then);

  final DailyMenuError _self;
  final $Res Function(DailyMenuError) _then;

/// Create a copy of DailyMenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(DailyMenuError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DailyMenuUnavailable implements DailyMenuState {
  const DailyMenuUnavailable(this.date, this.message);
  

 final  DateTime date;
 final  String message;

/// Create a copy of DailyMenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyMenuUnavailableCopyWith<DailyMenuUnavailable> get copyWith => _$DailyMenuUnavailableCopyWithImpl<DailyMenuUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMenuUnavailable&&(identical(other.date, date) || other.date == date)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,date,message);

@override
String toString() {
  return 'DailyMenuState.dailyMenuUnavailable(date: $date, message: $message)';
}


}

/// @nodoc
abstract mixin class $DailyMenuUnavailableCopyWith<$Res> implements $DailyMenuStateCopyWith<$Res> {
  factory $DailyMenuUnavailableCopyWith(DailyMenuUnavailable value, $Res Function(DailyMenuUnavailable) _then) = _$DailyMenuUnavailableCopyWithImpl;
@useResult
$Res call({
 DateTime date, String message
});




}
/// @nodoc
class _$DailyMenuUnavailableCopyWithImpl<$Res>
    implements $DailyMenuUnavailableCopyWith<$Res> {
  _$DailyMenuUnavailableCopyWithImpl(this._self, this._then);

  final DailyMenuUnavailable _self;
  final $Res Function(DailyMenuUnavailable) _then;

/// Create a copy of DailyMenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,Object? message = null,}) {
  return _then(DailyMenuUnavailable(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DailyMenuSuccess implements DailyMenuState {
  const DailyMenuSuccess(this.dailyMenu);
  

 final  DailyMenuModel dailyMenu;

/// Create a copy of DailyMenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyMenuSuccessCopyWith<DailyMenuSuccess> get copyWith => _$DailyMenuSuccessCopyWithImpl<DailyMenuSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMenuSuccess&&(identical(other.dailyMenu, dailyMenu) || other.dailyMenu == dailyMenu));
}


@override
int get hashCode => Object.hash(runtimeType,dailyMenu);

@override
String toString() {
  return 'DailyMenuState.dailyMenuSuccess(dailyMenu: $dailyMenu)';
}


}

/// @nodoc
abstract mixin class $DailyMenuSuccessCopyWith<$Res> implements $DailyMenuStateCopyWith<$Res> {
  factory $DailyMenuSuccessCopyWith(DailyMenuSuccess value, $Res Function(DailyMenuSuccess) _then) = _$DailyMenuSuccessCopyWithImpl;
@useResult
$Res call({
 DailyMenuModel dailyMenu
});




}
/// @nodoc
class _$DailyMenuSuccessCopyWithImpl<$Res>
    implements $DailyMenuSuccessCopyWith<$Res> {
  _$DailyMenuSuccessCopyWithImpl(this._self, this._then);

  final DailyMenuSuccess _self;
  final $Res Function(DailyMenuSuccess) _then;

/// Create a copy of DailyMenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dailyMenu = null,}) {
  return _then(DailyMenuSuccess(
null == dailyMenu ? _self.dailyMenu : dailyMenu // ignore: cast_nullable_to_non_nullable
as DailyMenuModel,
  ));
}


}

// dart format on
