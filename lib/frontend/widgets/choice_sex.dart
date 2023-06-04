import 'package:flutter/material.dart';
import 'package:online_hasta_randevu_sistemi/frontend/screen/doctor_list_man.dart';
import '../colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_hasta_randevu_sistemi/frontend/colors/colors.dart';

import '../../backend/model/doctor_model.dart';
import '../../backend/service/doctor_service.dart';
import 'choice_sex.dart';
import '../widgets/doctor_list_widget.dart';
import '../widgets/searchbar.dart';


class ChoiceSex extends StatefulWidget {
  const ChoiceSex({Key? key, required this.onSelected}) : super(key: key);

  final Function(String) onSelected;

  @override
  State<ChoiceSex> createState() => _ChoiceSexState();
}

class _ChoiceSexState extends State<ChoiceSex> {
  String? selectedSex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: PrivateColor.whiteColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                activeColor: PrivateColor.whiteColor,
                checkColor: PrivateColor.greenColor,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Erkek',
                  style: TextStyle(color: PrivateColor.greyColor),
                ),
                value: selectedSex == 'Erkek',
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedSex = value! ?'Erkek' : null;
                      widget.onSelected(selectedSex!);
                    } 
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Kadın',
                  style: TextStyle(color: PrivateColor.greyColor),
                ),
                value: selectedSex == 'Kadın',
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedSex = value! ? 'Kadın' :null;
                      widget.onSelected(selectedSex!);
                    }
                  });
                },
                activeColor: PrivateColor.whiteColor,
                checkColor: PrivateColor.greenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
