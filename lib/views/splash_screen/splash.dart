import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/consts.dart';
import 'package:ecom_app/views/auth_screen/login_screen.dart';
import 'package:ecom_app/views/home_screen/home.dart';
import 'package:ecom_app/widgets_common/applogo_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    //Creating Method to change screen
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => LoginScreen());
      auth.authStateChanges().listen((User? user){
        if (user==null && mounted){
          Get.to(()=> const LoginScreen());
        }
        else{
          Get.to(()=> const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  icSplashBg,
                  width: 300,
                )),
            //SizedBox(height: 20,),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            Text(
              appname,
              style: TextStyle(
                  fontFamily: bold, fontSize: 34, color: Colors.white),
            ),
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            HeightBox(30)
          ],
        ),
      ),
    );
  }
}
