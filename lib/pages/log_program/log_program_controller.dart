import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LogProgramController extends GetxController {
  var isloading = false;
  TextEditingController placecontroller = TextEditingController();

  TextEditingController airfieldcontroller = TextEditingController();

  TextEditingController registernum = TextEditingController();

  RxBool valitationstatus = false.obs;

  get context => Get.context;

  RxString currentSelectedairfieldtatus = "Please Select".obs;
  RxString currentSelectedairfieldPos = "0".obs;

  selectairfield() {}

  validation() {
    if (placecontroller.text.isEmpty) {
      showtoast("Please enter the Place");
      valitationstatus.value = false;
    } else if (currentSelectedairfieldPos.value == "0") {
      showtoast("Please select Airfield");
      valitationstatus.value = false;
    } else {
      valitationstatus.value = true;
    }
  }

  saveloges() {}

  showtoast(String msg) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(
        message: msg,
      ),
    );
  }
}
