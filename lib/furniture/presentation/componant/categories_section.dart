import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_state.dart';
import 'package:furniture_app/furniture/presentation/screen/categories_details.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnitureBloc , FurnitureState>(
      buildWhen: (previous, current)=> previous != current,
      builder: (context , state ){
        return SizedBox(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            itemCount: state.categoriesData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              switch(state.categoriesData[index].categoryImage){
                case "":
                  return const SizedBox(width: 200,height: 150 ,child: Center(child: CircularProgressIndicator() ,),);
                default:
                  return InkWell(
                    onTap: (){
                      // TODO: click on category send index for each category to show it.
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesDetails(index: index)));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 10,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // TODO:change static data
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: AssetImage(state.categoriesData[index].categoryImage), //assets/images/Categories/ArmChair.jpg
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(state.categoriesData[index].categoryName , style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,),), //ArmChair
                          Text("${state.categoriesData[index].categoryCount}" , style: const TextStyle(fontSize: 12,),), //100+ products
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
        );
      },
    );
  }
}
