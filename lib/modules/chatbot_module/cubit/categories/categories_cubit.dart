import 'package:bite_and_seat/modules/chatbot_module/services/chatbot_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/chatbot_module/models/api_models/category_model.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.categoriesLoading());
    try {
      final List<CategoryModel> categories =
          await ChatbotServices.getCategories();

      emit(CategoriesState.categoriesSuccess(categories));
    } catch (e) {
      emit(CategoriesState.categoriesError(e.toString()));
    }
  }

  void reset() {
    emit(const CategoriesState.initial());
  }
}
