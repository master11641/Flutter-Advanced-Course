import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/theme/domain/entities/theme_entity.dart';

import '../../../../core/utils/custom_color.dart';
import '../../../../core/utils/my_theme.dart';





class AppTheme extends ThemeEntity{
  String? name;
  MyTheme? theme;
  AppTheme(this.name, this.theme) ;
}
