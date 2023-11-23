import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/authentication/presentation/screens/login_screen.dart';
import 'package:furniture_app/core/utils/variables.dart';
import 'package:furniture_app/furniture/data/datasource/furniture_datasource.dart';
import 'package:furniture_app/furniture/data/repository/furniture_repository.dart';
import 'package:furniture_app/furniture/domain/repository/base_repository_furniture.dart';
import 'package:furniture_app/furniture/domain/usecase/categories_usecase.dart';
import 'package:furniture_app/furniture/domain/usecase/recommended_usecase.dart';
import 'package:furniture_app/furniture/presentation/componant/recommended_section.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_event.dart';
import 'package:furniture_app/furniture/presentation/screen/cart_page.dart';

import 'categories_section.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseCategoriesDataSource baseCategoriesDataSource = CategoriesDataSource();
    final BaseRecommendedDataSource baseRecommendedDataSource = RecommendedDataSource();
    final BaseRepositoryFurniture baseRepositoryFurniture = FurnitureRepository(baseCategoriesDataSource, baseRecommendedDataSource);
    final BaseCategoriesUseCase baseCategoriesUseCase=CategoriesUseCase(baseRepositoryFurniture);
    final BaseRecommendedUseCase baseRecommendedUseCase = RecommendedUseCase(baseRepositoryFurniture);
    return BlocProvider(
      create: (context)=>FurnitureBloc(baseCategoriesUseCase, baseRecommendedUseCase)
                          ..add(CategoriesFurnitureEvent())..add(RecommendedFurnitureEvent()),
      child: Column(
        children: [
          /// header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){
                  // TODO: click on Exit button
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen()));
                },
                icon: const Icon(Icons.exit_to_app , color: Variables.menuColor, size: 30,),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        // TODO: click on scan button
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CartPage()));
                      },
                      icon: const Icon(Icons.shopping_cart , color: Variables.menuColor, size: 30,),
                    ),
                    const Text(
                      "Cart",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700 , ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          /// title: Browse by categories
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10,top: 20, bottom: 20,),
            child: const Text(
              "Browse by categories",
              style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 20 ,),
            ),
          ),
          /// Categories section
          const CategoriesSection(),
          /// title: Recommended for you
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10,top: 20, bottom: 20,),
            child: const Text(
              "Recommended for you",
              style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 19 ,),
            ),
          ),
          /// Recommended For You Section
          const RecommendedSection(),
        ],
      ),
    );
  }
}
