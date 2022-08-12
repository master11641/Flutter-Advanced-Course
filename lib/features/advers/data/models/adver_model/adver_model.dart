import 'package:flutter_advanced_course/features/advers/domain/entities/adver_entity.dart';

class AdverModel extends AdverEntity{
  int? page;
  int? total;
  List<Items>? items;
  bool? hasMore;
  AdverModel({this.page, this.total, this.items});

  AdverModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    total = json['total'];
    hasMore=json['hasMore'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? xAdvertismentIdPk;
  String? xAdvTitle;
  List<Images>? images;

  Items({this.xAdvertismentIdPk, this.xAdvTitle, this.images});

  Items.fromJson(Map<String, dynamic> json) {
    xAdvertismentIdPk = json['xAdvertismentIdPk'];
    xAdvTitle = json['xAdvTitle'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xAdvertismentIdPk'] = this.xAdvertismentIdPk;
    data['xAdvTitle'] = this.xAdvTitle;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? xImage;

  Images({this.xImage});

  Images.fromJson(Map<String, dynamic> json) {
    xImage = json['xImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xImage'] = this.xImage;
    return data;
  }
}
