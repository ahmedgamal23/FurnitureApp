import 'package:equatable/equatable.dart';
import 'package:furniture_app/furniture/domain/entities/cart.dart';

abstract class CartEvent extends Equatable{
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent{
  final Cart cart;
  const AddToCartEvent(this.cart);
}

class GetAllCartEvent extends CartEvent{}

class RemoveCartEvent extends CartEvent{
  final int id;
  const RemoveCartEvent(this.id);
}
