class Agenda {
  String _id_Remedio = "";
  String _nome_remedio = "";
  String _quantidade = "";
  String _modo_de_uso = "";
  String _frequencia = "";

  Agenda();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id_Remedio": this.id_Remedio,
      "nome": this.nome_remedio,
      "quantidade": this.quantidade,
      "modo de uso": this.mode_de_uso,
      "frequencia": this.frequencia,
    };

    return map;
  }

  String get id_Remedio => _id_Remedio;

  set id_Remedio(String value) {
    _id_Remedio = value;
  }

  String get nome_remedio => _nome_remedio;

  set nome_remedio(String value) {
    _nome_remedio = value;
  }

  String get quantidade => _quantidade;

  set quantidade(String value) {
    _quantidade = value;
  }

  String get mode_de_uso => _modo_de_uso;

  set mode_de_uso(String value) {
    _modo_de_uso = value;
  }

  String get frequencia => _frequencia;

  set frequencia(String value) {
    _frequencia = value;
  }
}
