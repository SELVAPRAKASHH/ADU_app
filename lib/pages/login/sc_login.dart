import 'package:adu_app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
final _formKey = GlobalKey<FormState>();
final controller = Get.put(Logincontroller());

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
      Center(
        child: Form(
           key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              /*  SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ), */
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                // margin: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: Text("Enter your user ID",style: TextStyle(color: Colors.white,fontSize: 14),)),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(fillColor: Colors.white),
                  )),
              /* 
              Container(
                margin:EdgeInsets.only(left: 50),
                // width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    // margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: useridfield(),
                  ),
            */
              Text("Enter your Activation code"),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'Check own personal sightings and log aircraft details',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
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
              )
              //Expanded(child: Text("button"))
            ],
          ),
        ),
      )
    ]));
  }
  
  useridfield() {
    return Obx(() => TextFormField(
          obscureText: controller.passwordVisible.value,
          controller: controller.userid,
          autofillHints: const [AutofillHints.password],
          onEditingComplete: () => TextInput.finishAutofillContext(),
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    controller.passwordVisible.value =
                        !controller.passwordVisible.value;
                  },
                  icon: Icon(
                    color: Colors.blue,
                    controller.passwordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  )),
              icon: const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              labelStyle: TextStyle(fontSize: 13),
              labelText: 'Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter username';
            }
            return null;
          },
        ));
  }

}
