import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_hasta_randevu_sistemi/frontend/screen/free_page_detail.dart';
import 'package:online_hasta_randevu_sistemi/frontend/screen/premium_page_detail.dart';
import '../../backend/model/doctor_model.dart';
import '../colors/colors.dart';

class FreeDoctorDetailScreen extends StatelessWidget {
  final DoctorModelDoctors doctor;

  const FreeDoctorDetailScreen({Key? key, required this.doctor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PrivateColor.greyColor,
      appBar: AppBar(
        backgroundColor: PrivateColor.greenColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              decoration: BoxDecoration(
                  color: PrivateColor.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: width * 0.7,
              height: height / 5,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(doctor.image?.url ?? ''),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Uzm.Dyt.${doctor.fullName ?? ''}',
                    style: TextStyle(
                      color: PrivateColor.antrasitColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: width * 0.7,
              child: Card(
                color: PrivateColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FreeDetail(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premium Paket Al",
                          style: TextStyle(color: PrivateColor.greenColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: PrivateColor.greenColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
