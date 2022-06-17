import 'package:flutter/material.dart';
import 'package:logintest/view/regesterCard.dart';

class AppValidator {
  static String? validatorEmail(String value, BuildContext context) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  static String? validatorTexteEnglish(String value, BuildContext context) {
    const String pattern = r'^[A-Z a-z]+$';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'enter Text English';
    } else if (value == null || value.isEmpty) {
      return 'required';
    }
    return null;
  }

  static String? validatorPassword(String value, BuildContext context) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-5])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regex = new RegExp(pattern.toString());
    print(value);
    if (value.isEmpty) {
      return "Empty";
    } else {
      if (!regex.hasMatch(value))
        return "in valid password";
      else
        return null;
    }
  }

  static String? validatorPassword_confirmation(
      String value, BuildContext context, String pass, String confirm) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-5])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regex = new RegExp(pattern.toString());
    if (pass != confirm) {
      return "not Matched";
    } else if (value.isEmpty) {
      return "Empty";
    } else if (!regex.hasMatch(value)) {
      return "not valid password";
    }
  }
}
