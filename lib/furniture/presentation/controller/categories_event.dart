import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable{
  const CategoriesEvent();

  @override
  List<Object> get props =>[];
}

class CategoriesItemsEvent extends CategoriesEvent{
  final int cateID;
  const CategoriesItemsEvent(this.cateID);
}

