import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/cart_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/cart_state.dart';
import '../../data/datasource/cart_datasource.dart';
import '../../data/repository/cart_repository.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repository/base_cart_repository.dart';
import '../../domain/usecase/cart_usecase.dart';
import '../controller/cart_event.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    BaseCartDataSource baseCartDataSource = CartDataSource();
    BaseCartRepository baseCartRepository = CartRepository(baseCartDataSource);
    BaseCartUseCase baseCartUseCase = CartUseCase(baseCartRepository);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ListView
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
              ),
              child: ListView.builder(
                itemCount: state.cartList.length,
                itemBuilder: (context, index) {
                  final cartItem = state.cartList[index];
                  return Dismissible(
                    key: ValueKey<Cart>(cartItem),
                    background: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      margin: const EdgeInsets.only(top: 15),
                      child: const Text(
                        "Cart Removed",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      CartBloc(baseCartUseCase).add(RemoveCartEvent(cartItem.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${cartItem.imageName} dismissed"),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: cartItems(context,cartItem.imagePath, cartItem.imageName, cartItem.price),
                  );
                },
              ),
            ),
            /// Payment
            InkWell(
              onTap: () {
                // TODO : Perform Payments: complete information
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                height: (MediaQuery.of(context).size.height * 0.2) - 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color(0xFF000088),
                    width: 5,
                  ),
                ),
                child: const Text(
                  //"total payments \$${state.totalPrice}",
                  "confirm payments",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Contain (Image, name, price)
  Widget cartItems(
      BuildContext context, String imagePath, String imageName, double price) {
    return Container(
      /// items
      width: MediaQuery.of(context).size.width,
      height: 120,
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        border: Border.all(),
      ),
      child: Row(
        children: [
          /// image
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          /// Column (name, price)
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 120,
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// name
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    imageName,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                /// price
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$$price",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

