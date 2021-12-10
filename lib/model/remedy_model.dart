class RemedyModel {
  late String idMedicamento = "";
  late String nomeComercial = "";
  late String atc = "";
  late String medicamentoReferencia = "";
  late String categoriaRegulatoria = "";
  late int quantidade;
  late int horario;
  late int diasRecorrentes ;
  late int idNotificacao;

  RemedyModel({
    required this.idMedicamento,
    required this.nomeComercial,
    required this.atc,
    required this.medicamentoReferencia,
    required this.categoriaRegulatoria,
    required this.quantidade,
    required this.horario,
    required this.diasRecorrentes,
    required this.idNotificacao

  });

  RemedyModel.fromJson(Map<String, dynamic> json) {
    nomeComercial = json['nomeComercial'];
    atc = json['atc'];
    medicamentoReferencia = json['medicamentoReferencia'];
    categoriaRegulatoria = json['categoriaRegulatoria'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idMedicamento": this.idMedicamento,
      "nomeComercial": this.nomeComercial,
      "atc": this.atc,
      "medicamentoReferencia": this.medicamentoReferencia,
      "categoriaRegulatoria": this.categoriaRegulatoria,
    };

    return map;
  }
}