import 'package:intl/intl.dart';

class CalendarioDiaModel {
  String diario;
  int numeroDia;
  int mes;
  int ano;
  bool confirmado;

  CalendarioDiaModel(
      {required this.diario,
      required this.numeroDia,
      required this.ano,
      required this.mes,
      required this.confirmado});

  //get dia atual 7 dias
  List<CalendarioDiaModel> getCurrentDays() {
    final List<CalendarioDiaModel> listaDias = [];
    DateTime currentTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      listaDias.add(CalendarioDiaModel(
          diario: DateFormat.E('pt_Br').format(currentTime).toString()[0],
          numeroDia: currentTime.day,
          mes: currentTime.month,
          ano: currentTime.year,
          confirmado: false));
      currentTime = currentTime.add(Duration(days: 1));
    }
    listaDias[0].confirmado = true;
    return listaDias;
  }
}
