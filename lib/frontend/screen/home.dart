import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_hasta_randevu_sistemi/frontend/colors/colors.dart';
import 'package:online_hasta_randevu_sistemi/frontend/screen/doctor_list_man.dart';
import 'package:online_hasta_randevu_sistemi/frontend/widgets/choice_sex.dart';

import '../../backend/model/doctor_model.dart';
import '../../backend/service/doctor_service.dart';

import '../widgets/doctor_list_widget.dart';
import '../widgets/searchbar.dart';

final doctorsProvider = FutureProvider<List<DoctorModelDoctors?>>((ref) async {
  final _service = DoctorService();
  final doctorModel = await _service.fetchDoctors();
  return doctorModel?.doctors ?? [];
});

class ListDoctorScreen extends StatefulWidget {
  const ListDoctorScreen({Key? key}) : super(key: key);

  @override
  _ListDoctorScreenState createState() => _ListDoctorScreenState();
}

class _ListDoctorScreenState extends State<ListDoctorScreen> {
  String selectedSex = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrivateColor.greyColor,
      body: Column(
        children: [
          ChoiceSex(
            onSelected: (selectedSex) {
              setState(() {
                this.selectedSex = selectedSex!;
              });
            },
          ),
          CustomSearchBar(),
          Consumer(
            builder: (context, ref, _) {
              final doctorsAsyncValue = ref.watch(doctorsProvider);

              return doctorsAsyncValue.when(
                data: (doctors) {
                  final filteredDoctors = _filterDoctors(doctors);
                  return DoctorListWidget(doctors: filteredDoctors);
                },
                loading: () => CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Error: $error'),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedSex == 'Erkek') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DrManListWidget(doctors: [],)),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<DoctorModelDoctors?> _filterDoctors(List<DoctorModelDoctors?> doctors) {
    if (selectedSex == 'Erkek') {
      return doctors?.where((doctor) => doctor?.gender == 'male').toList() ?? [];
    } else if (selectedSex == 'Kadın') {
      return doctors?.where((doctor) => doctor?.gender == 'female').toList() ?? [];
    } else {
      return doctors ?? [];
    }
  }
}
