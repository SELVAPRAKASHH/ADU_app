import 'package:adu_app/controller/network_controller/network_controller.dart';
import 'package:get/get.dart';
class NetworkBinding extends Bindings{
  @override
  void dependencies() {
   print("network binding");
    Get.lazyPut<NetworkController>(() => NetworkController());
  }

}