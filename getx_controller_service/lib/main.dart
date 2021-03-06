import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_controller_service/app.dart';

void main() {
  //initService();
  runApp(const MyApp());
}

// void initService(){
//   //permanent: 영구적으로 사용하겠다.
//   Get.put(GetxControllerTest(), permanent: true);
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get.testMode = true;
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.white38, onPrimary: Colors.black),
        ),
      ),
      home: const App(),
    );
  }
}