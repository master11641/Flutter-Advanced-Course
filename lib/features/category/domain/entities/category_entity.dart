

import 'package:equatable/equatable.dart';



class CategoryEntity extends Equatable{
  int? xCategoryIdPk;
  String? xCatTitle;
  String? xIcone;
  CategoryEntity({this.xCategoryIdPk, this.xCatTitle, this.xIcone});

 
  
  @override
  // TODO: implement props
  List<Object?> get props => [xCategoryIdPk,xCatTitle,xIcone];
}