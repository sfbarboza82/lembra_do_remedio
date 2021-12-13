import 'package:dio/dio.dart';
import 'package:lembra_do_remedio/model/remedy_model.dart';
import 'package:lembra_do_remedio/model/suggestion_model.dart';

class SuggestionRepository {
  Future<List<SuggestionModel>> fetchSuggestion(String query) async {
    var dio = Dio();
    final response =
        await dio.get('https://bula.vercel.app/pesquisar?nome=$query&pagina=1');
    final responseJson = response.data['content'] as List<dynamic>;
    return responseJson.map((e) => SuggestionModel.fromJson(e)).toList();
  }

  Future<RemedyModel> fetchResults(String id) async {
    var dio = Dio();
    final response = await dio.get('https://bula.vercel.app/medicamento/$id');
    final responseJson = response.data as Map<String, dynamic>;
    return RemedyModel.fromJson(responseJson);
  }
}
