import 'package:equatable/equatable.dart';
import 'package:furniture_app/furniture/domain/entities/categories_items.dart';

abstract class CategoriesState extends Equatable{
  final List<CategoriesItems> items;
  const CategoriesState({required this.items});

  @override
  List<Object> get props =>[];
}

class CategoriesItemsState extends CategoriesState{
  const CategoriesItemsState({final List<CategoriesItems> items=const []}):super(items: items);
}
