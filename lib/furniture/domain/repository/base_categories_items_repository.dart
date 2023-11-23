import '../entities/categories_items.dart';

abstract class BaseCategoriesItemsRepository{
  Future<List<CategoriesItems>> getCategoriesItems(int cateID);
}
