import '../../../../core/resources/data_state.dart';

import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> getCats();
}
