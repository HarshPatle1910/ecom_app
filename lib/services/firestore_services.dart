import 'package:ecom_app/consts/consts.dart%20';

class FirestoreServices{
  //Getting users data
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }

  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }
}