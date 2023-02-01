import 'package:adu_app/pages/settings/settings_controller.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.hexToColor("#283375"),
        title: const Text(
          "SETTINGS",
          style: TextStyle(letterSpacing: 0.5,fontSize: 18),
        ),
      ),
      body: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) {
          return controller.isloading ? loading() : settingsoptions();
        },
      ),
    );
  }

  Widget settingsoptions() {
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
        child: SingleChildScrollView(
          child: Column(
            children: [appinfo(), userinfo(), syncinfo(), logo()],
          ),
        ),
      )
    ]);
  }
 
  Widget logo() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      // color: Colors.amber,
      alignment: Alignment.topRight,
      child: Image.asset(
        'assets/images/ava.png',
        //fit: BoxFit.cover,
        height:100,
        width: 100,
      ),
    );
  }


  Widget syncinfo() {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: (){
            debugPrint("click syncinfo");
          },
          child: Card(
              margin: const EdgeInsets.only(top: 50, left: 40, right: 40),
              color: Colors.black,
              child: Column(children: const [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Sync Info",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        // color: ColorConstants.hexToColor("#231885")
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.change_circle_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Last Sync",
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("26/01/2023" " | " "10:35:00",
                      style: TextStyle(
                        fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                )
              ])),
        ));
  }

  Widget userinfo() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.only(top: 50, left: 40, right: 40),
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "User Info",
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    // color: ColorConstants.hexToColor("#231885")
                    color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          // Get.to(() => Settings());
                        },
                        child: appinfocontant(
                            "Activate Date",
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            "10/05/2021")),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          // Get.to(() => Settings());
                        },
                        child: appinfocontant(
                            "Expire Date",
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            "20/10/2023")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appinfo() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.only(top: 50, left: 40, right: 40),
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "App Info",
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    // color: ColorConstants.hexToColor("#231885")
                    color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          // Get.to(() => Settings());
                        },
                        child: appinfocontant(
                            "User Manual",
                            const Icon(
                              Icons.menu_book_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            "")),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          // Get.to(() => Settings());
                        },
                        child: appinfocontant(
                            "Version : 2.0.6",
                            const Icon(
                              Icons.phone_iphone_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            "")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appinfocontant(String text, Icon icon, String textdate) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          /*  Icon(
            // Icons.menu_book_outlined,
            // Icons.phone_iphone_rounded,
            // Icons.calendar_month_outlined,
            Icons.change_circle_outlined,
            color: Colors.white,
            size: 40,
          ), */
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(text,
                style: const TextStyle(
                  fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
          Text(textdate,
              style: const TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.white))
        ],
      ),
    );
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
}
