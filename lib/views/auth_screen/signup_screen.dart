import 'package:ecom_app/consts/consts.dart';
import 'package:ecom_app/controllers/auth_controllers.dart';
import 'package:ecom_app/views/home_screen/home.dart';
import 'package:get/get.dart';
import '../../widgets_common/applogo_widgets.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/costum_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //TextEditing Controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

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
            "Join the $appname".text.fontFamily(bold).white.size(16).make(),
            20.heightBox,
            Column(
              children: [
                costumTextField(title: name, hint: nameHint, controller: nameController,ispass: false),
                costumTextField(title: mail, hint: mailHint, controller: emailController,ispass: false),
                costumTextField(title: password, hint: passwordHint, controller: passwordController,ispass: true),
                costumTextField(title: confirmPassword, hint: passwordHint, controller: passwordRetypeController,ispass: true),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpassword.text.make())),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (newvalue) {
                        setState(() {
                          isCheck = newvalue;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: termsAndCondition,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: privacy,
                            style: TextStyle(
                                fontFamily: regular, color: redColor)),
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                controller.isloading.value ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ) : ourButton(
                        onPress: () async {
                          if (isCheck!=false){
                            controller.isloading(true);
                            try{
                              await controller.signupMethod(context: context,email: emailController.text,password: passwordController.text).then((value){
                                return controller.storeUserData(
                                  email: emailController.text,password: passwordController.text,name: nameController.text
                                );
                              }).then((value){
                                VxToast.show(context, msg: loggedIn);
                                Get.offAll(()=>Home());
                              });
                            }catch(e){
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              controller.isloading(false);
                            }
                          }
                        },
                        color: isCheck == true ? redColor : lightGrey,
                        textColor: whiteColor,
                        title: signup)
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                5.heightBox,
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: alreadyHaveAnAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey)),
                    TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor)),
                  ]),
                ).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadow
                .make(),
          ],
        ),
      ),
    ));
  }
}
