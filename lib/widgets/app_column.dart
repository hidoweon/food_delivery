import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimensions.dart';
import 'big_texts.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {

  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height15),
        //comments
        Row(
          children: [
            Wrap(children: List.generate(5, (index) => Icon(Icons.star, color: Colors.blue, size: 15,))),
            SizedBox(width: 10,),
            SmallText(text: '4.5'),
            SizedBox(width: 10,),
            SmallText(text: '1257'),
            SizedBox(width: 10,),
            SmallText(text: 'Comments'),
          ],),
        SizedBox(height: Dimensions.height10*2),
        //time and distance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget(icon: Icons.circle, text: 'Normal', IconColor: Colors.yellow),
            SizedBox(width: 10),
            IconTextWidget(icon: Icons.location_on, text: '1.7km', IconColor: Colors.greenAccent),
            SizedBox(width: 10,),
            IconTextWidget(icon: Icons.access_time_rounded, text: '42min', IconColor: Colors.redAccent)
          ],
        )
      ],
    );
  }
}
