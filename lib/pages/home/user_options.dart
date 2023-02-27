import 'package:adu_app/pages/contact_us/sc_contact.dart';
import 'package:adu_app/pages/log_program/sc_log_program.dart';
import 'package:adu_app/pages/online_search/sc_online_search.dart';
import 'package:adu_app/pages/settings/sc_settings.dart';
import 'package:adu_app/pages/splashscreen/splashscreen_sc.dart';
import 'package:adu_app/shared/utilits.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:adu_app/utils/right_root.dart';
import 'package:flutter/material.dart';

class UserOptions extends StatefulWidget {
  const UserOptions({super.key});

  @override
  State<UserOptions> createState() => _UserOptionsState();
}

class _UserOptionsState extends State<UserOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 6,
          //  width: MediaQuery.of(context).size.width ,
          // color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Utils.setLogout();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Splashscreen()),
                        (Route<dynamic> route) => false);
                    // Get.to(() => Settings());
                    /* Navigator.push(
                          context, SlideRightRoute(page: LogProgram())); */
                    //  Navigator.push(
                    // context, SlideRightRoute(page: const LogProgram()));
                  },
                  child: card(
                      top: 30,
                      bottom: 0,
                      right: 12,
                      left: 20,
                      text: "Log Program",
                      image: Image.asset(
                        'assets/images/log_program.png',
                        //fit: BoxFit.cover,
                        height: 50,
                        width: 40,
                      ),
                      space: 4),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    // Get.to(() => Settings());OnlineSearch
                    Navigator.push(
                        context, SlideRightRoute(page: const OnlineSearch()));
                  },
                  child: card(
                      top: 30,
                      bottom: 0,
                      right: 20,
                      left: 13,
                      text: "Online Search",
                      image: Image.asset(
                        'assets/images/online_search.png',
                        //fit: BoxFit.cover,
                        height: 50,
                        width: 40,
                      ),
                      space: 6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    // Get.to(() => Settings());
                  },
                  child: card(
                      top: 30,
                      bottom: 0,
                      right: 12,
                      left: 20,
                      text: "View Logs",
                      image: Image.asset(
                        'assets/images/view_log.png',
                        height: 50,
                        width: 40,
                      ),
                      space: 12),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    // Get.to(() => Settings());
                  },
                  child: card(
                      top: 30,
                      bottom: 0,
                      right: 20,
                      left: 13,
                      text: "View Aircrafts",
                      image: Image.asset(
                        'assets/images/view_aircraft.png',
                        //fit: BoxFit.cover,
                        height: 50,
                        width: 40,
                      ),
                      space: 4),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context, SlideRightRoute(page: const Settings()));
                      //  Get.to(() => Settings());
                      //                   Navigator.push(context,
                      // EnterExitRoute(exitPage: DasboardScreen(), enterPage: Settings()));
                    },
                    child: card(
                        top: 30,
                        bottom: 0,
                        right: 12,
                        left: 20,
                        text: "Settings",
                        image: Image.asset(
                          'assets/images/settings.png',
                          height: 50,
                          width: 40,
                        ),
                        space: 17),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      // Get.to(() => ContactScreen());
                      Navigator.push(context,
                          SlideRightRoute(page: const ContactScreen()));
                    },
                    child: card(
                        top: 30,
                        bottom: 0,
                        right: 20,
                        left: 13,
                        text: "Contact Us",
                        image: Image.asset(
                          'assets/images/contact.png',
                          height: 50,
                          width: 40,
                        ),
                        space: 10),
                  )),
            ],
          ),
        )
      ],
    );
  }

  card(
      {required double top,
      required double bottom,
      required double right,
      required double left,
      required String text,
      required Image image,
      required double space}) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        margin:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: ColorConstants.hexToColor("#f0e70c"),
              ),
              height: 10,
              width: MediaQuery.of(context).size.width * 0.12,
            ),
            Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.085,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    Padding(
                      padding: EdgeInsets.only(left: space),
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                    )
                  ],
                )),
            Row(
              children: List.generate(
                  150 ~/ 5,
                  (index) => Expanded(
                        child: Container(
                          color:
                              index % 2 == 0 ? Colors.transparent : Colors.grey,
                          height: 1,
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, bottom: 3, right: 5),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_circle_right_outlined,
                      color: Colors.indigo
                          .shade700) //color:Colors.ColorConstants.hexToColor("#283375")
                  // Icon(Icons.arrow_drop_down_circle_outlined),
                  ),
            )
          ],
        ));
  }
}
