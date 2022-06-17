
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    // width: 40.w,

    content: Text(
      text,
      style: TextStyle(color: Colors.white,),
    ),
    backgroundColor: Colors.black,
  ));
}
