import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/controllers/auth_controllers.dart';
import 'package:ecom_app/controllers/profile_controller.dart';
import 'package:ecom_app/services/firestore_services.dart';
import 'package:ecom_app/views/Profile_screen/components/details_cart.dart';
import 'package:ecom_app/views/Profile_screen/components/edit_profile_screen.dart';
import 'package:ecom_app/views/auth_screen/login_screen.dart';
import 'package:ecom_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return BgWidget(
        child: Scaffold(
      body:StreamBuilder(stream: FirestoreServices.getUser(currentUser!.uid), builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),
          );
        }
        else{
          var data = snapshot.data!.docs[0];

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit,
                        color: whiteColor,
                      )).onTap(() {
                    Get.to(()=>EditProfileScreen(data: data,));

                    controller.nameController.text = data['name'];
                    //controller.passController.text = data['password'];
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      data['imageurl']=='' ?
                      Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make() :
                      Image.network(
                        data['imageurl'],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.widthBox,
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}".text.fontFamily(semibold).white.make(),
                              //5.heightBox,
                              "${data['email']}".text.white.make()
                            ],
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: whiteColor)),
                          onPressed: () {
                            Get.put(AuthController()).signoutMethod(context);
                            Get.offAll(()=>const LoginScreen());
                          },
                          child: logout.text.white.fontFamily(semibold).make())
                    ],
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCard(
                        count: "${data['cart_count']}",
                        title: "In your cart",
                        width: context.screenWidth / 3.3),
                    detailsCard(
                        count: "${data['wishlist_count']}",
                        title: "In your wishlist",
                        width: context.screenWidth / 3.3),
                    detailsCard(
                        count: "${data['order_count']}",
                        title: "Your orders",
                        width: context.screenWidth / 3.3),
                  ],
                ),
                //Button Section
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonIcon[index],
                          width: 24,
                        ),
                        title: profileButtonList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonList.length)
                    .box
                    .white
                    .margin(EdgeInsets.all(12))
                    .padding(EdgeInsets.symmetric(horizontal: 16))
                    .shadowSm
                    .rounded
                    .make()
                    .box
                    .color(redColor)
                    .make(),
              ],
            ),
          );
        }
      })
    ));
  }
}
