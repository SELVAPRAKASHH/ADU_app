import 'package:adu_app/pages/log_program/log_program_controller.dart';
import 'package:flutter/material.dart';

class LogsList extends StatefulWidget {
  const LogsList(LogProgramController controller, {super.key});

  @override
  State<LogsList> createState() => _LogsListState();
}

class _LogsListState extends State<LogsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 14,
              child: ListTile(
                  leading: date(),
                  trailing: totallogs(),
                  title: const Text(
                    "Londan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
            ),
          );
        });
  }

  totallogs() {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade400,
      radius: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '2',
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            'logs',
            style: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ), //Text
    );
  }

  date() {
    return Container(
      margin: const EdgeInsets.all(4),
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
}
