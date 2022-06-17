import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logintest/constant/AppValidator.dart';
import 'package:logintest/controller/loginPageController.dart';
import 'package:logintest/controller/registerController.dart';

import '../constant/textButton.dart';
import '../constant/textField.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        color: Colors.white,
        elevation: 2,
        child: Container(
            // decoration: ,
            height: hight * .60,
            width: width / 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<Registercontroller>(
                    init: Registercontroller(),
                    builder: (controller) => controller
                        .registerCardList[controller.registercurrentStep],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<Registercontroller>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.registercurrentStep == 2
                            ? Container()
                            : Container(
                                width: width / 4,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.orange, elevation: 2),
                                  onPressed: () {
                                    controller.registerback();
                                    //  Get.back();
                                    // Respond to button press
                                  },
                                  child: Row(
                                    children: [
                                      Text('Back'),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(Icons.arrow_back_ios_outlined)
                                    ],
                                  ),
                                ),
                              ),
                        Container(
                          width: width / 4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange, elevation: 2),
                            onPressed: () async {
                              await controller.registernextStep(context);
                            },
                            child: Row(
                              children: [
                                Text(controller.registercurrentStep == 2
                                    ? 'login'
                                    : 'next'),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(Icons.arrow_forward_ios_outlined)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Registercontroller controller = Get.put(Registercontroller());


    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              GetBuilder<Registercontroller>(
                builder: (controller) => Stack(
                  children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: controller.photo != null
                              ? Image.file(controller.photo!)
                              : Image.asset('assets/images/person.gif'),
                        )),
                    Positioned(
                      right: -10,
                      bottom: -10,
                      child: IconButton(
                        icon: Icon(
                          Icons.image,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          controller.pickeImage();
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildTextField(
                  validation:(value)=>
                      AppValidator.validatorTexteEnglish(value!, context),
                  icon: Icons.lock_outline,
                  hintText: "name",
                  isPassword: false,
                  isEmail: true,
                  Textcontroller: controller.name),
              SizedBox(
                height: 10,
              ),
              buildTextField(
                inputType: TextInputType.emailAddress,
                  validation:(value)=>
                      AppValidator.validatorEmail(value!, context),
                  icon: Icons.email_outlined,
                  hintText: "email",
                  isPassword: false,
                  isEmail: true,
                  Textcontroller: controller.email),
              SizedBox(
                height: 10,
              ),
              GetBuilder<Registercontroller>(
                builder: (controller)=> buildTextField(

                    validation:(value)=>
                        AppValidator.validatorPassword(value!, context),
                    hintText: "password",
                    icon: Icons.lock_outline,
                    isPassword: controller.isPassword,
                    onIconTap: ()=>controller.changeIconVisibility(),
                    sufixIcon: controller.suffix,
                    isEmail: false,
                    Textcontroller: controller.password),
              ),
              SizedBox(
                height: 10,
              ),

              GetBuilder<Registercontroller>(
                builder: (controller)=> buildTextField(
                    validation:(value)=>
                        AppValidator.validatorPassword_confirmation(value!, context,controller.password.text,controller.password_confirmation.text),
                    hintText: "confirm password",
                    icon: Icons.lock_outline,
                    isPassword: controller.isPassword,
                    onIconTap: ()=>controller.changeIconVisibility(),
                    sufixIcon: controller.suffix,                    isEmail: false,
                    Textcontroller: controller.password_confirmation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class confirm extends StatelessWidget {
  confirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Registercontroller controller = Get.put(Registercontroller());
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "check your email to complete registeration",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * .75,
              child: GetBuilder<Registercontroller>(
                builder:(controller)=> buildTextField(
                  max: 4,
                    isEmail: false,
                    isPassword: controller.isPassword,
                    onIconTap: ()=>controller.changeIconVisibility(),
                    sufixIcon: controller.suffix,
                    inputType: TextInputType.number,
                    validation:(value){
                      if (value == null || value.isEmpty) {
                        return  'Empty';
                      }else if(value.length <4 ){
                        return  'must 4 char';
                      }
                    } ,
                    fontSize: 20,
                    hintText: "verification code",
                    icon: Icons.vpn_key,
                    Textcontroller: controller.verification_code),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  controller.ReSendVreFication(context);
                },
                child: Text("Resend"))
          ],
        ),
      ),
    );
  }
}

Widget congratulation() => Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "congratulations",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Icon(Icons.celebration, size: 50),
        SizedBox(
          height: 10,
        ),
      ],
    ));
