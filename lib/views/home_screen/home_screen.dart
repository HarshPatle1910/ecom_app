import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/views/home_screen/components/featured_button.dart';
import 'package:ecom_app/widgets_common/home_buttons.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchAnything,
                    hintStyle: TextStyle(color: textfieldGrey),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //Swiper Brands
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 140,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            slidersList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButton(
                              height: context.screenHeight * 0.12,
                              width: context.screenWidth / 2.5,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todayDeal : flashSale)),
                    ),

                    10.heightBox,
                    //Swiper Brands
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 140,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secondSlidersList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButton(
                              height: context.screenHeight * 0.12,
                              width: context.screenWidth / 3.6,
                              icon: index == 0
                                  ? icTopCategories
                                  : index == 1
                                      ? icBrands
                                      : icTopSeller,
                              title: index == 0
                                  ? topCategories
                                  : index == 1
                                      ? brand
                                      : topSellers)),
                    ),
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text
                            .color(darkFontGrey)
                            .size(18)
                            .fontFamily(semibold)
                            .make()),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featureButton(
                                        icon: featuredImages1[index],
                                        title: featuredTitles1[index]),
                                    10.heightBox,
                                    featureButton(
                                        icon: featuredImages2[index],
                                        title: featuredTitles2[index]),
                                  ],
                                )).toList(),
                      ),
                    ),
                    //featured products
                    20.heightBox,
                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          .margin(EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .padding(EdgeInsets.all(8))
                                          .make()),
                            ),
                          ),
                        ],
                      ),
                    ),

                    10.heightBox,
                    //Third Swiper
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 140,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secondSlidersList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    20.heightBox,
                    //"More Products".text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP5,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
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
                              .padding(EdgeInsets.all(12))
                              .make();
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
