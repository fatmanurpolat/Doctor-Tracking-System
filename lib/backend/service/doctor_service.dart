import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_hasta_randevu_sistemi/backend/model/doctor_model.dart';

class DoctorService {
  final String url = "https://www.mobillium.com/android/doctors.json";

  Future<DoctorModel?> fetchDoctors() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = DoctorModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("İstek başarısız => ${res.statusCode}");
      return null;
    }
  }
}
