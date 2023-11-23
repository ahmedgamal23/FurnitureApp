import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:furniture_app/furniture/data/model/furniture_model.dart';

abstract class BaseCategoriesDataSource{
  Future<List<FurnitureModel>> getCategoriesData();
}

abstract class BaseRecommendedDataSource{
  Future<List<FurnitureModel>> getRecommendedData();
}

class CategoriesDataSource extends BaseCategoriesDataSource{

  @override
  Future<List<FurnitureModel>> getCategoriesData() async{
    final String response = await rootBundle.loadString("assets/JSON/json_furniture.json");
    final data = await json.decode(response);
    return List<FurnitureModel>.from( (data["browse_category"] as List).map((e) => FurnitureModel.fromJson(e)) );
  }
}

class RecommendedDataSource extends BaseRecommendedDataSource{
  @override
  Future<List<FurnitureModel>> getRecommendedData() async {
    final String response = await rootBundle.loadString("assets/JSON/json_furniture.json");
    final data = await json.decode(response);
    return List<FurnitureModel>.from( (data["recommended_for_you"] as List).map((e) => FurnitureModel.fromJson(e)) );
  }
}
