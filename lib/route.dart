import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/screen/registration_user_screen.dart';
import 'package:lembra_do_remedio/screen/home_screen.dart';
import 'package:lembra_do_remedio/screen/panel_doctor_screen.dart';
import 'package:lembra_do_remedio/screen/panel_patient_screen.dart';

class Rotas {
  static Route<dynamic>? gerarRotas(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Home());
      case "/cadastro-usuario":
        return MaterialPageRoute(builder: (_) => RegistrationUser());
      case "/painel-medico":
        return MaterialPageRoute(builder: (_) => PanelDoctor());
      case "/painel-paciente":
        return MaterialPageRoute(builder: (_) => PanelPatient());

      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
