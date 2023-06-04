import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_hasta_randevu_sistemi/frontend/screen/home.dart';

import 'frontend/colors/colors.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  bool? isLoading;
// Use the encoded data when sending it to the API

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Doctor Appointment System",
            style: TextStyle(color: PrivateColor.whiteColor),
          )),
          backgroundColor: PrivateColor.greenColor,
        ),
        body: // isLoading == null
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : isLoading == true
            //         ? ListDoctorScreen()
            //         : Center(
            //             child: Text("Bir sorun oluştu"),
            //           ),
            ListDoctorScreen(),
      ),
    );
  }
}
