import 'package:furniture_app/furniture/domain/entities/furniture.dart';
import 'package:furniture_app/furniture/domain/repository/base_repository_furniture.dart';

abstract class BaseCategoriesUseCase{
  Future<List<Furniture>> execute();
}

class CategoriesUseCase extends BaseCategoriesUseCase{
  final BaseRepositoryFurniture baseRepositoryFurniture;
  CategoriesUseCase(this.baseRepositoryFurniture);

  @override
  Future<List<Furniture>> execute() async {
    return await baseRepositoryFurniture.getCategoriesFurniture();
  }
}
