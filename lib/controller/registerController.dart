import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logintest/network/Api.dart';
import 'package:http/http.dart' as http;

import '../constant/snackBare.dart';
import '../modle/registerModel.dart';
import '../view/regesterCard.dart';
import 'loginPageController.dart';

class Registercontroller extends GetxController {
  int registercurrentStep = 0;
  var formKey = GlobalKey<FormState>();
  List registerCardList = [register(), confirm(), congratulation()];

  Future registernextStep(context) async {
    if (formKey.currentState!.validate()) {
      if(photo!=null) {
        [regesterstep, confirmcodestep, sucssesstep][registercurrentStep]();
      }else{
        showSnackBar(context,"Image Required");
      }
    }
  }

  void regesterstep() {
    registerFun();
  }

  void confirmcodestep() {
    vrefication();
  }

  void sucssesstep() {
    Get.back();
    update();
  }

  void registerback() {
    if (registercurrentStep > 0) {
      registercurrentStep--;
      update();
    } else {
      Get.back();
      update();
    }
  }

  File? photo;
  Future pickeImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      photo = File(image.path);
      update();
    } on PlatformException catch (e) {
      print("Picke image Error $e");
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  int ? user_id;

  var headers = {'Accept': 'application/json'};

  Future registerFun() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://bennebosmarket.com/api/register'));

    request.fields.addAll({
      "name": name.text,
      "email": email.text,
      "password": password.text,
      "password_confirmation": password_confirmation.text,
    });

    request.files
        .add(await http.MultipartFile.fromPath('avatar', "${photo!.path}"));
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (streamedResponse.statusCode == 200) {
          final result = jsonDecode(response.body) as Map<String, dynamic>;
         user_id = result['data']["id"];
          print(result['data']["id"]);

          registercurrentStep++;
      update();
    } else {
      print(response.reasonPhrase);
    }
  }

  TextEditingController verification_code = TextEditingController();

  Future vrefication() async {
    var url = Uri.parse('https://bennebosmarket.com/api/verify');
    var response = await http.post(url,
        body: { "user_id": "${user_id}", "verification_code":"${verification_code}"});
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      registercurrentStep++;
      update();
    } else {
      print(response.reasonPhrase);
    }
  }
  Future ReSendVreFication( context)async{
    var url = Uri.parse('https://bennebosmarket.com/api/resendVerification');
    var response = await http.post(url, body: { "user_id": "${user_id}"});
    print(response.body);

    if (response.statusCode == 200) {
      showSnackBar(context,"ReSend success check your Email now");

      print(response.body);
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
