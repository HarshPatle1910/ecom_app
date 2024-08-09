import 'dart:io';

import 'package:ecom_app/consts/consts.dart';
import 'package:ecom_app/controllers/profile_controller.dart';
import 'package:ecom_app/widgets_common/bg_widget.dart';
import 'package:ecom_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../../../widgets_common/costum_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return BgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //if data image url and controller path is empty
                data['imageurl'] == '' && controller.profileImagePath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()

                    //if data is not empty but comtroller is empty
                    : data['imageurl'] != '' &&
                            controller.profileImagePath.isEmpty
                        ? Image.network(
                            data['imageurl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()

                        //if both are empty
                        : Image.file(
                            File(controller.profileImagePath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: redColor,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textColor: whiteColor,
                    title: "Change"),
                20.heightBox,
                costumTextField(
                    controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    ispass: false),
                costumTextField(
                    controller: controller.oldPassController,
                    hint: passwordHint,
                    title: oldPass,
                    ispass: true),
                costumTextField(
                    controller: controller.newPassController,
                    hint: passwordHint,
                    title: newPass,
                    ispass: true),
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 60,
                        child: ourButton(
                            onPress: () async {
                              controller.isLoading(true);

                              //if image is not set
                              if (controller.profileImagePath.value.isEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImageLink = data['imageurl'];
                              }

                              //if old password matches from database
                              if (data['password'] ==
                                  controller.oldPassController.text) {
                                await controller.changeAuthPassword(
                                    email: data['email'],
                                    password: controller.oldPassController,
                                    newPassword: controller.newPassController);

                                await controller.updateProfile(
                                    imgUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password:
                                        controller.newPassController.text);
                                VxToast.show(context, msg: "Updated");
                              } else {
                                VxToast.show(context,
                                    msg: "Old password is incorrect.");
                                controller.isLoading(false);
                              }
                            },
                            color: redColor,
                            textColor: whiteColor,
                            title: "Save"))
              ],
            )
                .box
                .shadowSm
                .white
                .padding(EdgeInsets.all(16))
                .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
