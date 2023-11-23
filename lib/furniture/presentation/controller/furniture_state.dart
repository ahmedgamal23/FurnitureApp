import 'package:equatable/equatable.dart';
import '../../domain/entities/furniture.dart';

abstract class FurnitureState extends Equatable{
  final List<Furniture> categoriesData;
  final List<Furniture> recommendedData;

  const FurnitureState({required this.categoriesData ,required this.recommendedData});

  @override
  List<Object> get props =>[];
}

class InitialState extends FurnitureState{
  const InitialState({List<Furniture> categoriesData=const [],  List<Furniture> recommendedData=const [] }):super(
                            categoriesData: categoriesData , recommendedData: recommendedData);
}

class CategoriesState extends FurnitureState{
  const CategoriesState({required List<Furniture> categoriesData}):super(
                            categoriesData: categoriesData , recommendedData: const []);
}

class RecommendedState extends FurnitureState{
  const RecommendedState({required List<Furniture> recommendedData , required List<Furniture> copyCategoriesData}):super(
                                                          recommendedData: recommendedData , categoriesData: copyCategoriesData);
}

class ErrorState extends FurnitureState{
  final String error;
  const ErrorState(this.error, {required super.categoriesData, required super.recommendedData});
}


/*
class FurnitureState extends Equatable{
  final List<Furniture> categoriesData;
  final RequestState categoriesState;
  final String categoriesMessage;
  final List<Furniture> recommendedData;
  final RequestState recommendedState;
  final String recommendedMessage;

  const FurnitureState(
      {this.categoriesData=const [],
      this.categoriesState = RequestState.loading,
      this.categoriesMessage = "",
      this.recommendedData = const [],
      this.recommendedState = RequestState.loading,
      this.recommendedMessage=""});

  FurnitureState copyWith({
      List<Furniture>? categoriesData,
      RequestState? categoriesState,
      String? categoriesMessage,
      List<Furniture>? recommendedData,
      RequestState? recommendedState,
      String? recommendedMessage
    })
  {
    return FurnitureState(
      categoriesData: categoriesData??this.categoriesData,
      categoriesState: categoriesState??this.categoriesState,
      categoriesMessage: categoriesMessage??this.categoriesMessage,
      recommendedData: recommendedData??this.recommendedData,
      recommendedState: recommendedState??this.recommendedState,
      recommendedMessage: recommendedMessage??this.recommendedMessage
    );
  }


}

*/