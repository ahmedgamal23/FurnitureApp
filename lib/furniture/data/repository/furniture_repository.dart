import 'package:furniture_app/furniture/data/datasource/furniture_datasource.dart';
import 'package:furniture_app/furniture/domain/entities/furniture.dart';

import '../../domain/repository/base_repository_furniture.dart';

class FurnitureRepository extends BaseRepositoryFurniture{
  final BaseCategoriesDataSource baseCategoriesDataSource;
  final BaseRecommendedDataSource baseRecommendedDataSource;
  FurnitureRepository(this.baseCategoriesDataSource , this.baseRecommendedDataSource);

  @override
  Future<List<Furniture>> getCategoriesFurniture() {
    return baseCategoriesDataSource.getCategoriesData();
  }

  @override
  Future<List<Furniture>> getRecommendedFurniture() {
    return baseRecommendedDataSource.getRecommendedData();
  }

}
