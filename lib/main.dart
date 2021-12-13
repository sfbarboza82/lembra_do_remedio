import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/route.dart';
import 'package:lembra_do_remedio/screen/login_screen.dart';

final ThemeData temaPadrao = ThemeData(
    primaryColor: Color(0xff37474f),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Color(0xff546e7a)));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Lembra do Remédio",
    home: Login(),
    theme: temaPadrao,
    initialRoute: "/",
    onGenerateRoute: Rotas.gerarRotas,
    debugShowCheckedModeBanner: false,
  ));
}
