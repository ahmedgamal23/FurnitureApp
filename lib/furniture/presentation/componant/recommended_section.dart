import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/furniture_state.dart';
import 'package:furniture_app/furniture/presentation/screen/details_page.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnitureBloc , FurnitureState>(
      buildWhen: (previous, current)=> previous != current,
      builder: (context , state){
        return Container(
          margin: const EdgeInsets.only(left: 10 , right: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height/2 - 50,
          child: GridView.builder(
            itemCount: state.recommendedData.length,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 ,crossAxisSpacing: 10,
                mainAxisSpacing: 20,mainAxisExtent: 250),
            itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  // TODO: Go To Details Page
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return DetailsPage(
                            id:state.recommendedData[index].recommendedId , imagePath: state.recommendedData[index].recommendedImage,
                            imageName: state.recommendedData[index].recommendedName, price: state.recommendedData[index].recommendedPrice,);}));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // TODO:change static data
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage(state.recommendedData[index].recommendedImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(state.recommendedData[index].recommendedName ,textAlign: TextAlign.center
                        , style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,),),
                      Text("${state.recommendedData[index].recommendedPrice}" , style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w500,),),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
