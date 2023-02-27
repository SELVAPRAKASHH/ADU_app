import 'package:adu_app/pages/register/register_controller.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
        centerTitle: false,
        backgroundColor: ColorConstants.hexToColor("#283375"),
        title: const Text(
          "Register",
          style: TextStyle(letterSpacing: 1),
        )
/*           Image.asset(
        'assets/images/appbar_logo.png',
        width: MediaQuery.of(context).size.width * 0.25,
        height: 35,
      ), */
        );
    return Scaffold(
        appBar: appBar,
        // body: Container(),
        body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (controller) {
            return controller.isLoading ? loading() : builddetails(controller);
          },
        ));
  }

  Widget loading() {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/flash_sc.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Please Wait...",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ))
    ]);
  }

  Widget builddetails(RegisterController controller) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/flash_sc.jpg',
          fit: BoxFit.cover,
        ),
      ),
      //  padding: const EdgeInsets.only(left:30.0,right: 10),
      SingleChildScrollView(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  // margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "First Name",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 0.5),
                  )),
              Container(
                  margin:
                      const EdgeInsets.only(left: 70, right: 20, bottom: 20),
                  child: TextField(
                      controller: controller.firstname,
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
                          )))),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  // margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Last Name",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 0.5),
                  )),
              Container(
                  margin:
                      const EdgeInsets.only(left: 70, right: 20, bottom: 20),
                  child: TextField(
                      controller: controller.lastname,
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
                          )))),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  // margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Email Address",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 0.5),
                  )),
              Container(
                  margin:
                      const EdgeInsets.only(left: 70, right: 20, bottom: 35),
                  child: TextField(
                      controller: controller.email,
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
                          )))),
              InkWell(
                onTap: () {
                  controller.loginvalitation();
                  /* controller.loginvalitation();
                  if (controller.valitationstatus.value == true) {
                    controller.login();
                  } */
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
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        fontSize: 16),
                  ),
                ),
              ),
              siginoption()
            ]),
      ))
    ]);
  }

  Widget siginoption() {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already Have An Account? ",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Text("Signi n",
                style: TextStyle(
                  color: Colors.blue.shade200,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                )),
          )
        ],
      ),
    );
  }
}
