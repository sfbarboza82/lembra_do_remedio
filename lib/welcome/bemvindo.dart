import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/welcome/titulo_mensagem.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    void goToHomeScreen() => Navigator.pushReplacementNamed(context, "/home");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.04,
            ),
            Image.asset('assets/images/logo.png',
                width: double.infinity, height: deviceHeight * 0.4),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            TitleAndMessage(deviceHeight),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            Container(
              height: deviceHeight * 0.09,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Color(0xff1ebbd8),
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login_screen", (_) => false);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
