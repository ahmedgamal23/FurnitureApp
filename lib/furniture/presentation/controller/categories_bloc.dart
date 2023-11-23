import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/domain/entities/categories_items.dart';
import 'package:furniture_app/furniture/domain/usecase/categories_items_usecase.dart';
import 'package:furniture_app/furniture/presentation/controller/categories_event.dart';
import 'package:furniture_app/furniture/presentation/controller/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent , CategoriesState>{
  final BaseCategoriesItemsUseCase baseCategoriesItemsUseCase;
  CategoriesBloc(this.baseCategoriesItemsUseCase):super(const CategoriesItemsState()){
    /// -------
    on<CategoriesItemsEvent>((event, emit)async{
      final result = await baseCategoriesItemsUseCase.execute(event.cateID);
      List<CategoriesItems> updateCategories = List.from(state.items)..addAll(result);
      emit(CategoriesItemsState(items: updateCategories));
    });
  }

}




