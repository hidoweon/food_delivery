
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../widgets/big_texts.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height10*7,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height5, bottom: Dimensions.height10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius10*2),
                      topLeft: Radius.circular(Dimensions.radius10*2)),
                  color: Colors.white
                ),
                child: Center(child: BigText(text: product.name!, size: Dimensions.font26,)),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: Dimensions.height10*30,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2),
                  child: ExpandableTextWidget(text: product.description!)
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width10*5, right: Dimensions.width10*5,
              top: Dimensions.height10, bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: Colors.blue,),
                BigText(text: "\$ ${product.price!} X 0", color: Colors.blue,),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: Colors.blue,),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeight,
            padding: EdgeInsets.only(top: Dimensions.height10*3, bottom: Dimensions.height10*3, left: Dimensions.width10*2, right: Dimensions.width10*2),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius10*4),
                    topRight: Radius.circular(Dimensions.radius10*4)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height10*2, bottom: Dimensions.height10*2, left: Dimensions.width10*2, right: Dimensions.width10*2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius10*2),
                      color: Colors.white
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height10*2, bottom: Dimensions.height10*2, left: Dimensions.width10*2, right: Dimensions.width10*2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius10*2),
                      color: Colors.white
                  ),
                  child: BigText(text: '\$ ${product.price!} | 장바구니 추가',),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
