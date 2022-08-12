
 import 'dart:core';

class FetchInputModel {
  int? pageNumber;
  int? itemsInPage;
  int? catId ;
  String? title;
//     public int PageNumber { get; set; }
//     public int ItemsInPage { get; set; }
//     public int? CatId { get; set; }
//  #nullable enable   
//     public string? Title { get; set; }
//     public decimal? Lat { get; set; }
//     public decimal? Lon { get; set; }
//     public bool? IsUrgent { get; set; }
//     public bool? IsImage { get; set; }
//     public int? AdvBuyerType { get; set; }
//     public List<short> CitiesId { get; set; }
FetchInputModel({this.pageNumber,this.itemsInPage,this.catId,this.title});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageNumber'] = this.pageNumber;
    data['ItemsInPage'] = this.itemsInPage;
   data['CatId'] = this.catId;
    data['Title'] = this.title;
    return data;
  }
}

