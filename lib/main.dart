import 'package:ecom_app/consts/consts.dart';
import 'package:ecom_app/views/splash_screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(apiKey: "AIzaSyAAn_E19ViHi_tKssqDVDkY1qG8egh14OI", appId: "1:352509668118:android:7978434314ca2f3beabe37", messagingSenderId: "352509668118", projectId: "e-mart-app-a4782")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //We are using getx so we have to change this MaterialApp into GetMaterialApp

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:const AppBarTheme(
            iconTheme: IconThemeData(color: darkFontGrey),
            elevation: 0.0,
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: SplashScreen(),
    );
  }
}
