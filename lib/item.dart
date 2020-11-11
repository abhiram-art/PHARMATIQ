import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel{
  String title;
  String shortInfo;
  String thumbnailUrl;
  String longDescription;
  String status;
  int price;

  ItemModel({
    this.title,
    this.shortInfo,
    this.thumbnailUrl,
    this.longDescription,
    this.status,
});

  ItemModel.fromJson(Map<String , dynamic> json){
    title = json['title'];
    shortInfo = json['shortInfo'];
    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];
    status = json['status'];
    price = json['price'];
  }

  Map<String, dynamic> toJson()
  {
  }
}