import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.hexToColor("#283375"),
          title: const Text(
            "CONTACT",
            style: TextStyle(letterSpacing: 0.5),
          ),
        ),
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/flash_sc.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [contactdetails(),const Spacer(),logo()],
          )
        ]));
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

  Widget contactdetails() {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "ADU SOFTWARE TECHNOLOGIES UK",
                style: TextStyle(
                    fontSize: 16, letterSpacing: 0.5, color: Colors.amber),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 25),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23, right: 15),
                    child: Image.asset(
                      'assets/images/location.png',
                      //fit: BoxFit.cover,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  SizedBox(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: const Text(
                          "46, Roebuck Lane, Sale, Chesire, M 33 7 SH, England",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 25),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23, right: 15),
                    child: Image.asset(
                      'assets/images/call.png',
                      //fit: BoxFit.cover,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  SizedBox(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: const Text("0161 718 5439",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 25,bottom: 30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23, right: 15),
                    child: Image.asset(
                      'assets/images/mail.png',
                      //fit: BoxFit.cover,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  SizedBox(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: const Text("adu@ntworld.net",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
