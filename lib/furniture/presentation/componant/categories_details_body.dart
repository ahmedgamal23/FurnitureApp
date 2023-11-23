import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/categories_state.dart';
import '../controller/categories_bloc.dart';

class CategoriesDetailsBody extends StatelessWidget {
  final int index;
  const CategoriesDetailsBody({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc,CategoriesState>(
      builder: (context , state){
        return state.items.isNotEmpty?Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context , index){
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    /// image
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white60,
                          image: DecorationImage(
                              image: NetworkImage(state.items[index].image),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    /// name
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        state.items[index].name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    /// price
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "\$${state.items[index].price}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ):const Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child:CircularProgressIndicator(),
          ),
        );
      },
    );
  }

}
