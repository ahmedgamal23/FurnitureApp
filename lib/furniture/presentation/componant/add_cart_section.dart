import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/data/datasource/cart_datasource.dart';
import 'package:furniture_app/furniture/data/repository/cart_repository.dart';
import 'package:furniture_app/furniture/domain/entities/cart.dart';
import 'package:furniture_app/furniture/domain/repository/base_cart_repository.dart';
import 'package:furniture_app/furniture/domain/usecase/cart_usecase.dart';
import 'package:furniture_app/furniture/presentation/controller/cart_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/cart_event.dart';
import '../controller/cart_state.dart';

class AddCartSection extends StatelessWidget {
  final int id;
  final String imageName;
  final String imagePath;
  final double price;
  const AddCartSection({super.key, required this.id, required this.imageName, required this.imagePath, required this.price});

  @override
  Widget build(BuildContext context) {
    BaseCartDataSource baseCartDataSource = CartDataSource();
    BaseCartRepository baseCartRepository = CartRepository(baseCartDataSource);
    BaseCartUseCase baseCartUseCase = CartUseCase(baseCartRepository);
    return BlocProvider(
      create:(context){
        return CartBloc(baseCartUseCase);
      },
      child: SizedBox(
        width:MediaQuery.of(context).size.width,
        child: Column(
          children: [
            /// button add to cart
            BlocBuilder<CartBloc , CartState>(
              builder: (context , state){
                return InkWell(
                  onTap: (){
                    // TODO: Add to cart button (ADD EVENT)
                    CartBloc(baseCartUseCase).add( AddToCartEvent(Cart(id: id, imagePath: imagePath, imageName: imageName, price: price)) );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width-100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:const Color.fromRGBO(0, 0, 100, 0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 25 , color: Colors.white,),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
