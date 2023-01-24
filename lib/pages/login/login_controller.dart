import 'dart:io';

// import 'package:adu_app/pages/home/home_landing_screen.dart';
// import 'package:adu_app/services/repository/homerepository.dart';
import 'package:adu_app/pages/home/home_landing_screen.dart';
import 'package:adu_app/services/repository/homerepository.dart';
import 'package:adu_app/shared/my_preference.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Logincontroller extends GetxController {
   HomeRepository homerepo = HomeRepository();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final userid = TextEditingController();
  final activationcode = TextEditingController();
  var iosdeviceid;
  var androidid;
  var passwordVisible = false.obs;
  bool isLoading = false;
  get context => Get.context;

  @override
  onInit() {
    super.onInit();
    getId();
  }

   login() async{
    /* MyPreference.setCustomerLogin(true);
    print(MyPreference.isLoggedIn);
     Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DasboardScreen()),
          (Route<dynamic> route) => false); */
    // MyPreference.setCustomerLogin(true);

    
    isLoading = true;
    update();

    String response = await homerepo.checkloginuser(
        activationcode: activationcode.text,
        userid: userid.text,
        deviceid: androidid);

    if (response == "ok") {
      isLoading = false;
      update();
     MyPreference.setCustomerLogin(true);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const DasboardScreen()),
          (Route<dynamic> route) => false);
    } else {
       isLoading = false;
      update();
      erroraleart(response);

    }
  }

  getId() async {
    try {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      androidid = androidInfo.id;
      print('Running on ${androidInfo.id}');
      print('Running on ${androidid}');

      /*   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;    ---> ios
      print('Running on ${iosInfo.utsname.machine}'); */

    } catch (e) {
      print(e);
    }
  }

    erroraleart(String errormsg){

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(errormsg),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: <Widget>[
            // Alignment(, y)
            TextButton(
              child: const Text('0k'),
              onPressed: () {
                Get.back();
                //_navigation();
              },
            ),
          ],
        );
      },
    );
 
    }


}
