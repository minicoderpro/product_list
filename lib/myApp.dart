import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:practice/module_13.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.blue,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.teal, // AppBar with Teal color
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // AppBar title style
                  iconTheme: IconThemeData(color: Colors.white),
                  centerTitle: true,
                ),

                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white))),
            title: 'Ostad Flutter app',
            home: Module13(),
          );
        }
    );
  }
}