import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class OnlineSearchController extends GetxController {
  var isloading = false;
  TextEditingController keyword = TextEditingController();

  TextEditingController airfieldcontroller = TextEditingController();
  RxString regcode = "".obs;
  RxString selecttype = "".obs;

  get context => Get.context;
  // TextEditingController

  selectairfield() {}

  validation(String type, String typepos, String registercode,
      String registercodepos) {
    if (keyword.text.isEmpty) {
      showtoast("Please enter the Keyword");
    } else if (typepos == '0') {
      showtoast("Please select the Reg/code");
    } else if (registercodepos == '0') {
      showtoast("Please select the Type");
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
}
