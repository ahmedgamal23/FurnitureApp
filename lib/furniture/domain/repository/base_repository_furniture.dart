import 'package:furniture_app/furniture/domain/entities/furniture.dart';

abstract class BaseRepositoryFurniture{
  Future<List<Furniture>> getCategoriesFurniture();
  Future<List<Furniture>> getRecommendedFurniture();
}
