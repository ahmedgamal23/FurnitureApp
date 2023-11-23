import 'package:furniture_app/furniture/domain/entities/cart.dart';

class CartModel extends Cart{
  const CartModel({required super.id, required super.imagePath, required super.imageName, required super.price});

  factory CartModel.fromJson(Map<String,dynamic> json){
    return CartModel(id: json["id"]??0, imagePath: json["image"]??"", imageName: json["name"]??"", price: json["price"]??0.0);
  }

}
