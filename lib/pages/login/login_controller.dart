import 'dart:io';

import 'package:adu_app/services/repository/homerepository.dart';
import 'package:adu_app/shared/my_preference.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Logincontroller extends GetxController {
  HomeRepository homerepo = HomeRepository();
  final userid = TextEditingController();
  final activationcode = TextEditingController();
  var iosdeviceid;
  var androidid;
  var passwordVisible = false.obs;

  @override
   onInit()  {
    super.onInit();
    getId();
  }

  login() async {
    // MyPreference.setCustomerLogin(true);

    var response = await homerepo.checkloginuser(
        activationcode: activationcode.text, userid: userid.text);
  }

  getId() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;

        /*  deviceName = build.model;
        deviceVersion = build.version.toString(); */

        //  identifier = build.androidId;  //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        /* deviceName = data.name;
        deviceVersion = data.systemVersion; */
        iosdeviceid = data.identifierForVendor;
      }
    } catch (e) {
      print(e);
    }

    /* var deviceInfo = DeviceInfoPlugin();
 /*  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else */ 
  if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  } */
  }
}
