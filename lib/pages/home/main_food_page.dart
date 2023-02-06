import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_texts.dart';
import 'package:food_delivery/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height5*9, bottom: Dimensions.height5*3),
              padding: EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'South Korea', color: Colors.blue,),
                      Row(
                        children: [
                          SmallText(text: 'Seoul', color: Colors.black, size: 18,),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width5*9,
                      height: Dimensions.height5*9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius5*3),
                          color: Colors.blue
                      ),
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ))
        ],
      ),
    );
  }
}
