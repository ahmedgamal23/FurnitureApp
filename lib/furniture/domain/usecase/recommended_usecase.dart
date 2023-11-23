import 'package:furniture_app/furniture/domain/entities/furniture.dart';
import 'package:furniture_app/furniture/domain/repository/base_repository_furniture.dart';

abstract class BaseRecommendedUseCase{
  Future<List<Furniture>> execute();
}

class RecommendedUseCase extends BaseRecommendedUseCase{
  final BaseRepositoryFurniture baseRepositoryFurniture;
  RecommendedUseCase(this.baseRepositoryFurniture);

  @override
  Future<List<Furniture>> execute() async{
    return await baseRepositoryFurniture.getRecommendedFurniture();
  }
}
