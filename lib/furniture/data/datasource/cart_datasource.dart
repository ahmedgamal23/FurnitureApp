import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_app/authentication/presentation/controller/shared_preference_login.dart';
import 'package:furniture_app/furniture/domain/entities/cart.dart';

import '../model/cart_model.dart';

abstract class BaseCartDataSource{
  Future<bool> setCartData(Cart cart);
  Future<List<CartModel>> getCartData();
  Future<bool> removeCartData(int cartId);
}

class CartDataSource extends BaseCartDataSource{

  @override
  Future<bool> setCartData(Cart cart) async {
    // TODO: Call Cart Collection
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("cart");

    // TODO: Create Document for each user by document's id
    String documentUserId = await SharedPreferenceLogin().getCurrentUserId();
    final DocumentReference documentRef = collectionReference.doc(documentUserId);

    // TODO: Create collection (carts)
    final CollectionReference subCollectionReference = documentRef.collection("${documentUserId.substring(0 , documentUserId.length~/2 )}_");

    // TODO: Inside each document --> image , name , price
    Map<String , dynamic> data={"id":cart.id,"image":cart.imagePath , "name":cart.imageName , "price":cart.price};
    await subCollectionReference.doc("${cart.id}").set(data);

    // TODO: Return bool value
    return true;
  }

  @override
  Future<List<CartModel>> getCartData() async {
    // TODO: Get Current User ID from Shared preference
    String documentUserId = await SharedPreferenceLogin().getCurrentUserId();
    // TODO: call collection
    final CollectionReference subCollectionReference = FirebaseFirestore.instance.collection("cart").doc(documentUserId).collection(
                                                            "${documentUserId.substring(0 , documentUserId.length~/2 )}_");
    QuerySnapshot querySnapshot = await subCollectionReference.get();

    return List<CartModel>.from( querySnapshot.docs.map((e) => CartModel.fromJson( e.data() as Map<String , dynamic> )) );;
  }

  @override
  Future<bool> removeCartData(int cartId) async {
    // TODO: Get Current User ID from Shared preference
    String documentUserId = await SharedPreferenceLogin().getCurrentUserId();
    // TODO: call collection
    final CollectionReference subCollectionReference = FirebaseFirestore.instance.collection("cart").doc(documentUserId).collection(
                                                                      "${documentUserId.substring(0 , documentUserId.length~/2 )}_");
    await subCollectionReference.doc("$cartId").delete();
    return true;
  }

}
