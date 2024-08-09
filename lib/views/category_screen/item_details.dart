import 'package:ecom_app/consts/consts.dart';
import 'package:ecom_app/consts/consts.dart%20';
import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/controllers/product_controller.dart';
import 'package:ecom_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: data['p_imgs'].length,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      itemBuilder: (context, index) {
                        return Image.network(
                          data['p_imgs'][index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  VxRating(
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 24,
                    maxRating: 5,
                    isSelectable: false,
                  ),
                  10.heightBox,
                  "${data['p_price']}".numCurrency
                      .text
                      .color(redColor)
                      .fontFamily(bold)
                      .size(26)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['p_seller']}".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In house Brands"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .size(16)
                                .make(),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(60)
                      .color(textfieldGrey)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .make(),
                  20.heightBox,
                  //Color Section
                  Obx(()=> Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  data['p_colors'].length,
                                  (index) => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Color(data['p_colors'][index]).withOpacity(1.0))
                                          .margin(EdgeInsets.symmetric(horizontal: 4))
                                          .make().onTap((){
                                            controller.changeColorIndex(index);
                                      }),
                                      Visibility(
                                          visible: index == controller.colorIndex.value,
                                          child: Icon(Icons.done_outlined,color: Colors.white,))
                                    ],
                                  )),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(12)).make(),

                        //Quantity Row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Obx(()=>
                                Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.decreaseQuantity();
                                        controller.calculateTotalPrice(int.parse(data['p_price']));
                                      }, icon: Icon(Icons.remove)),
                                  controller.quantity.value
                                      .text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                      onPressed: () {
                                        controller.increaseQuantity(
                                          int.parse(data['p_quantity'])
                                        );
                                        controller.calculateTotalPrice(int.parse(data['p_price']));
                                      }, icon: Icon(Icons.add)),
                                  10.widthBox,
                                  "(${data['p_quantity']} available)".text.color(textfieldGrey).make()
                                ],
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(12)).make(),

                        //total price row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total price: "
                                  .text
                                  .color(textfieldGrey)
                                  .make(),
                            ),
                            Row(
                              children: [
                                "${controller.totalPrice.value}".numCurrency
                                    .text
                                    .size(16)
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .make(),
                              ],
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(12)).make(),
                      ],
                    ).box.shadowSm.white.make(),
                  ),
                  10.heightBox,
                  //Description section
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "${data['p_desc']}"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  //10.heightBox,
                  //Button Swctions
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        itemDetailButtonList.length,
                        (index) => ListTile(
                              title: itemDetailButtonList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              trailing: Icon(Icons.arrow_forward),
                            )),
                  ),
                  10.heightBox,
                  //Product may like section
                  productsYouMayLike.text
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .size(16)
                      .make(),
                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP1,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "Laptop 4GB/64GB"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  10.heightBox,
                                  "\$100"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                ],
                              )
                                  .box
                                  .roundedSM
                                  .white
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .padding(EdgeInsets.all(8))
                                  .make()),
                    ),
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to cart",
              ),
            ),
          )
        ],
      ),
    );
  }
}
