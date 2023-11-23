import 'package:equatable/equatable.dart';

abstract class FurnitureEvent extends Equatable{
  const FurnitureEvent();

  @override
  List<Object> get props => [];
}

class CategoriesFurnitureEvent extends FurnitureEvent{}
class RecommendedFurnitureEvent extends FurnitureEvent{}
