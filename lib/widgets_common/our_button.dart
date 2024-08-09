import 'package:ecom_app/consts/consts.dart';
import 'package:get/get.dart';

//
// Widget ourButton( onPress, color, textColor,String? title){
//   return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: EdgeInsets.all(12)
//       ),
//       onPressed: onPress,
//       child: title!.text.color(textColor).fontFamily(bold).make()
//   );
// }
Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: EdgeInsets.all(12)),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
