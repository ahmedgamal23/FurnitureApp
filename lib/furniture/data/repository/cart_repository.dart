import 'package:furniture_app/furniture/data/datasource/cart_datasource.dart';
import 'package:furniture_app/furniture/domain/entities/cart.dart';
import 'package:furniture_app/furniture/domain/repository/base_cart_repository.dart';

class CartRepository extends BaseCartRepository{
  final BaseCartDataSource baseCartDataSource;
  CartRepository(this.baseCartDataSource);

  @override
  Future<bool> setCartData(Cart cart) {
    return baseCartDataSource.setCartData(cart);
  }

  @override
  Future<List<Cart>> getCartData() {
    return baseCartDataSource.getCartData();
  }

  @override
  Future<bool> removeCartData(int cartId) {
    return baseCartDataSource.removeCartData(cartId);
  }
}
