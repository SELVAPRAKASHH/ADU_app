
import 'package:adu_app/shared/my_preference.dart';

class Utils{
  static void setLogout() async {
    MyPreference.setCustomerLogin(false);
  }
}