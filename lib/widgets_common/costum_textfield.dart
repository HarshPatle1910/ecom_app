import 'package:ecom_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget costumTextField({String? title, String? hint,controller,ispass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: ispass,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
            isDense: true,
            fillColor: lightGrey,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: redColor,
            ))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
