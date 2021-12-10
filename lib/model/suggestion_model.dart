class SuggestionModel {
  late String numProcesso;
  late String nomeProduto;
  SuggestionModel({
    required this.numProcesso,
    required this.nomeProduto,
  });

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    numProcesso = json['numProcesso'];
    nomeProduto = json['nomeProduto'];
  }
}
