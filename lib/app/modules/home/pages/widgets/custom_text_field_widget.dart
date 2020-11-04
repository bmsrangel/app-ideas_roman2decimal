import 'package:flutter/material.dart';

class CustomTextFieldWidget extends TextField {
  CustomTextFieldWidget({
    TextEditingController controller,
    String hintText,
    Color textColor,
  }) : super(
          controller: controller,
          cursorColor: textColor,
          decoration: InputDecoration(
            hintText: "Roman number",
            hintStyle: TextStyle(
              fontSize: 28.0,
            ),
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.characters,
          style: TextStyle(
            color: textColor,
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
          ),
        );
}
