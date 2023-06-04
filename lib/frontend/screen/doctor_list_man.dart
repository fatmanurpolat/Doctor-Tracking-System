import 'package:flutter/material.dart';
import 'package:online_hasta_randevu_sistemi/frontend/colors/colors.dart';

import '../../backend/model/doctor_model.dart';
import '../screen/user_detail_free.dart';
import '../screen/user_detail_premium.dart';

class DrManListWidget extends StatelessWidget {
  
  const DrManListWidget({
    key,
    required this.doctors,
  });

  final List<DoctorModelDoctors?> doctors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: PrivateColor.whiteColor, // Köşelerin yuvarlaklık oranı
            ),
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                var doctor = doctors[index];
                if (doctor!.gender == 'male') {
                  return Column(
                    children: [
                      ListTile(
                        
                          trailing: Icon(Icons.arrow_forward_ios),
                          title: Text(
                            "${doctors[index]!.fullName}",
                            style: TextStyle(color: PrivateColor.antrasitColor),
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(doctors[index]!.image!.url ?? ''),
                          ),
                          onTap: () {
                            if (doctors[index]!.userStatus == 'premium') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PremiumDoctorDetailScreen(
                                          doctor: doctors[index]!),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FreeDoctorDetailScreen(
                                      doctor: doctors[index]!),
                                ),
                              );
                            }
                          }),
                      Divider(),
                    ],
                  );
                } else {
                  Text("Hata");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
