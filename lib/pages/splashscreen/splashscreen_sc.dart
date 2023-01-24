import 'package:adu_app/network/network_controller.dart';
import 'package:adu_app/pages/splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  final NetworkController checknetwork = Get.find<NetworkController>();
  Splashscreen({Key? key}) : super(key: key);
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

// final controller = Get.put(SplashController());

class _SplashscreenState extends State<Splashscreen> {
  /*  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));// to re-show bars
  } */

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SplashController());
    return GetBuilder<Splashcontroller>(
      init: Splashcontroller(),
      builder: (controller) {
        return Scaffold(
            body: 
            
            
            Stack(children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.blue,
              child: Image.asset(
                'assets/images/flash_sc.jpg',
                fit: BoxFit.cover,
              )),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'AUD',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ), //Text
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                ),
              ],
            ),
          )
        ]));
      },
    );
  }
}
