// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_seats_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableSeatsListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsListState()';
}


}

/// @nodoc
class $TableSeatsListStateCopyWith<$Res>  {
$TableSeatsListStateCopyWith(TableSeatsListState _, $Res Function(TableSeatsListState) __);
}


/// Adds pattern-matching-related methods to [TableSeatsListState].
extension TableSeatsListStatePatterns on TableSeatsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TableSeatsListInitial value)?  initial,TResult Function( TableSeatsListLoading value)?  tableSeatsListLoading,TResult Function( TableSeatsListError value)?  tableSeatsListError,TResult Function( TableSeatsListSuccess value)?  tableSeatsListSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TableSeatsListInitial() when initial != null:
return initial(_that);case TableSeatsListLoading() when tableSeatsListLoading != null:
return tableSeatsListLoading(_that);case TableSeatsListError() when tableSeatsListError != null:
return tableSeatsListError(_that);case TableSeatsListSuccess() when tableSeatsListSuccess != null:
return tableSeatsListSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TableSeatsListInitial value)  initial,required TResult Function( TableSeatsListLoading value)  tableSeatsListLoading,required TResult Function( TableSeatsListError value)  tableSeatsListError,required TResult Function( TableSeatsListSuccess value)  tableSeatsListSuccess,}){
final _that = this;
switch (_that) {
case TableSeatsListInitial():
return initial(_that);case TableSeatsListLoading():
return tableSeatsListLoading(_that);case TableSeatsListError():
return tableSeatsListError(_that);case TableSeatsListSuccess():
return tableSeatsListSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TableSeatsListInitial value)?  initial,TResult? Function( TableSeatsListLoading value)?  tableSeatsListLoading,TResult? Function( TableSeatsListError value)?  tableSeatsListError,TResult? Function( TableSeatsListSuccess value)?  tableSeatsListSuccess,}){
final _that = this;
switch (_that) {
case TableSeatsListInitial() when initial != null:
return initial(_that);case TableSeatsListLoading() when tableSeatsListLoading != null:
return tableSeatsListLoading(_that);case TableSeatsListError() when tableSeatsListError != null:
return tableSeatsListError(_that);case TableSeatsListSuccess() when tableSeatsListSuccess != null:
return tableSeatsListSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  tableSeatsListLoading,TResult Function( String errorMessage)?  tableSeatsListError,TResult Function( AllTableSeatsModel tableSeatsList)?  tableSeatsListSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TableSeatsListInitial() when initial != null:
return initial();case TableSeatsListLoading() when tableSeatsListLoading != null:
return tableSeatsListLoading();case TableSeatsListError() when tableSeatsListError != null:
return tableSeatsListError(_that.errorMessage);case TableSeatsListSuccess() when tableSeatsListSuccess != null:
return tableSeatsListSuccess(_that.tableSeatsList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  tableSeatsListLoading,required TResult Function( String errorMessage)  tableSeatsListError,required TResult Function( AllTableSeatsModel tableSeatsList)  tableSeatsListSuccess,}) {final _that = this;
switch (_that) {
case TableSeatsListInitial():
return initial();case TableSeatsListLoading():
return tableSeatsListLoading();case TableSeatsListError():
return tableSeatsListError(_that.errorMessage);case TableSeatsListSuccess():
return tableSeatsListSuccess(_that.tableSeatsList);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  tableSeatsListLoading,TResult? Function( String errorMessage)?  tableSeatsListError,TResult? Function( AllTableSeatsModel tableSeatsList)?  tableSeatsListSuccess,}) {final _that = this;
switch (_that) {
case TableSeatsListInitial() when initial != null:
return initial();case TableSeatsListLoading() when tableSeatsListLoading != null:
return tableSeatsListLoading();case TableSeatsListError() when tableSeatsListError != null:
return tableSeatsListError(_that.errorMessage);case TableSeatsListSuccess() when tableSeatsListSuccess != null:
return tableSeatsListSuccess(_that.tableSeatsList);case _:
  return null;

}
}

}

/// @nodoc


class TableSeatsListInitial implements TableSeatsListState {
  const TableSeatsListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsListState.initial()';
}


}




/// @nodoc


class TableSeatsListLoading implements TableSeatsListState {
  const TableSeatsListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableSeatsListState.tableSeatsListLoading()';
}


}




/// @nodoc


class TableSeatsListError implements TableSeatsListState {
  const TableSeatsListError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of TableSeatsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableSeatsListErrorCopyWith<TableSeatsListError> get copyWith => _$TableSeatsListErrorCopyWithImpl<TableSeatsListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsListError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TableSeatsListState.tableSeatsListError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TableSeatsListErrorCopyWith<$Res> implements $TableSeatsListStateCopyWith<$Res> {
  factory $TableSeatsListErrorCopyWith(TableSeatsListError value, $Res Function(TableSeatsListError) _then) = _$TableSeatsListErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$TableSeatsListErrorCopyWithImpl<$Res>
    implements $TableSeatsListErrorCopyWith<$Res> {
  _$TableSeatsListErrorCopyWithImpl(this._self, this._then);

  final TableSeatsListError _self;
  final $Res Function(TableSeatsListError) _then;

/// Create a copy of TableSeatsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(TableSeatsListError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TableSeatsListSuccess implements TableSeatsListState {
  const TableSeatsListSuccess(this.tableSeatsList);
  

 final  AllTableSeatsModel tableSeatsList;

/// Create a copy of TableSeatsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableSeatsListSuccessCopyWith<TableSeatsListSuccess> get copyWith => _$TableSeatsListSuccessCopyWithImpl<TableSeatsListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableSeatsListSuccess&&(identical(other.tableSeatsList, tableSeatsList) || other.tableSeatsList == tableSeatsList));
}


@override
int get hashCode => Object.hash(runtimeType,tableSeatsList);

@override
String toString() {
  return 'TableSeatsListState.tableSeatsListSuccess(tableSeatsList: $tableSeatsList)';
}


}

/// @nodoc
abstract mixin class $TableSeatsListSuccessCopyWith<$Res> implements $TableSeatsListStateCopyWith<$Res> {
  factory $TableSeatsListSuccessCopyWith(TableSeatsListSuccess value, $Res Function(TableSeatsListSuccess) _then) = _$TableSeatsListSuccessCopyWithImpl;
@useResult
$Res call({
 AllTableSeatsModel tableSeatsList
});




}
/// @nodoc
class _$TableSeatsListSuccessCopyWithImpl<$Res>
    implements $TableSeatsListSuccessCopyWith<$Res> {
  _$TableSeatsListSuccessCopyWithImpl(this._self, this._then);

  final TableSeatsListSuccess _self;
  final $Res Function(TableSeatsListSuccess) _then;

/// Create a copy of TableSeatsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableSeatsList = null,}) {
  return _then(TableSeatsListSuccess(
null == tableSeatsList ? _self.tableSeatsList : tableSeatsList // ignore: cast_nullable_to_non_nullable
as AllTableSeatsModel,
  ));
}


}

// dart format on
