import 'package:flutter/material.dart';
import 'package:online_hasta_randevu_sistemi/frontend/colors/colors.dart';

class FreeDetail extends StatelessWidget {
  const FreeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrivateColor.greenColor,
      ),
      backgroundColor: PrivateColor.greyColor,
      body: Center(
        child: Container(
          child: Text(
            "Ödeme Ekranı",
            style: TextStyle(color: PrivateColor.antrasitColor, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
