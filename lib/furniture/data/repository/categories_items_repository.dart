import 'package:furniture_app/furniture/data/datasource/categories_items_datasource.dart';
import 'package:furniture_app/furniture/domain/entities/categories_items.dart';
import 'package:furniture_app/furniture/domain/repository/base_categories_items_repository.dart';

class CategoriesItemsRepository extends BaseCategoriesItemsRepository{
  final BaseCategoriesItemsDataSource baseCategoriesItemsDataSource;

  CategoriesItemsRepository(this.baseCategoriesItemsDataSource);

  @override
  Future<List<CategoriesItems>> getCategoriesItems(int cateID) async{
    return await baseCategoriesItemsDataSource.getCategoriesItems(cateID);
  }

}
