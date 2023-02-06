import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../widgets/big_texts.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
                    "assets/image/food.png"
                  )
                )

              ),
            ),
          ),
          Positioned(
              left: Dimensions.width10*2,
              right: Dimensions.width10*2,
              top: Dimensions.height5*9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>MainFoodPage());
                    },
                      child: AppIcon(icon: Icons.arrow_back_ios_new)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize-20,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2, top: Dimensions.height10*2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius10*2),
                    topLeft: Radius.circular(Dimensions.radius10*2)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: '연남어부'),
                    SizedBox(height: Dimensions.height10*4),
                    BigText(text: "소개"),
                    SizedBox(height: Dimensions.height10*4),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "사회적 특수계급의 제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 모든 국민은 법 앞에 평등하다. 누구든지 성별·종교 또는 사회적 신분에 의하여 정치적·경제적·사회적·문화적 생활의 모든 영역에 있어서 차별을 받지 아니한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 군인 또는 군무원이 아닌 국민은 대한민국의 영역안에서는 중대한 군사상 기밀·초병·초소·유독음식물공급·포로·군용물에 관한 죄중 법률이 정한 경우와 비상계엄이 선포된 경우를 제외하고는 군사법원의 재판을 받지 아니한다. 사회적 특수계급의 제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 모든 국민은 법 앞에 평등하다. 누구든지 성별·종교 또는 사회적 신분에 의하여 정치적·경제적·사회적·문화적 생활의 모든 영역에 있어서 차별을 받지 아니한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 군인 또는 군무원이 아닌 국민은 대한민국의 영역안에서는 중대한 군사상 기밀·초병·초소·유독음식물공급·포로·군용물에 관한 죄중 법률이 정한 경우와 비상계엄이 선포된 경우를 제외하고는 군사법원의 재판을 받지 아니한다. 사회적 특수계급의 제도는 인정되지 아니하며, 어떠한 형태로도 이를 창설할 수 없다. 모든 국민은 법 앞에 평등하다. 누구든지 성별·종교 또는 사회적 신분에 의하여 정치적·경제적·사회적·문화적 생활의 모든 영역에 있어서 차별을 받지 아니한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 군인 또는 군무원이 아닌 국민은 대한민국의 영역안에서는 중대한 군사상 기밀·초병·초소·유독음식물공급·포로·군용물에 관한 죄중 법률이 정한 경우와 비상계엄이 선포된 경우를 제외하고는 군사법원의 재판을 받지 아니한다."))),

                  ],
                ),
              ),)

        ],
      ),
      
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(Icons.remove,),
                  SizedBox(width: Dimensions.width10),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10),
                  Icon(Icons.add)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height10*2, bottom: Dimensions.height10*2, left: Dimensions.width10*2, right: Dimensions.width10*2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10*2),
                color: Colors.white
              ),
              child: BigText(text: '12,000원 | 장바구니 추가',),
            )
          ],
        ),
      ),
    );
  }
}
