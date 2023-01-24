import 'dart:convert';

import 'package:adu_app/services/api/api.dart';

import 'ResponseDispatcher.dart';

class HomeRepository {


   Services apiClient =Services();
  checkloginuser(
      {required String userid,
      required String activationcode,
      required dynamic deviceid}) async {
    try {
      ResponseDispatcher? responseDispatch =
          await apiClient.customerlogin(activationcode: activationcode, userid: userid ,deviceid: deviceid);
      if (responseDispatch != null && responseDispatch.status!) {
        String? msg = responseDispatch.message;
        var temp = (json.decode(msg!));
        // response = TrackListResponse.fromJson(temp);
        return "ok";
      } else {
        // response.message = responseDispatch!.message;
        // String? msg = responseDispatch.message;
        // var temp = (json.decode(msg!));
        // response = TrackListResponse.fromJson(temp!);
        // response.status = false;


        // return responseDispatch!.message;
        return "ok";
      }
    } catch (e) {
        print(e);
      // return response;
      // response.message = e.toString();
      // response.status = false;
      return "some wend wrong";
    }
  }
}
