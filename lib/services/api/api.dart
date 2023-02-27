import 'dart:convert';

import 'package:adu_app/services/repository/ResponseDispatcher.dart';
import 'package:http/http.dart';

class Services {
  Client client = Client();
  late Duration delay;
  Services([this.delay = const Duration(milliseconds: 3000)]);

  Future<ResponseDispatcher?> customerlogin(
      {required String userid,
      required String activationcode,
      required dynamic deviceid}) async {
    ResponseDispatcher responseModel = ResponseDispatcher();
    final body = {
      "licenseid": 2,
      "userid": 1,
      "deviceid": "67890deviceid123456",
      "activationkey": "qwerty"
    };
    final jsonString = json.encode(body);
    // print(nhsNumber);
    try {
      var response = await client.post(
        Uri.parse('http://dev.erdster.co.in/ADUChatBot/api/CreateSessionWeb'),
        headers: {
          "Accept": "application/json",
          //"Content-Type": "application/json"
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: jsonEncode(<String, String>{
          "userid": 3.toString(),
          "activation key": "xyzzy"
        }),
      );
      if (response.statusCode == 200) {
        responseModel.status = true;
        responseModel.message = response.body;
        return responseModel;
      } else {
        responseModel.status = false;
        responseModel.message = response.body;
        return responseModel;
      }
    } catch (e) {
      print(e);
      responseModel.status = false;
      responseModel.message = "Some went worng";
      return responseModel;
    }
  }
}
