

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/core/utils/constants.dart';

class CategoryApiProvider {
  final Dio _dio = Dio();
  Future<dynamic> getCategories() async {
    var response = await _dio.get('${Constants.baseUrlAdver}/Advers/getcategories',)   ;
    return response;
  }
}
