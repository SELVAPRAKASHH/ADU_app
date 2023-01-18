import 'package:adu_app/pages/splashscreen/splashscreen_sc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'controller/network_controller/RootBinding.dart';


void main() async {
  WidgetsFlutterBinding();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       FocusScope.of(context).requestFocus( FocusNode());
      },
      child: GetMaterialApp(
        builder: EasyLoading.init(  builder: (context, child) {
          // Obtain the current media query information.
        final mediaQueryData = MediaQuery.of(context);
        // Take the textScaleFactor from system and make
        // sure that it's no less than 1.0, but no more
        // than 1.5.
        final num constrainedTextScaleFactor =
            mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
            return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaleFactor: constrainedTextScaleFactor as double,
          ),
          child: child!,
        );
          
        },),
          debugShowCheckedModeBanner: false,
          initialBinding: NetworkBinding(),
          initialRoute: '/splash',
          routes: {
            '/splash': (_) => Splashscreen(),
          },
         ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Splashscreen()));
  }
}
