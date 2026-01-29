part of 'categories_cubit.dart';

@freezed
sealed class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = CategoriesInitial;
  const factory CategoriesState.categoriesLoading() = CategoriesLoading;
  const factory CategoriesState.categoriesError(String errorMessage) =
      CategoriesError;
  const factory CategoriesState.categoriesSuccess(
    List<CategoryModel> categories,
  ) = CategoriesSuccess;
}
