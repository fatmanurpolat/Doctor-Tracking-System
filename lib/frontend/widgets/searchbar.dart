
import 'package:flutter/material.dart';

import '../../backend/model/doctor_model.dart';
import '../../backend/service/doctor_service.dart';
import '../colors/colors.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardOpen = false;
  DoctorService _doctorService = DoctorService();
  List<DoctorModelDoctors?> _filteredDoctors = [];
  List<DoctorModelDoctors?> _allDoctors = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
    _fetchDoctors();
  }

  void _handleFocusChange() {
    setState(() {
      _isKeyboardOpen = _focusNode.hasFocus;
    });
  }

  Future<void> _fetchDoctors() async {
    DoctorModel? doctorModel = await _doctorService.fetchDoctors();
    if (doctorModel != null) {
      setState(() {
        _allDoctors = doctorModel.doctors ?? [];
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _searchDoctors(String query) {
    setState(() {
      _filteredDoctors = _allDoctors.where((doctor) {
        final fullName = doctor?.fullName?.toLowerCase() ?? '';
        final queryLower = query.toLowerCase();
        return _isNameMatch(fullName, queryLower);
      }).toList();
    });
  }

  bool _isNameMatch(String fullName, String query) {
    final nameParts = fullName.split(' ');
    for (final part in nameParts) {
      if (part.toLowerCase().startsWith(query)) {
        return true;
      }
    }
    print(query + " query çalışıyor");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: PrivateColor.whiteColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          style: TextStyle(
            color: _isKeyboardOpen ? PrivateColor.antrasitColor : Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'Arama...',
            hintStyle: TextStyle(color: PrivateColor.greyColor),
            prefixIcon: Icon(Icons.search, color: PrivateColor.greyColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white24,
          ),
          onChanged: _searchDoctors,
        ),
      ),
    );
  }
}
