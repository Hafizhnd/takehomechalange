import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class RemoteDataSource {
  final String baseUrl = "https://rickandmortyapi.com/api";

  Future<List<CharacterModel>> getCharacters(int page) async {
    final res = await http.get(Uri.parse('$baseUrl/character?page=$page'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['results'] as List).map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch characters");
    }
  }

  Future<CharacterModel> getCharacterDetail(int id) async {
    final res = await http.get(Uri.parse('$baseUrl/character/$id'));
    if (res.statusCode == 200) {
      return CharacterModel.fromJson(json.decode(res.body));
    } else {
      throw Exception("Failed to fetch detail");
    }
  }

  Future<List<CharacterModel>> searchCharacters(String query) async {
    final res = await http.get(Uri.parse('$baseUrl/character/?name=$query'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['results'] as List).map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception("No results");
    }
  }
}
