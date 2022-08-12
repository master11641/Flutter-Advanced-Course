

import 'package:equatable/equatable.dart';

import '../../data/models/adver_model/adver_model.dart';

class AdverEntity extends Equatable{
  int? page;
  int? total;
  List<Items>? items;
  bool? hasMore;
  AdverEntity({this.page, this.total, this.items,this.hasMore});

 
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}