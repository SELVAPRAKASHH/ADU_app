import 'package:adu_app/getstorage/getx_storage.dart';
import 'package:adu_app/pages/home/home_landing_screen.dart';
import 'package:adu_app/network/network_controller.dart';
// import 'package:adu_app/pages/home/home_landing_screen.dart';
import 'package:adu_app/pages/login/sc_landing.dart';
import 'package:adu_app/shared/my_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController {
  final NetworkController checknetwork = Get.find<NetworkController>();
  LocalPreference localpref = LocalPreference();
  get context => Get.context;
  // final box = GetStorage();
  @override
  void onInit() {
    _navigation();
    super.onInit();
  }

  Future _navigation() async {
    debugPrint(checknetwork.connectionType.value.toString());
    await Future.delayed(const Duration(milliseconds: 2500), () {
      if (checknetwork.connectionType.value != 0) {
        debugPrint(MyPreference.isLoggedIn.toString());
        if (MyPreference.isLoggedIn) {
          debugPrint("login sddsgsfgs");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const DasboardScreen()),
              (Route<dynamic> route) => false);
        } else {
          //Get.to(() => const LoginScreen());
          debugPrint("no login fgsfgsgs");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>const LandingScreeen()),
              (Route<dynamic> route) => false);
        }
      } else {
        _networkconnectionaleart();
      }
    });
  }

  _networkconnectionaleart() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Something went wrong! Please try again.'),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.start,
          actions: <Widget>[
            // Alignment(, y)
            TextButton(
              child: const Text('RETRY'),
              onPressed: () {
                Get.back();
                _navigation();
              },
            ),
          ],
        );
      },
    );
  }
}
