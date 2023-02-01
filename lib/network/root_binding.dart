import 'package:adu_app/network/network_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class NetworkBinding extends Bindings{
  @override
  void dependencies() {
   debugPrint("network binding");
    Get.lazyPut<NetworkController>(() => NetworkController());
  }

}