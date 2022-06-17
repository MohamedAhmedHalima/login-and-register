import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logintest/view/LoginPage.dart';

import 'network/Api.dart';

void main() {
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
