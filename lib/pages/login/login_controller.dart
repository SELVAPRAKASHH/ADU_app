import 'dart:ffi';
import 'package:adu_app/shared/my_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Logincontroller extends GetxController{
  // final box = GetStorage();
final userid =TextEditingController();
final activationcode =TextEditingController();

var passwordVisible = false.obs;


 @override
  void onInit() {
    super.onInit();
  }

  selectlogin()async{
      MyPreference.setCustomerLogin(true);
     // box.write("login", true);
  }
}