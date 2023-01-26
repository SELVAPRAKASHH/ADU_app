import 'package:adu_app/pages/home/home_controller.dart';
import 'package:adu_app/pages/home/user_options.dart';
import 'package:adu_app/pages/settings/sc_settings.dart';
import 'package:adu_app/services/repository/homerepository.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DasboardScreen extends StatefulWidget {
  const DasboardScreen({super.key});

  @override
  State<DasboardScreen> createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      centerTitle: false,
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: ColorConstants.hexToColor("#283375"),
      title: Image.asset(
        'assets/images/appbar_logo.png',
        width: MediaQuery.of(context).size.width * 0.25,
        height: 35,
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.language,
            size: 35,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
          child: CircleAvatar(
            child: Image.asset(
              'assets/images/profile_logo.png',
              fit: BoxFit.fill, //fill type of image inside aspectRatio
            ),
          ),
        ),
      ],
    );
    return Scaffold(
        appBar: appBar,
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.isloading ? loading() : builddetails();
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

  Widget builddetails() {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/flash_sc.jpg',
          fit: BoxFit.cover,
        ),
      ),
      SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 45),
                child: InkWell(
                  onTap: () {
                Get.to(() =>  const Settings());
                    
                  },
                  child: const SizedBox(
                    // height: MediaQuery.of(context).size.height/12,
                    child: Text(
                      "DASHBOARD",
                      style: TextStyle(
                          fontSize: 20, color: Colors.white, letterSpacing: 2,fontWeight:FontWeight.bold),
                    ),
                  ),
                ),
              ),
              builddetailscard(),
               const UserOptions(),
              logo()
            ],
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

  Widget builddetailscard() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: MediaQuery.of(context).size.height / 7,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: ColorConstants.hexToColor("#f0e70c"),
            ),
          ),
          userdetails()
        ],
      ),
    );
  }

  Widget userdetails() {
    return Row(children: [userinformation(), totalloges()]);
  }

  Widget totalloges() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "18",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.hexToColor("#283375")),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text("Total Logs",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
        // color: Colors.black,
      ),
    );
  }

  Widget userinformation() {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 5),
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.width * 0.24,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Denver Potts",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "#418 ,4th cross, sale, Cheshire",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "M33 7 SH, Englent",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
