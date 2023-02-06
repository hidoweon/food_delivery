import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  
  final IconData icon;
  final String text;
  final Color IconColor;
  
  
  const IconTextWidget({Key? key,
  required this.icon,
  required this.text,
  required this.IconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: IconColor, size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text)
      ],
    );
  }
}
