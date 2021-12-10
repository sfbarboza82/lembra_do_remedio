import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/screen/search_remedy_screen.dart';

class PanelPatient extends StatefulWidget {
  const PanelPatient({Key? key}) : super(key: key);

  @override
  _PanelPatientState createState() => _PanelPatientState();
}

class _PanelPatientState extends State<PanelPatient> {
  @override
  Widget build(BuildContext context) {
    return SearchRemedy();
  }
}

