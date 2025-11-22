// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserOrdersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrdersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserOrdersState()';
}


}

/// @nodoc
class $UserOrdersStateCopyWith<$Res>  {
$UserOrdersStateCopyWith(UserOrdersState _, $Res Function(UserOrdersState) __);
}


/// Adds pattern-matching-related methods to [UserOrdersState].
extension UserOrdersStatePatterns on UserOrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserOrdersInitial value)?  initial,TResult Function( UserOrdersLoading value)?  userOrdersLoading,TResult Function( UserOrdersError value)?  userOrdersError,TResult Function( UserOrdersEmpty value)?  userOrdersEmpty,TResult Function( UserOrdersSuccess value)?  userOrdersSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserOrdersInitial() when initial != null:
return initial(_that);case UserOrdersLoading() when userOrdersLoading != null:
return userOrdersLoading(_that);case UserOrdersError() when userOrdersError != null:
return userOrdersError(_that);case UserOrdersEmpty() when userOrdersEmpty != null:
return userOrdersEmpty(_that);case UserOrdersSuccess() when userOrdersSuccess != null:
return userOrdersSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserOrdersInitial value)  initial,required TResult Function( UserOrdersLoading value)  userOrdersLoading,required TResult Function( UserOrdersError value)  userOrdersError,required TResult Function( UserOrdersEmpty value)  userOrdersEmpty,required TResult Function( UserOrdersSuccess value)  userOrdersSuccess,}){
final _that = this;
switch (_that) {
case UserOrdersInitial():
return initial(_that);case UserOrdersLoading():
return userOrdersLoading(_that);case UserOrdersError():
return userOrdersError(_that);case UserOrdersEmpty():
return userOrdersEmpty(_that);case UserOrdersSuccess():
return userOrdersSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserOrdersInitial value)?  initial,TResult? Function( UserOrdersLoading value)?  userOrdersLoading,TResult? Function( UserOrdersError value)?  userOrdersError,TResult? Function( UserOrdersEmpty value)?  userOrdersEmpty,TResult? Function( UserOrdersSuccess value)?  userOrdersSuccess,}){
final _that = this;
switch (_that) {
case UserOrdersInitial() when initial != null:
return initial(_that);case UserOrdersLoading() when userOrdersLoading != null:
return userOrdersLoading(_that);case UserOrdersError() when userOrdersError != null:
return userOrdersError(_that);case UserOrdersEmpty() when userOrdersEmpty != null:
return userOrdersEmpty(_that);case UserOrdersSuccess() when userOrdersSuccess != null:
return userOrdersSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  userOrdersLoading,TResult Function( String errorMessage)?  userOrdersError,TResult Function()?  userOrdersEmpty,TResult Function( List<UserOrderModel> userOrders)?  userOrdersSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserOrdersInitial() when initial != null:
return initial();case UserOrdersLoading() when userOrdersLoading != null:
return userOrdersLoading();case UserOrdersError() when userOrdersError != null:
return userOrdersError(_that.errorMessage);case UserOrdersEmpty() when userOrdersEmpty != null:
return userOrdersEmpty();case UserOrdersSuccess() when userOrdersSuccess != null:
return userOrdersSuccess(_that.userOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  userOrdersLoading,required TResult Function( String errorMessage)  userOrdersError,required TResult Function()  userOrdersEmpty,required TResult Function( List<UserOrderModel> userOrders)  userOrdersSuccess,}) {final _that = this;
switch (_that) {
case UserOrdersInitial():
return initial();case UserOrdersLoading():
return userOrdersLoading();case UserOrdersError():
return userOrdersError(_that.errorMessage);case UserOrdersEmpty():
return userOrdersEmpty();case UserOrdersSuccess():
return userOrdersSuccess(_that.userOrders);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  userOrdersLoading,TResult? Function( String errorMessage)?  userOrdersError,TResult? Function()?  userOrdersEmpty,TResult? Function( List<UserOrderModel> userOrders)?  userOrdersSuccess,}) {final _that = this;
switch (_that) {
case UserOrdersInitial() when initial != null:
return initial();case UserOrdersLoading() when userOrdersLoading != null:
return userOrdersLoading();case UserOrdersError() when userOrdersError != null:
return userOrdersError(_that.errorMessage);case UserOrdersEmpty() when userOrdersEmpty != null:
return userOrdersEmpty();case UserOrdersSuccess() when userOrdersSuccess != null:
return userOrdersSuccess(_that.userOrders);case _:
  return null;

}
}

}

/// @nodoc


class UserOrdersInitial implements UserOrdersState {
  const UserOrdersInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrdersInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserOrdersState.initial()';
}


}




/// @nodoc


class UserOrdersLoading implements UserOrdersState {
  const UserOrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserOrdersState.userOrdersLoading()';
}


}




/// @nodoc


class UserOrdersError implements UserOrdersState {
  const UserOrdersError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of UserOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserOrdersErrorCopyWith<UserOrdersError> get copyWith => _$UserOrdersErrorCopyWithImpl<UserOrdersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrdersError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'UserOrdersState.userOrdersError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UserOrdersErrorCopyWith<$Res> implements $UserOrdersStateCopyWith<$Res> {
  factory $UserOrdersErrorCopyWith(UserOrdersError value, $Res Function(UserOrdersError) _then) = _$UserOrdersErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$UserOrdersErrorCopyWithImpl<$Res>
    implements $UserOrdersErrorCopyWith<$Res> {
  _$UserOrdersErrorCopyWithImpl(this._self, this._then);

  final UserOrdersError _self;
  final $Res Function(UserOrdersError) _then;

/// Create a copy of UserOrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(UserOrdersError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserOrdersEmpty implements UserOrdersState {
  const UserOrdersEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrdersEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserOrdersState.userOrdersEmpty()';
}


}




/// @nodoc


class UserOrdersSuccess implements UserOrdersState {
  const UserOrdersSuccess(final  List<UserOrderModel> userOrders): _userOrders = userOrders;
  

 final  List<UserOrderModel> _userOrders;
 List<UserOrderModel> get userOrders {
  if (_userOrders is EqualUnmodifiableListView) return _userOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userOrders);
}


/// Create a copy of UserOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserOrdersSuccessCopyWith<UserOrdersSuccess> get copyWith => _$UserOrdersSuccessCopyWithImpl<UserOrdersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrdersSuccess&&const DeepCollectionEquality().equals(other._userOrders, _userOrders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userOrders));

@override
String toString() {
  return 'UserOrdersState.userOrdersSuccess(userOrders: $userOrders)';
}


}

/// @nodoc
abstract mixin class $UserOrdersSuccessCopyWith<$Res> implements $UserOrdersStateCopyWith<$Res> {
  factory $UserOrdersSuccessCopyWith(UserOrdersSuccess value, $Res Function(UserOrdersSuccess) _then) = _$UserOrdersSuccessCopyWithImpl;
@useResult
$Res call({
 List<UserOrderModel> userOrders
});




}
/// @nodoc
class _$UserOrdersSuccessCopyWithImpl<$Res>
    implements $UserOrdersSuccessCopyWith<$Res> {
  _$UserOrdersSuccessCopyWithImpl(this._self, this._then);

  final UserOrdersSuccess _self;
  final $Res Function(UserOrdersSuccess) _then;

/// Create a copy of UserOrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userOrders = null,}) {
  return _then(UserOrdersSuccess(
null == userOrders ? _self._userOrders : userOrders // ignore: cast_nullable_to_non_nullable
as List<UserOrderModel>,
  ));
}


}

// dart format on
