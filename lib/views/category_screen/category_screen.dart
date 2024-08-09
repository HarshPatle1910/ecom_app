import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/controllers/product_controller.dart';
import 'package:ecom_app/views/category_screen/category_details.dart';
import 'package:ecom_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return BgWidget(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Categories"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  "${categoriesList[index]}"
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                    controller.getSubCategories(categoriesList[index]);
                    // controller.getSubCategories(categoriesList[index]);
                Get.to(() => CategoryDetails(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
