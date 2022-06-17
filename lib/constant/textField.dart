import 'package:flutter/material.dart';

Widget buildTextField(
    {IconData? icon,
    String ?hintText,
      final TextInputType? inputType,
      final IconData? sufixIcon,
      final Function()? onIconTap,
      required bool isPassword,
      final int? max,

      required bool isEmail,
       String? Function(String?)? validation,
      final TextEditingController? Textcontroller,
    double ?fontSize}) {
  return TextFormField(
    maxLength: max,
    validator: validation,
    controller:Textcontroller ,
    obscureText: isPassword,
    keyboardType: inputType ,
    decoration: InputDecoration(

      suffixIcon: IconButton(
        onPressed: onIconTap,
        icon: Icon(sufixIcon),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      prefixIcon: Icon(
        icon,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding: EdgeInsets.all(10),
      // hintText: hintText,
      labelText: hintText,

    ),
    style: TextStyle(fontSize: fontSize ==null?15: fontSize),
  );
}
