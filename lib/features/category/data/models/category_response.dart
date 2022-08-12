
import 'package:flutter_advanced_course/features/category/domain/entities/category_entity.dart';

class CategoryResponse  extends CategoryEntity{
  int? xCategoryIdPk;
  String? xCatTitle;
  String? xIcone;

  CategoryResponse({this.xCategoryIdPk, this.xCatTitle, this.xIcone});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    xCategoryIdPk = json['xCategoryIdPk'];
    xCatTitle = json['xCatTitle'];
    xIcone = json['xIcone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xCategoryIdPk'] = this.xCategoryIdPk;
    data['xCatTitle'] = this.xCatTitle;
    data['xIcone'] = this.xIcone;
    return data;
  }
}
