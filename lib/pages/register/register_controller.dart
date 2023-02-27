import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterController extends GetxController {
  bool isLoading = false;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  RxBool valitationstatus = false.obs;
  get context => Get.context;


  loginvalitation() {
    if (firstname.text.isEmpty) {
      showtoast("Please enter your FirstName");
    } else if (lastname.text.isEmpty) {
      showtoast("Please enter your LastName ");
    } else if (email.text.isEmpty) {
       showtoast("Please enter your Email Address");
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
}
