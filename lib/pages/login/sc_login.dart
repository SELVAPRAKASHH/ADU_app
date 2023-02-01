import 'package:adu_app/pages/login/login_controller.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();
// final controller = Get.put(Logincontroller());

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Logincontroller>(
        init: Logincontroller(),
        builder: (controller) {
          return Scaffold(
              body: Stack(children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.blue,
                child: Image.asset(
                  'assets/images/flash_sc.jpg',
                  fit: BoxFit.cover,
                )),
            controller.isLoading == false
                ? buildlogin(controller)
                : buildLoadingText()
          ]));
        });
  }

  buildLoadingText() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Please wait ...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 0.4,
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: "Montserrat-Medium")),
        ],
      ),
    );
  }

  buildlogin(Logincontroller controller) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'AUD',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ), //Text
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  // margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Enter your user ID",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 0.5),
                  )),

              Container(
                  margin: const EdgeInsets.only(left: 70, right: 20),
                  child: 
                  
                  TextFormField(
                      controller: controller.userid,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter User ID";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ))
                          )),

              Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.5,
                  // margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Enter your Activation code",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 0.5),
                  )),

              Container(
                  margin: const EdgeInsets.only(left: 70, right: 20),
                  child: TextFormField(
                      controller: controller.activationcode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Activation code";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          errorStyle: TextStyle(color: Colors.white),
                          errorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          )))),

              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),

              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    controller.login();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorConstants.hexToColor("#283375"),
                  ),
                  height: MediaQuery.of(context).size.height / 17,
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        fontSize: 16),
                  ),
                ),
              )
              //Expanded(child: Text("button"))
            ],
          ),
        ),
      ),
    );
  }
}
