import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:furniture_app/furniture/domain/entities/furniture_details.dart';

abstract class BaseDetailsDataSource{
  Future<FurnitureDetails> getFurnitureDetails(int id);
}

class DetailsDataSource extends BaseDetailsDataSource{
  @override
  Future<FurnitureDetails> getFurnitureDetails(int id) async {
    final String response = await rootBundle.loadString("assets/JSON/recommended_details/details.json");
    final data = await json.decode(response);
    for(int i=0;i<data.length;i++){
      if(data[i]["recommended_id"]==id){
        return FurnitureDetails(id: id, description: data[i]["recommended_details"]);
      }
    }
    return const FurnitureDetails(id: 0  , description: "");
  }
}
