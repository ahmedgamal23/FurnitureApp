import '../entities/categories_items.dart';
import '../repository/base_categories_items_repository.dart';

abstract class BaseCategoriesItemsUseCase{
  Future<List<CategoriesItems>> execute(int cateID);
}

class CategoriesItemsUseCase extends BaseCategoriesItemsUseCase{

  final BaseCategoriesItemsRepository baseCategoriesItemsRepository;
  CategoriesItemsUseCase(this.baseCategoriesItemsRepository);

  @override
  Future<List<CategoriesItems>> execute(int cateID) async {
    return await baseCategoriesItemsRepository.getCategoriesItems(cateID);
  }
}



