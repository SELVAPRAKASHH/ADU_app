import 'package:adu_app/pages/login/sc_login.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../network/network_controller.dart';

class LandingScreeen extends StatefulWidget {
  const LandingScreeen({Key? key}) : super(key: key);
  @override
  State<LandingScreeen> createState() => _LandingScreeenState();
}

final NetworkController checknetwork = Get.find<NetworkController>();

class _LandingScreeenState extends State<LandingScreeen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        body: Stack(children: [
      SizedBox(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.blue,
          child: Image.asset(
            'assets/images/flash_sc.jpg',
            fit: BoxFit.cover,
          )),
      SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(height: MediaQuery.of(context).size.height/10,),
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
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'Check own personal sightings and log aircraft details',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              InkWell(
                onTap: (){
                  Get.to(() => const LoginScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                     color: ColorConstants.hexToColor("#283375"),
                  ),
                  height: MediaQuery.of(context).size.height / 17,
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: const Text(
                    "GET STARTED",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        fontSize: 16),
                  ),
                ),
              )
              //Expanded(child: Text("button"))
            ],
          ),
        ),
      )
    ]));
  }
}
