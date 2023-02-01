import 'package:adu_app/getstorage/getx_storage.dart';
import 'package:adu_app/network/network_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Newsplesh extends GetxController{
   final NetworkController checknetwork = Get.find<NetworkController>();
  LocalPreference localpref = LocalPreference();
  get context => Get.context;
    @override
  void onInit() {
    //_navigation();
    debugPrint("splesh sereen");
    super.onInit();
  }
}