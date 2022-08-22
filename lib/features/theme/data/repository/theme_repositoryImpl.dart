

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_input_model/fetch_input_model.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_model/adver_model.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';
import 'package:flutter_advanced_course/features/advers/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/category/domain/entities/category_entity.dart';
import 'package:flutter_advanced_course/features/category/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/theme/data/data_source/local/theme_provider.dart';
import 'package:flutter_advanced_course/features/theme/domain/entities/theme_entity.dart';
import 'package:flutter_advanced_course/features/theme/domain/repository/theme_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../advers/data/data_source/remote/api_provider.dart';



class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeProvider themeProvider;

  ThemeRepositoryImpl(this.themeProvider);
  @override
  DataState<ThemeEntity> getTheme({required int index}) {
     return DataSuccess(themeProvider.getTheme(index: index));
  }

  }  




 
