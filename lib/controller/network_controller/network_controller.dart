import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class NetworkController extends GetxController{
   //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;

  //Connectivity use the plugein ..check net work connection
   final Connectivity _connectivity = Connectivity();

     late StreamSubscription _streamSubscription;

     @override
  void onInit() {
    super.onInit();
    getConnectivityType();
  }


  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
        print(e);
    }
    return _updateState(connectivityResult);
  }

   _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;

        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        break;
      default:
      showToast("Failed to get connection type");
        // showSnackBar(title: 'Error', message: 'Failed to get connection type');
        break;
    }
  }
    void showToast(String msg) {  
    Fluttertoast.showToast(
        msg: 'This is toast notification',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        timeInSecForIosWeb: 1,  
        backgroundColor: Colors.red,  
        textColor: Colors.yellow  
    );  
  }  
}