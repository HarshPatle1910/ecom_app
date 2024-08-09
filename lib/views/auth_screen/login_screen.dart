import 'package:ecom_app/consts/consts.dart';
import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/controllers/auth_controllers.dart';
import 'package:ecom_app/views/auth_screen/signup_screen.dart';
import 'package:ecom_app/views/home_screen/home.dart';
import 'package:ecom_app/widgets_common/applogo_widgets.dart';
import 'package:ecom_app/widgets_common/bg_widget.dart';
import 'package:ecom_app/widgets_common/costum_textfield.dart';
import 'package:ecom_app/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(16).make(),
            20.heightBox,
            Obx(
                ()=> Column(
                children: [
                  costumTextField(title: mail, hint: mailHint,ispass: false,controller: controller.emailController),
                  costumTextField(title: password, hint: passwordHint,ispass: true, controller: controller.passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetpassword.text.make())),
                  5.heightBox,
                  controller.isloading.value ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ) : ourButton(
                          onPress: () async{
                            controller.isloading(true);

                            await controller.loginMethod(context: context).then((value){
                              if (value != null){
                                VxToast.show(context, msg: loggedIn);
                                Get.offAll(()=>const Home());
                              }else{
                                controller.isloading(false);
                              }
                            });
                          },
                          color: redColor,
                          textColor: whiteColor,
                          title: login)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                          onPress: () {
                            Get.to(() => const SignUpScreen());
                          },
                          color: lightGrey,
                          textColor: redColor,
                          title: signup)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  loginwith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(
                                  socialListIcon[index],
                                  width: 25,
                                ),
                              ),
                            )),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadow
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
