// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserRegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRegisterEvent()';
}


}

/// @nodoc
class $UserRegisterEventCopyWith<$Res>  {
$UserRegisterEventCopyWith(UserRegisterEvent _, $Res Function(UserRegisterEvent) __);
}


/// Adds pattern-matching-related methods to [UserRegisterEvent].
extension UserRegisterEventPatterns on UserRegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UserRegister value)?  userRegister,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UserRegister() when userRegister != null:
return userRegister(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UserRegister value)  userRegister,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UserRegister():
return userRegister(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UserRegister value)?  userRegister,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UserRegister() when userRegister != null:
return userRegister(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( RegisterData data)?  userRegister,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UserRegister() when userRegister != null:
return userRegister(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( RegisterData data)  userRegister,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UserRegister():
return userRegister(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( RegisterData data)?  userRegister,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UserRegister() when userRegister != null:
return userRegister(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UserRegisterEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRegisterEvent.started()';
}


}




/// @nodoc


class _UserRegister implements UserRegisterEvent {
  const _UserRegister({required this.data});
  

 final  RegisterData data;

/// Create a copy of UserRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRegisterCopyWith<_UserRegister> get copyWith => __$UserRegisterCopyWithImpl<_UserRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRegister&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserRegisterEvent.userRegister(data: $data)';
}


}

/// @nodoc
abstract mixin class _$UserRegisterCopyWith<$Res> implements $UserRegisterEventCopyWith<$Res> {
  factory _$UserRegisterCopyWith(_UserRegister value, $Res Function(_UserRegister) _then) = __$UserRegisterCopyWithImpl;
@useResult
$Res call({
 RegisterData data
});




}
/// @nodoc
class __$UserRegisterCopyWithImpl<$Res>
    implements _$UserRegisterCopyWith<$Res> {
  __$UserRegisterCopyWithImpl(this._self, this._then);

  final _UserRegister _self;
  final $Res Function(_UserRegister) _then;

/// Create a copy of UserRegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_UserRegister(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterData,
  ));
}


}

/// @nodoc
mixin _$UserRegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRegisterState()';
}


}

/// @nodoc
class $UserRegisterStateCopyWith<$Res>  {
$UserRegisterStateCopyWith(UserRegisterState _, $Res Function(UserRegisterState) __);
}


/// Adds pattern-matching-related methods to [UserRegisterState].
extension UserRegisterStatePatterns on UserRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserRegisterInitial value)?  initial,TResult Function( UserRegisterLoading value)?  loading,TResult Function( UserRegisterSuccess value)?  success,TResult Function( UserRegisterError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserRegisterInitial() when initial != null:
return initial(_that);case UserRegisterLoading() when loading != null:
return loading(_that);case UserRegisterSuccess() when success != null:
return success(_that);case UserRegisterError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserRegisterInitial value)  initial,required TResult Function( UserRegisterLoading value)  loading,required TResult Function( UserRegisterSuccess value)  success,required TResult Function( UserRegisterError value)  error,}){
final _that = this;
switch (_that) {
case UserRegisterInitial():
return initial(_that);case UserRegisterLoading():
return loading(_that);case UserRegisterSuccess():
return success(_that);case UserRegisterError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserRegisterInitial value)?  initial,TResult? Function( UserRegisterLoading value)?  loading,TResult? Function( UserRegisterSuccess value)?  success,TResult? Function( UserRegisterError value)?  error,}){
final _that = this;
switch (_that) {
case UserRegisterInitial() when initial != null:
return initial(_that);case UserRegisterLoading() when loading != null:
return loading(_that);case UserRegisterSuccess() when success != null:
return success(_that);case UserRegisterError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( RegisterResponseModel response)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserRegisterInitial() when initial != null:
return initial();case UserRegisterLoading() when loading != null:
return loading();case UserRegisterSuccess() when success != null:
return success(_that.response);case UserRegisterError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( RegisterResponseModel response)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case UserRegisterInitial():
return initial();case UserRegisterLoading():
return loading();case UserRegisterSuccess():
return success(_that.response);case UserRegisterError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( RegisterResponseModel response)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case UserRegisterInitial() when initial != null:
return initial();case UserRegisterLoading() when loading != null:
return loading();case UserRegisterSuccess() when success != null:
return success(_that.response);case UserRegisterError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class UserRegisterInitial implements UserRegisterState {
  const UserRegisterInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRegisterState.initial()';
}


}




/// @nodoc


class UserRegisterLoading implements UserRegisterState {
  const UserRegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserRegisterState.loading()';
}


}




/// @nodoc


class UserRegisterSuccess implements UserRegisterState {
  const UserRegisterSuccess(this.response);
  

 final  RegisterResponseModel response;

/// Create a copy of UserRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisterSuccessCopyWith<UserRegisterSuccess> get copyWith => _$UserRegisterSuccessCopyWithImpl<UserRegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'UserRegisterState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $UserRegisterSuccessCopyWith<$Res> implements $UserRegisterStateCopyWith<$Res> {
  factory $UserRegisterSuccessCopyWith(UserRegisterSuccess value, $Res Function(UserRegisterSuccess) _then) = _$UserRegisterSuccessCopyWithImpl;
@useResult
$Res call({
 RegisterResponseModel response
});




}
/// @nodoc
class _$UserRegisterSuccessCopyWithImpl<$Res>
    implements $UserRegisterSuccessCopyWith<$Res> {
  _$UserRegisterSuccessCopyWithImpl(this._self, this._then);

  final UserRegisterSuccess _self;
  final $Res Function(UserRegisterSuccess) _then;

/// Create a copy of UserRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UserRegisterSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as RegisterResponseModel,
  ));
}


}

/// @nodoc


class UserRegisterError implements UserRegisterState {
  const UserRegisterError(this.error);
  

 final  String error;

/// Create a copy of UserRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisterErrorCopyWith<UserRegisterError> get copyWith => _$UserRegisterErrorCopyWithImpl<UserRegisterError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UserRegisterState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $UserRegisterErrorCopyWith<$Res> implements $UserRegisterStateCopyWith<$Res> {
  factory $UserRegisterErrorCopyWith(UserRegisterError value, $Res Function(UserRegisterError) _then) = _$UserRegisterErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$UserRegisterErrorCopyWithImpl<$Res>
    implements $UserRegisterErrorCopyWith<$Res> {
  _$UserRegisterErrorCopyWithImpl(this._self, this._then);

  final UserRegisterError _self;
  final $Res Function(UserRegisterError) _then;

/// Create a copy of UserRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(UserRegisterError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
