import 'package:adu_app/pages/splashscreen/splashscreen_sc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'network/root_binding.dart';
enum ConfirmAction { SUCCESS, FAILED }
void main() async {
  WidgetsFlutterBinding();
  // await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        builder: EasyLoading.init(
          builder: (context, child) {
            ThemeData(
                textTheme:const TextTheme(subtitle1: TextStyle(color: Colors.grey))
                /* primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white */
                );

            final mediaQueryData = MediaQuery.of(context);
            final num constrainedTextScaleFactor =
                mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
            return MediaQuery(
              data: mediaQueryData.copyWith(
                textScaleFactor: constrainedTextScaleFactor as double,
              ),
              child: child!,
            );
          },
        ),
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
