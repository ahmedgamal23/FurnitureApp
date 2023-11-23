import 'package:equatable/equatable.dart';

import '../../domain/entities/cart.dart';

abstract class CartState extends Equatable{
  final bool check;
  final List<Cart> cartList;
  final double totalPrice;
  const CartState({required this.check , required this.cartList , required this.totalPrice });

  @override
  List<Object?> get props => [];
}

class InitialState extends CartState{
  const InitialState({
    bool check=false,
    List<Cart> cartList=const [] ,
    double totalPrice=0.0
  }):super(check: check, cartList:cartList , totalPrice: totalPrice);
}

class AddToCartState extends CartState{
  const AddToCartState({
    bool check = false,
    List<Cart> cartList=const [],
    double totalPrice=0.0
  }):super(check: check,cartList:cartList , totalPrice: totalPrice);
}

class AllCartState extends CartState{
  const AllCartState({
    bool check = false,
    required List<Cart> cartList,
    required double totalPrice
  }):super(check: check,cartList:cartList,totalPrice: totalPrice);
}

class RemoveCartState extends CartState{
  const RemoveCartState({
    required bool check ,
    List<Cart> cartList=const [],
    double totalPrice=0.0,
  }):super(cartList: cartList , check: check,totalPrice: totalPrice);
}
