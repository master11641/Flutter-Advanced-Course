import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced_course/features/category/domain/entities/category_entity.dart';
import 'package:flutter_advanced_course/features/category/domain/use_cases/get_categories_usecase.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../advers/domain/entities/adver_entity.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategorysUseCase getCategorysUseCase;
  CategoryBloc(this.getCategorysUseCase)
      : super( CategoryState(categoryStatus: CategoryStatus.initial)) {
    on<CategoryEvent>((event, emit) async {
  
     emit(state.copyWith(newCategoryStatus: CategoryStatus.initial));
      DataState<List<CategoryEntity>> dataset = await getCategorysUseCase();
      if (dataset is DataSuccess) {
        emit(state.copyWith(
          newCategoryStatus: CategoryStatus.success,
          newCategoryEntities: dataset.data!,
        ));
      }
      if (dataset is DataFailed) {
        emit(state.copyWith(
            newCategoryStatus: CategoryStatus.failure,
            errorMessage: dataset.error));
      }
    });
  }
}
