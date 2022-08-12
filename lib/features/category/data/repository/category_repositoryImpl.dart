

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_input_model/fetch_input_model.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_model/adver_model.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';
import 'package:flutter_advanced_course/features/advers/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/category/domain/entities/category_entity.dart';
import 'package:flutter_advanced_course/features/category/domain/repository/adver_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../advers/data/data_source/remote/api_provider.dart';
import '../data_source/remote/api_provider.dart';
import '../models/category_response.dart';


class CategoryRepositoryImpl extends CategoryRepository {
  CategoryApiProvider apiProvider;
  CategoryRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<CategoryEntity>>> getCats() async {
     try {
        //FetchInputModel fetchInputModel=fetchInputModel;
        
      Response response = await apiProvider.getCategories();
      if (response.statusCode == 200) {
        Iterable listResponse =response.data;
        List<CategoryEntity> categoryEntities = listResponse.map((e)=>CategoryResponse.fromJson(e)).toList();
        // CategoryEntity categoryEntity =
        //     CategoryResponse.fromJson(response.data);
        return DataSuccess(categoryEntities);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }  




 
}