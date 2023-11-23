import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/categories_items_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class BaseCategoriesItemsDataSource{
  Future<List<CategoriesItemsModel>> getCategoriesItems(int cateID);
}

class CategoriesItemsDataSource extends BaseCategoriesItemsDataSource{
  @override
  Future<List<CategoriesItemsModel>> getCategoriesItems(int cateID) async{
    List<Map<String , dynamic>> result = await readDataFromFirebase(cateID);
    // TODO: get all images
    List<String> imgList = await readImageFromStorage(cateID);
    // TODO: add image in data return from firebase
    for(int i=0;i<result.length;i++)
    {
      result[i]["image"]=imgList[i];
    }
    return List<CategoriesItemsModel>.from( result.map((e) => CategoriesItemsModel.fromJson(e) ) );
  }

  Future<List<Map<String, dynamic>>> readDataFromFirebase(int cateID) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
          .instance.collection("categories")
          .doc(cateID.toString())
          .collection("subItems").get();
      List<Map<String, dynamic>> documents = [];

      if(querySnapshot.docs.isNotEmpty)
      {
        for (var documentSnapshot in querySnapshot.docs) {
          if(documentSnapshot.exists){
            documents.add(documentSnapshot.data());
          }
        }
        return documents;
      }else{
        // error
        return [{"ERROR":"error in firebase"}];
      }
    }catch(e){
      // Error
      return [{"ERROR":e.toString()}];
    }
  }

  Future<List<String>> readImageFromStorage(int cateID) async{
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref("/categories/$cateID/");
    ListResult listResult = await reference.listAll();
    List<String> imageUrls = [];

    for(Reference ref in listResult.items){
      String downloadURL=await ref.getDownloadURL();
      imageUrls.add(downloadURL);
    }

    return imageUrls;
  }
  
}
