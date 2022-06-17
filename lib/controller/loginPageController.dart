import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logintest/view/loginCard.dart';

import '../constant/snackBare.dart';
import '../view/Home.dart';
import '../view/LoginPage.dart';
import '../view/forgetPassword.dart';
import '../view/regesterCard.dart';

class LoginPageController extends GetxController{

  bool isLogin = true;
  var formKey = GlobalKey<FormState>();

  void switcher(){
    isLogin = !isLogin;
    update();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void clickLogin(){
    if (formKey.currentState!.validate()){
      Login();
    }
  }  void clickReset(context){
    if (formKey.currentState!.validate()){
      resetPassword(context);
    }
  }
  //
  // void forgetPass(){
  //   currentStep++;
  //   update();
  // }
  // void registerback() {
  //     currentStep--;
  //     update();
  //
  // }

  Future resetPassword(context)async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://bennebosmarket.com/api/reset/password'));
    request.body = json.encode({
      "email": "${email.text}"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      showSnackBar(context,"ReSet success check your Email now");

      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }
  Future Login()async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://bennebosmarket.com/api/login'));
    request.body = json.encode({
      "email": "${email.text.trim()}",
      "password": "${password.text}"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.to(Home());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  changeIconVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    update();
  }

}