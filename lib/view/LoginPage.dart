import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logintest/controller/loginPageController.dart';

import '../constant/AppValidator.dart';
import '../constant/textButton.dart';
import '../constant/textField.dart';
import 'forgetPassword.dart';
import 'loginCard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var hight =MediaQuery.of(context).size.height;
   var width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: hight /3,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              //  color: Color(0xFF3b5999).withOpacity(.85),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.deepOrange.shade400],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              //color: Colors.deepOrange,
              child: SafeArea(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Bennebos Market",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          children: []),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "new season trend is waiting for you ....",
                          style: TextStyle(
                              fontSize: 18,
                              // letterSpacing: 2,
                              color: Colors.white),
                          children: []),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: hight/4,
            right: 20,
            left:20,
            child: Card(
              shape:  RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              color:Colors.white,
              elevation: 2,
              child: GetBuilder<LoginPageController>(
                init: LoginPageController(),
                builder: (controller) => controller.isLogin?LoginCard():forgetPassword(),
              ),

            ),
          ),
        ],
      ),
    );
  }
}

