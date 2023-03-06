import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../widgets/big_texts.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;

  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(

                  //put in image
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URL +
                          product.img!))),
            ),
          ),
          Positioned(
              left: Dimensions.width10 * 2,
              right: Dimensions.width10 * 2,
              top: Dimensions.height5 * 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => MainFoodPage());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios_new)),

                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: Colors.blue,
                              )
                            : Container()
                      ],
                    );
                  })
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width10 * 2,
                  right: Dimensions.width10 * 2,
                  top: Dimensions.height10 * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius10 * 2),
                      topLeft: Radius.circular(Dimensions.radius10 * 2)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height10 * 4),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height10 * 4),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text: product.description!))),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomHeight,
            padding: EdgeInsets.only(
                top: Dimensions.height10 * 3,
                bottom: Dimensions.height10 * 3,
                left: Dimensions.width10 * 2,
                right: Dimensions.width10 * 2),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius10 * 4),
                    topRight: Radius.circular(Dimensions.radius10 * 4))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10 * 2,
                      bottom: Dimensions.height10 * 2,
                      left: Dimensions.width10 * 2,
                      right: Dimensions.width10 * 2),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius10 * 2),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                          )),
                      SizedBox(width: Dimensions.width10),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(width: Dimensions.width10),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10 * 2,
                        bottom: Dimensions.height10 * 2,
                        left: Dimensions.width10 * 2,
                        right: Dimensions.width10 * 2),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 * 2),
                        color: Colors.white),
                    child: BigText(text: "\$ ${product.price!}  | 장바구니 추가"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
