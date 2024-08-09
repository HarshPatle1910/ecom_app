import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var isloading = false.obs;

  //Text Controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //Login Method
  Future<UserCredential?> loginMethod({context})async{
    UserCredential? userCredintial;

    try {
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    }on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredintial;
  }

  //Sign in Method
  Future<UserCredential?> signupMethod({email,password,context})async{
    UserCredential? userCredintial;

    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredintial;
  }

  //Storing data method
  storeUserData({name,password,email}) async {
    DocumentReference store = await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set(
        {'name':name,'password':password,'email':email,'imageurl':'', 'id': currentUser!.uid, 'cart_count':'00', 'wishlist_count':'00', 'order_count':'00', }
    );
  }

  //Sign out method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    }on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}