
import 'package:flutter_advanced_course/core/usecase/use_case.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';
import 'package:flutter_advanced_course/features/advers/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/category/domain/repository/adver_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/category_entity.dart';


class GetCategorysUseCase {
  final CategoryRepository categoryRepository;
  GetCategorysUseCase(this.categoryRepository);
  @override
  Future<DataState<List<CategoryEntity>>> call() {
     return   categoryRepository.getCats();
  }
     
}