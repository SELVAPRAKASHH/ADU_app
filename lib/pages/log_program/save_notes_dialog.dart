import 'package:adu_app/pages/log_program/log_program_controller.dart';
import 'package:adu_app/utils/common_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SaveNotesDialog extends StatefulWidget {
  final LogProgramController controller;
  SaveNotesDialog({required this.controller});

  @override
  State<SaveNotesDialog> createState() => _SaveNotesDialogState();
}

class _SaveNotesDialogState extends State<SaveNotesDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        contentPadding: const EdgeInsets.only(top: 0.0),
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.min,
            children: [
              appbartitle(widget.controller),
              enterregister(widget.controller),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  "Enter Notes",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              notestext(),
              saveDeleteNote(widget.controller)
            ],
          ),
        ));
  }

  Widget saveDeleteNote(LogProgramController controller) {
    return Container(
      //height: 70,
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (controller.registernum.text.isEmpty) {
                showtoast("Enter your Register Number");
              } else {
                controller.saveloges();
              }

              /*  if (controller.registernum.text.isEmpty) {
                showtoast("Please Enter the Register number");
              } */
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: ColorConstants.hexToColor("#283375"),
              ),
              width: MediaQuery.of(context).size.width / 3.3,
              // height: ,
              child: const Padding(
                padding: EdgeInsets.only(top: 6.0, bottom: 6),
                child: Text(
                  "Save Note",
                  style: TextStyle(fontSize: 13, color: Colors.yellow),
                ),
              ),
            ),
          ),
          // SizedBox(height: 10,),
          InkWell(
            onTap: (){
              controller.registernum.text="";
              controller.placecontroller.text="";
              controller.currentSelectedairfieldtatus.value="Please Select";
              controller.currentSelectedairfieldPos.value="0";
              Get.back();
              
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                // color: Colors.grey,
              ),
              width: MediaQuery.of(context).size.width / 3.3,
              // height: ,
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 6),
                child: Text(
                  "Delete Entry",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showtoast(String msg) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(
        message: msg,
      ),
    );
  }

  Widget notestext() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 15, right: 10),
          child: const TextField(
            decoration: InputDecoration(
              // labelText: 'here text...',
              hintText: 'here text...',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 10,
          )),
    );
  }

  Widget enterregister(LogProgramController controller) {
    return SizedBox(
      height: 80,
      // color: Colors.blue,
      child: Row(
        children: [
          date(),
          Expanded(
              child: TextField(
            controller: controller.registernum,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Enter Reg.No',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget date() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 60,
      /*   height: 55,
      width: 50, */
      color: Colors.yellow.shade500,
      // alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              "23",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10, bottom: 5),
            child: Text("May", style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget appbartitle(LogProgramController controller) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstants.hexToColor("#283375"),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "London",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 13.0, bottom: 13),
            child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.yellow,
                ),
                width: MediaQuery.of(context).size.width / 3.8,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.delete_forever_outlined),
                    ),
                    Text(
                      " Delete Log",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10),
            child: IconButton(
                onPressed: () {
                  Get.back();
                  controller.registernum.text = "";
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
