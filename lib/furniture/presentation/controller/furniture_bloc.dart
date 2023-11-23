import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/domain/entities/furniture.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_event.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_state.dart';
import '../../domain/usecase/categories_usecase.dart';
import '../../domain/usecase/recommended_usecase.dart';

class FurnitureBloc extends Bloc<FurnitureEvent , FurnitureState>{
  final BaseCategoriesUseCase baseCategoriesUseCase;
  final BaseRecommendedUseCase baseRecommendedUseCase;

  FurnitureBloc(this.baseCategoriesUseCase , this.baseRecommendedUseCase):super(const InitialState()){
    /// Categories
    List<Furniture> copyCategoriesData=[];
    on<CategoriesFurnitureEvent>((event, emit) async {
      final result = await baseCategoriesUseCase.execute();
      List<Furniture> updatedCategoriesData = List.from(state.categoriesData)..addAll(result);
      if(updatedCategoriesData != []){
        copyCategoriesData = updatedCategoriesData;
      }
      emit(CategoriesState(categoriesData: updatedCategoriesData));
    } );
    /// Recommended
    on<RecommendedFurnitureEvent>((event, emit) async {
      final result = await baseRecommendedUseCase.execute();
      List<Furniture> updateRecommendedData = List.from(state.recommendedData)..addAll(result);
      emit(RecommendedState(recommendedData: updateRecommendedData , copyCategoriesData: copyCategoriesData));
    });
  }
}
