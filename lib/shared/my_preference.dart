import 'package:get_storage/get_storage.dart';

class MyPreference {


  static String loggedIn = 'IsLoggedIn';
 

  static final box = GetStorage();
  static void setCustomerLogin(bool islogged) => box.write(loggedIn, islogged);
  static bool get isLoggedIn => box.read(loggedIn) ?? false;
  
}
