import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/core/utils/constants.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_input_model/fetch_input_model.dart';

class AdverApiProvider {
  final Dio _dio = Dio();
  var apiKey = Constants.apiKeys1;

  /// current weather api call
  Future<dynamic> getAdvers(FetchInputModel fetchInputModel) async {
    // var response = await _dio.post('${Constants.baseUrlAdver}/advers/GetAll',
    //     queryParameters:  { "ItemsInPage": itemInPage,"PageNumber":pageNumber,"Title":"خودرو"});
    //var params=  { "ItemsInPage": itemInPage,"PageNumber":pageNumber};
    Response response = await _dio.post(
      '${Constants.baseUrlAdver}/advers/GetAll',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: fetchInputModel.toJson(),
    );
    return response;
  }
  Future<dynamic> getSuggestCategories(int minCharCount,String prefix ) async {
    var params=  { "minCharCount": minCharCount,"prefix":prefix ?? ''};
    Response response = await _dio.get(
      '${Constants.baseUrlAdver}/advers/GetSuggestCategories',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      queryParameters:params ,
    );
    return response;
  }

}
