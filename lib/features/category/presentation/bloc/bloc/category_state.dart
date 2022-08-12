part of 'category_bloc.dart';

enum CategoryStatus { initial, success, failure }

class CategoryState extends Equatable {
  const CategoryState(
      {this.categoryEntities = const <CategoryEntity>[],
      this.categoryStatus = CategoryStatus.initial,
      this.errorMessage});
  final CategoryStatus categoryStatus;
  final String? errorMessage;
  final List<CategoryEntity> categoryEntities;
  @override
  List<Object> get props => [
    categoryEntities,categoryStatus
  ];
  CategoryState copyWith(
      {required CategoryStatus newCategoryStatus,
      String? errorMessage,
      List<CategoryEntity>? newCategoryEntities}) {
    return CategoryState(
        categoryStatus: newCategoryStatus,
        errorMessage: errorMessage,
        categoryEntities: newCategoryEntities ?? categoryEntities);
  }
}

// class CategoryInit extends CategoryState {}
// class CategoryCompleted extends CategoryState {}
// class CategoryError extends CategoryState {}