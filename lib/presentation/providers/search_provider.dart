import 'package:flutter/material.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/character_repository.dart';

class SearchProvider with ChangeNotifier {
  final CharacterRepository repository;
  SearchProvider(this.repository);

  List<CharacterEntity> results = [];
  bool isLoading = false;
  String? error;

  Future<void> search(String query) async {
    if (query.isEmpty) return;
    isLoading = true;
    notifyListeners();

    try {
      results = await repository.searchCharacters(query);
      error = null;
    } catch (e) {
      error = "No results found";
      results = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
