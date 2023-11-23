import 'package:furniture_app/furniture/domain/entities/furniture.dart';

class FurnitureModel extends Furniture{
  const FurnitureModel({required super.categoryId, required super.categoryName, required super.categoryImage,
                   required super.categoryCount, required super.recommendedId, required super.recommendedName,
                   required super.recommendedImage, required super.recommendedPrice});

  factory FurnitureModel.fromJson(Map<String , dynamic> json){
    return FurnitureModel(
        /// Categories
        categoryId: json["category_id"]??0,
        categoryName: json["category_name"]??"",
        categoryImage: json["category_image"]??"",
        categoryCount: json["category_count"]??0,
        /// Recommendation For you
        recommendedId: json["recommended_id"]??0,
        recommendedName: json["recommended_name"]??"",
        recommendedImage: json["recommended_image"]??"",
        recommendedPrice: json["recommended_price"]??0.0
    );
  }

}

