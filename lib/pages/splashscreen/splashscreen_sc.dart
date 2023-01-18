

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Splashscreen_controller.dart';
class Splashscreen extends StatefulWidget {

   final controller = Get.put(SplashController());

   Splashscreen({Key? key}) : super(key: key);
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return const SafeArea(
      child:  Scaffold(
        body: Center(child: Text("Splashscreen")),
      ),
    );
    });

  }
}