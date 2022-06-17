import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logintest/controller/loginPageController.dart';
import 'package:logintest/view/registerPage.dart';

import '../constant/AppValidator.dart';
import '../constant/textButton.dart';
import '../constant/textField.dart';
class LoginCard extends StatelessWidget {
   LoginCard({Key? key}) : super(key: key);
  LoginPageController controller =Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {

    var hight =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Form(
      key: controller.formKey,
      child: Container(
        // decoration: ,
          height:  hight*.55,
          width: width/2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),

                Text("Login" ,style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),

                SizedBox(height: 20,),
            buildTextField(
                inputType: TextInputType.emailAddress,
                validation:(value)=>
                    AppValidator.validatorEmail(value!, context),
                icon: Icons.email_outlined,
                hintText: "email",
                isPassword: false,
                isEmail: true,
                Textcontroller: controller.email),
                SizedBox(height: 15,),
                GetBuilder<LoginPageController>(
                  builder: (controller)=> buildTextField(

                      validation:(value)=> AppValidator.validatorPassword(value!, context),
                      hintText: "password",
                      icon: Icons.lock_outline,
                      isPassword: controller.isPassword,
                      onIconTap: ()=>controller.changeIconVisibility(),
                      sufixIcon: controller.suffix,
                      isEmail: false,
                      Textcontroller: controller.password),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      controller.switcher();
                    },child: Text("Forget Password?" ,style: TextStyle(color: Colors.orange),),),
                  ],
                ),
                Container(
                  width: width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Background color
                    ),
                    onPressed: () {
                      controller.clickLogin();
                      // Respond to button press
                    },
                    child: Text('Login',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton(Icons.facebook,
                        "Facebook",Color(0xFF3B5999)),
                    buildTextButton(FontAwesomeIcons.google,
                        "Google", Color(0xFFDE4B39)),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have acount ?" ,style: TextStyle(color: Colors.orange ,fontSize: 13)),
                    Container(
                        height: 40,
                        child: TextButton(onPressed: (){
                          Get.to(registerPage());
                        },child: Text("Sign uP" ,style: TextStyle(color: Colors.orange,fontSize: 15),),))
                  ],
                ),

              ],
            ),
          )
      ),
    );
  }
}
