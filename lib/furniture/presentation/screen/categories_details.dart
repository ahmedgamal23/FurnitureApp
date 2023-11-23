import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/data/datasource/categories_items_datasource.dart';
import 'package:furniture_app/furniture/data/repository/categories_items_repository.dart';
import 'package:furniture_app/furniture/domain/repository/base_categories_items_repository.dart';
import 'package:furniture_app/furniture/domain/usecase/categories_items_usecase.dart';
import 'package:furniture_app/furniture/presentation/controller/categories_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/categories_event.dart';
import '../componant/categories_details_body.dart';

class CategoriesDetails extends StatelessWidget {
  final int index;
  const CategoriesDetails({super.key , required this.index});

  @override
  Widget build(BuildContext context) {
    BaseCategoriesItemsDataSource baseCategoriesItemsDataSource = CategoriesItemsDataSource();
    BaseCategoriesItemsRepository baseCategoriesItemsRepository = CategoriesItemsRepository(baseCategoriesItemsDataSource);
    BaseCategoriesItemsUseCase baseCategoriesItemsUseCase = CategoriesItemsUseCase(baseCategoriesItemsRepository);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context)=>CategoriesBloc(baseCategoriesItemsUseCase)..add(CategoriesItemsEvent(index)),
          child: CategoriesDetailsBody(index:index)
        ),
      ),
    );
  }
}
