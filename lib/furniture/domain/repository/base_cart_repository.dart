import 'package:furniture_app/furniture/domain/entities/cart.dart';

abstract class BaseCartRepository{
  Future<bool> setCartData(Cart cart);
  Future<List<Cart>> getCartData();
  Future<bool> removeCartData(int cartId);
}
