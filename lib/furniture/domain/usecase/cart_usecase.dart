import 'package:furniture_app/furniture/domain/repository/base_cart_repository.dart';
import '../entities/cart.dart';

abstract class BaseCartUseCase{
  Future<bool> execute(Cart cart);
  Future<List<Cart>> executeCart();
  Future<bool> executeRemoveCart(int cartId);
}

class CartUseCase extends BaseCartUseCase{
  final BaseCartRepository baseCartRepository;
  CartUseCase(this.baseCartRepository);

  @override
  Future<bool> execute(Cart cart) async {
    return await baseCartRepository.setCartData(cart);
  }

  @override
  Future<List<Cart>> executeCart() async{
    return await baseCartRepository.getCartData();
  }

  @override
  Future<bool> executeRemoveCart(int cartId) async{
    return await baseCartRepository.removeCartData(cartId);
  }
}
