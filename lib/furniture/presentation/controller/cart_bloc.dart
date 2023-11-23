import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/presentation/controller/cart_event.dart';
import 'package:furniture_app/furniture/presentation/controller/cart_state.dart';
import '../../domain/entities/cart.dart';
import '../../domain/usecase/cart_usecase.dart';

class CartBloc extends Bloc<CartEvent , CartState>{
  final BaseCartUseCase baseCartUseCase;
  CartBloc(this.baseCartUseCase):super(const InitialState()){
    /// Add
    on<AddToCartEvent>((event, emit) async {
      final result = await baseCartUseCase.execute(event.cart);
      state.props.insert(0, result);
      emit(AddToCartState(check: result));
    });
    /// get carts
    on<GetAllCartEvent>((event, emit)async{
      final result = await baseCartUseCase.executeCart();
      List<Cart> updateCartData = List.from(state.cartList)..addAll(result);
      emit(AllCartState(cartList: updateCartData, totalPrice: calculateTotalPrice(updateCartData)));
      /// .............
      /// state.cartList : [CartModel(), CartModel(), CartModel()]
      /// for each CartModel() contain : data
      /// .............
    });
    /// remove cart
    on<RemoveCartEvent>((event, emit) async {
      final result = await baseCartUseCase.executeRemoveCart(event.id);
      state.props.add(result);
      emit(RemoveCartState(check: result));
    });

  }

  // calculate total price
  double calculateTotalPrice(List<Cart> cartsData){
    double total=0.0;
    for(int i=0;i<cartsData.length;i++) {
      total = total + cartsData[i].price;
    }
    return total;
  }

}
