

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_model/adver_model.dart';
import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';
import 'package:flutter_advanced_course/features/advers/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/category/data/models/category_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../category/domain/entities/category_entity.dart';
import '../data_source/remote/api_provider.dart';
import '../models/adver_input_model/fetch_input_model.dart';

class AdverRepositoryImpl extends AdverRepository {
  AdverApiProvider apiProvider;
  AdverRepositoryImpl(this.apiProvider);  
  @override
  Future<DataState<AdverEntity>> fetchAdvers(FetchInputModel fetchInputModel) async {
       try {
        //FetchInputModel fetchInputModel=fetchInputModel;
        
      Response response = await apiProvider.getAdvers(fetchInputModel);
      if (response.statusCode == 200) {
        AdverEntity adverEntity =
            AdverModel.fromJson(response.data);
        return DataSuccess(adverEntity);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }

  @override
  Future<List<CategoryEntity>> getSuggests(int minCharCount,String prefix)async {
     Response response =await apiProvider.getSuggestCategories(minCharCount, prefix);
       Iterable listResponse =response.data;
       if(response.statusCode == 200){
           List<CategoryEntity> categoryEntities = listResponse.map((e)=>CategoryResponse.fromJson(e)).toList();
          return categoryEntities;
       }
     return [];
  }
  
 
}