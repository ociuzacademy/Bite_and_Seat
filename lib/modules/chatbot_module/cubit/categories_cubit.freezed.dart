// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoriesInitial value)?  initial,TResult Function( CategoriesLoading value)?  categoriesLoading,TResult Function( CategoriesError value)?  categoriesError,TResult Function( CategoriesSuccess value)?  categoriesSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoriesInitial() when initial != null:
return initial(_that);case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading(_that);case CategoriesError() when categoriesError != null:
return categoriesError(_that);case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoriesInitial value)  initial,required TResult Function( CategoriesLoading value)  categoriesLoading,required TResult Function( CategoriesError value)  categoriesError,required TResult Function( CategoriesSuccess value)  categoriesSuccess,}){
final _that = this;
switch (_that) {
case CategoriesInitial():
return initial(_that);case CategoriesLoading():
return categoriesLoading(_that);case CategoriesError():
return categoriesError(_that);case CategoriesSuccess():
return categoriesSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoriesInitial value)?  initial,TResult? Function( CategoriesLoading value)?  categoriesLoading,TResult? Function( CategoriesError value)?  categoriesError,TResult? Function( CategoriesSuccess value)?  categoriesSuccess,}){
final _that = this;
switch (_that) {
case CategoriesInitial() when initial != null:
return initial(_that);case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading(_that);case CategoriesError() when categoriesError != null:
return categoriesError(_that);case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  categoriesLoading,TResult Function( String errorMessage)?  categoriesError,TResult Function( List<CategoryModel> categories)?  categoriesSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoriesInitial() when initial != null:
return initial();case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading();case CategoriesError() when categoriesError != null:
return categoriesError(_that.errorMessage);case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  categoriesLoading,required TResult Function( String errorMessage)  categoriesError,required TResult Function( List<CategoryModel> categories)  categoriesSuccess,}) {final _that = this;
switch (_that) {
case CategoriesInitial():
return initial();case CategoriesLoading():
return categoriesLoading();case CategoriesError():
return categoriesError(_that.errorMessage);case CategoriesSuccess():
return categoriesSuccess(_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  categoriesLoading,TResult? Function( String errorMessage)?  categoriesError,TResult? Function( List<CategoryModel> categories)?  categoriesSuccess,}) {final _that = this;
switch (_that) {
case CategoriesInitial() when initial != null:
return initial();case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading();case CategoriesError() when categoriesError != null:
return categoriesError(_that.errorMessage);case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class CategoriesInitial implements CategoriesState {
  const CategoriesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.initial()';
}


}




/// @nodoc


class CategoriesLoading implements CategoriesState {
  const CategoriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.categoriesLoading()';
}


}




/// @nodoc


class CategoriesError implements CategoriesState {
  const CategoriesError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesErrorCopyWith<CategoriesError> get copyWith => _$CategoriesErrorCopyWithImpl<CategoriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CategoriesState.categoriesError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CategoriesErrorCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesErrorCopyWith(CategoriesError value, $Res Function(CategoriesError) _then) = _$CategoriesErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$CategoriesErrorCopyWithImpl<$Res>
    implements $CategoriesErrorCopyWith<$Res> {
  _$CategoriesErrorCopyWithImpl(this._self, this._then);

  final CategoriesError _self;
  final $Res Function(CategoriesError) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(CategoriesError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CategoriesSuccess implements CategoriesState {
  const CategoriesSuccess(final  List<CategoryModel> categories): _categories = categories;
  

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesSuccessCopyWith<CategoriesSuccess> get copyWith => _$CategoriesSuccessCopyWithImpl<CategoriesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesSuccess&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoriesState.categoriesSuccess(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CategoriesSuccessCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesSuccessCopyWith(CategoriesSuccess value, $Res Function(CategoriesSuccess) _then) = _$CategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categories
});




}
/// @nodoc
class _$CategoriesSuccessCopyWithImpl<$Res>
    implements $CategoriesSuccessCopyWith<$Res> {
  _$CategoriesSuccessCopyWithImpl(this._self, this._then);

  final CategoriesSuccess _self;
  final $Res Function(CategoriesSuccess) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(CategoriesSuccess(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

// dart format on
