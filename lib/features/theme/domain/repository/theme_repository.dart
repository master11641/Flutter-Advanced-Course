import 'package:flutter_advanced_course/features/theme/domain/entities/theme_entity.dart';

import '../../../../core/resources/data_state.dart';



abstract class ThemeRepository {
  DataState<ThemeEntity> getTheme({required int index});
}
