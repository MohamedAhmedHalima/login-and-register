import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/AppValidator.dart';
import '../constant/textField.dart';
import '../controller/loginPageController.dart';

class forgetPassword extends StatelessWidget {
  forgetPassword({Key? key}) : super(key: key);
  LoginPageController controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: controller.formKey,
      child: Container(
        height:  hight*.55,
        width: width/2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  Text(
                "You will receive a message on your account",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .75,
                  child: GetBuilder<LoginPageController>(
                    builder:(controller)=>  buildTextField(
                        inputType: TextInputType.emailAddress,
                        validation:(value)=>
                            AppValidator.validatorEmail(value!, context),
                        icon: Icons.email_outlined,
                        hintText: "email",
                        isPassword: false,
                        isEmail: true,
                        Textcontroller: controller.email),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      controller.clickReset(context);
                    //  controller.ReSendVreFication(context);
                    },
                    child: Text("Request")),
                SizedBox(
                  height: 30,
                ),

              ],
            ),
          ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: width / 4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange, elevation: 2),
                      onPressed: () {
                       controller.switcher();

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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
