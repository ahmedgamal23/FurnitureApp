import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasource/cart_datasource.dart';
import '../../data/repository/cart_repository.dart';
import '../../domain/repository/base_cart_repository.dart';
import '../../domain/usecase/cart_usecase.dart';
import '../componant/cart_page_body.dart';
import '../controller/cart_bloc.dart';
import '../controller/cart_event.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    BaseCartDataSource baseCartDataSource = CartDataSource();
    BaseCartRepository baseCartRepository = CartRepository(baseCartDataSource);
    BaseCartUseCase baseCartUseCase = CartUseCase(baseCartRepository);
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context)=>CartBloc(baseCartUseCase)..add(GetAllCartEvent()),
        child: const CartPageBody()
      ),
    );
  }
}
