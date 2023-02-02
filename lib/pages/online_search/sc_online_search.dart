import 'package:adu_app/pages/online_search/online_search_controller.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OnlineSearch extends StatefulWidget {
  const OnlineSearch({super.key});

  @override
  State<OnlineSearch> createState() => _OnlineSearchState();
}

class _OnlineSearchState extends State<OnlineSearch> {
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      /*  systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent
      ), */
      backgroundColor: ColorConstants.hexToColor("#283375"),
      title: const Text(
        "ONLINE SEARCH",
        style: TextStyle(letterSpacing: 0.5, fontSize: 18),
      ),
    );
    return Scaffold(
        appBar: appbar,
        body: GetBuilder<OnlineSearchController>(
          init: OnlineSearchController(),
          builder: (controller) {
            return controller.isloading ? loading() : builddetails(controller);
          },
        ));
  }

  Widget builddetails(OnlineSearchController controller) {
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
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30, right: 25, left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commantitle('Enter keyword'),
                keywordinput(controller),
                commantitle('Select Reg/Code'),
                selectcode(controller),
                commantitle('Type'),
                inputtype(controller),
                searchbutton(controller)
              ],
            ),
          ),
          totalresulttitle(controller),
          Container(
              height: MediaQuery.of(context).size.height / 2.5,
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: showaircraft(controller))
        ]),
      ))
    ]);
  }

  Widget showaircraft(OnlineSearchController controller) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
                alignment: Alignment.topRight,
                height: MediaQuery.of(context).size.height / 12,
                child: ListTile(
                    leading: aircraftlogi(),
                    trailing: aircraftid(controller),
                    title: aircraftdetails())),
          );
        });
  }

  Widget aircraftdetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Raytheon Aircraft Company ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          "T-6 Texan 11",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  aircraftid(OnlineSearchController controller) {
    return Container(
      color: Colors.grey.shade300,
      width: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '00-3570',
            style: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '41252',
            style: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget aircraftlogi() {
    return Container(
      // margin: const EdgeInsets.all(4),
      /*   height: 55,
      width: 50, */
      // color: Colors.yellow.shade500,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/loglist.png',
      ),
    );
    
     /* Container(
      margin: const EdgeInsets.only(bottom: 10),
      
      // color: Colors.yellow.shade500,
      // alignment: Alignment.center,
      child: Image.asset(
        'assets/images/loglist.png',
      ),
    ); */
  }

  Widget totalresulttitle(OnlineSearchController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 25, right: 10),
      child: Row(
        children: [
          const Text(
            "24 Results",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Container(
              alignment: Alignment.center,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 10,
                minWidth: MediaQuery.of(context).size.width / 4.5,
                height: 25,
                color: Colors.grey.shade300,
                onPressed: () {
                  // savenotes();
                  // Navigator.push(context, SlideRightRoute(page: LogsList(controller)));
                  /*  showDialog(
            context: context, builder: (BuildContext context) => errorDialog); */
                  // savenotesdialog();
                },
                child: Row(
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.hexToColor("#283375")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        size: 20,
                        color: ColorConstants.hexToColor("#283375"),
                      ),
                    )
                  ],
                ),
              )),
          Container(
              margin: const EdgeInsets.only(left: 10,right: 20),
              alignment: Alignment.center,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 10,
                height: 25,
                color: Colors.grey.shade300,
                onPressed: () {
                  // savenotes();
                  // Navigator.push(context, SlideRightRoute(page: LogsList(controller)));
                  /*  showDialog(
            context: context, builder: (BuildContext context) => errorDialog); */
                  // savenotesdialog();
                },
                child: Row(
                  children: [
                    Text(
                      "Show All",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.hexToColor("#283375")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(Icons.arrow_drop_down_circle_outlined,
                          size: 20,
                          color: ColorConstants.hexToColor("#283375")),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget searchbutton(OnlineSearchController controller) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 10,
            minWidth: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.height / 20,
            color: Colors.yellow,
            onPressed: () {},
            child: const Text(
              "Search",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )),
    );
  }

  Widget inputtype(OnlineSearchController controller) {
    return Container(
        padding: const EdgeInsets.only(left: 15.0, top: 20, right: 10),
        height: 40,
        child: TextField(
            controller: controller.placecontroller,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: "Montserrat-Medium",
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ))));
  }

  Widget selectcode(OnlineSearchController controller) {
    return Container(
        padding: const EdgeInsets.only(left: 15.0, top: 20, right: 10),
        height: 40,
        child: TextField(
            controller: controller.placecontroller,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: "Montserrat-Medium",
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ))));
  }

  Widget keywordinput(OnlineSearchController controller) {
    return Container(
        padding: const EdgeInsets.only(left: 15.0, top: 20, right: 10),
        height: 40,
        child: TextField(
            controller: controller.placecontroller,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: "Montserrat-Medium",
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                ))));
  }

  Widget commantitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, color: Colors.white),
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
