// import 'package:adu_app/pages/home/home_landing_screen.dart';
// import 'package:adu_app/services/repository/homerepository.dart';
import 'package:adu_app/pages/home/home_landing_screen.dart';
import 'package:adu_app/services/repository/homerepository.dart';
import 'package:adu_app/shared/my_preference.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

  RxBool valitationstatus = false.obs;

  @override
  onInit() {
    super.onInit();
    getId();
  }

  loginvalitation() {
    if (userid.text.isEmpty) {
      showtoast("Please enter the UserId");
    } else if (activationcode.text.isEmpty) {
      showtoast("Please enter Activation code");
    } else {
      valitationstatus.value = true;
    }
  }

  showtoast(String msg) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(
        message: msg,
      ),
    );
  }

  login() async {
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

    if (response == "ook") {
      isLoading = false;
      update();
      /* MyPreference.setCustomerLogin(true);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const DasboardScreen()),
          (Route<dynamic> route) => false); */
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
      debugPrint('Running on ${androidInfo.id}');
      debugPrint('Running on ${androidid}');

      /*   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;    ---> ios
      print('Running on ${iosInfo.utsname.machine}'); */

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  erroraleart(String errormsg) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
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
