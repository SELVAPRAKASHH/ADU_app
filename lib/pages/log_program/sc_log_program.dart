import 'package:adu_app/main.dart';
import 'package:adu_app/pages/log_program/log_list.dart';
import 'package:adu_app/pages/log_program/log_program_controller.dart';
import 'package:adu_app/pages/log_program/save_notes_dialog.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LogProgram extends StatefulWidget {
  const LogProgram({super.key});

  @override
  State<LogProgram> createState() => _LogProgramState();
}

TextEditingController cont = TextEditingController();

class _LogProgramState extends State<LogProgram> {
  var officer = [
    "Please Select",
    "Full Time",
    "Part Time",
    "Self-Employed",
    "Un-Employed",
    "Retired"
  ];
  // String _currentSelectedairfieldtatus = "Please Select";
  // String _currentSelectedairfieldPos = "0";

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: ColorConstants.hexToColor("#283375"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 17, bottom: 17, right: 15),
          child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.yellow,
              ),
              width: MediaQuery.of(context).size.width / 5,
              child: const Text(
                "0" " Fields",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )

              // height: 2,
              ),
        ),
        Image.asset(
          'assets/images/sync.png',
          height: 25,
          width: 25,
          // fit: BoxFit.cover,
        ),
        // Text("0"),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            child: const Text(
              "0",
              style: TextStyle(fontSize: 15, color: Colors.yellow),
            ),
          ),
        )
      ],
      title: const Text(
        "LOG PROGRM",
        style: TextStyle(letterSpacing: 0.5, fontSize: 18),
      ),
    );
    return Scaffold(
        appBar: appbar,
        body: GetBuilder<LogProgramController>(
          init: LogProgramController(),
          builder: (controller) {
            return controller.isloading ? loading() : builddetails(controller);
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

  Widget builddetails(LogProgramController controller) {
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
          const Padding(
            padding: EdgeInsets.only(top: 23.0),
            child: Text(
              "Create New Logs",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          enterplacetitle(),
          placeinput(controller),
          selectairfieldtitle(),
          selectairfieldStatus(controller),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          createlogbutton(controller),
          SizedBox(height: MediaQuery.of(context).size.height / 19),
          Container(
              height: MediaQuery.of(context).size.height / 2.6,
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: LogsList(controller))
        ]),
      ))
    ]);
  }

  Widget createlogbutton(LogProgramController controller) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      elevation: 10,
      minWidth: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 20,
      color: Colors.yellow,
      onPressed: () {
        controller.validation(
            /*  _currentSelectedairfieldtatus, _currentSelectedairfieldPos */);
        if (controller.valitationstatus.value == true) {
          savenotesdialog(controller);
        }

        // savenotes();
        // Navigator.push(context, SlideRightRoute(page: LogsList(controller)));
        /*  showDialog(
            context: context, builder: (BuildContext context) => errorDialog); */
        // savenotesdialog();
      },
      child: const Text(
        "Create New Log",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget placeinput(LogProgramController controller) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 20),
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
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ))),
    );
  }

  Widget enterplacetitle() {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 25),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Image.asset(
            'assets/images/pin.png',
            height: 30,
            width: 30,
            // fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Enter Place",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectairfieldtitle() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 25),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Image.asset(
            'assets/images/compass.png',
            height: 30,
            width: 30,
            // fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Select Airfield",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectairfieldStatus(LogProgramController controller) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 20),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
            ),
            isEmpty: controller.currentSelectedairfieldtatus.value == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                selectedItemBuilder: (BuildContext context) {
                  return officer.map((String value) {
                    return Text(value,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13));
                  }).toList();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.yellow, size: 35, // <-- SEE HERE
                ),
                style: const TextStyle(
                    color: Colors.deepPurple, //<-- SEE HERE
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                value: controller.currentSelectedairfieldtatus.value,
                isDense: true,
                onChanged: (String? newValue) {
                  dokeepWorkStatusPos(newValue!, controller);
                },
                items: officer.map((String value) {
                  debugPrint(value);
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: "Montserrat-Medium",
                            letterSpacing: 0.2)),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  void dokeepWorkStatusPos(String val, LogProgramController controller) {
    if (val.startsWith("Full Time")) {
      controller.currentSelectedairfieldPos.value = "1";
    } else if (val.startsWith("Part Time")) {
      controller.currentSelectedairfieldPos.value = "2";
    } else if (val.startsWith("Self-Employed")) {
      controller.currentSelectedairfieldPos.value = "3";
    } else if (val.startsWith("Un-Employed")) {
      controller.currentSelectedairfieldPos.value = "4";
    } else if (val.startsWith("Retired")) {
      controller.currentSelectedairfieldPos.value = "5";
    } else {
      controller.currentSelectedairfieldPos.value = "0";
    }
    setState(() {
      controller.currentSelectedairfieldtatus.value = val;
    });
  }

  void savenotesdialog(LogProgramController controller) async {
    ConfirmAction? c = await showDialog<ConfirmAction>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SaveNotesDialog(
            controller: controller,
          );
        });
  }

  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: SizedBox(
      height: 300.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Cool',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Awesome',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
              },
              child: const Text(
                'Got It!',
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
              ))
        ],
      ),
    ),
  );
}
