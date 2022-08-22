import 'package:flutter_advanced_course/features/category/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/theme/domain/entities/theme_entity.dart';
import 'package:flutter_advanced_course/features/theme/domain/repository/theme_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetThemeUseCase {
  final ThemeRepository themeRepository;
  GetThemeUseCase(this.themeRepository);
  DataState<ThemeEntity> call({int index = 0}) {
    return themeRepository.getTheme(index: index);
  }
}
