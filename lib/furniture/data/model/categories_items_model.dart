import 'dart:ffi';

import 'package:furniture_app/furniture/domain/entities/categories_items.dart';

class CategoriesItemsModel extends CategoriesItems{
  const CategoriesItemsModel({required super.id, required super.image, required super.name, required super.price});

  factory CategoriesItemsModel.fromJson(Map<String , dynamic> json){
    return CategoriesItemsModel(
        id: int.parse(json["id"].toString()),
        image: json["image"],
        name: json["name"],
        price: json["price"]
    );
  }

}
