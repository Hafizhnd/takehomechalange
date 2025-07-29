import 'package:flutter/material.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/character_repository.dart';

class HomeProvider with ChangeNotifier {
  final CharacterRepository repository;
  HomeProvider(this.repository);

  List<CharacterEntity> characters = [];
  bool isLoading = false;
  String? error;

  bool _isBackgroundLoading = false;

  Future<void> fetchInitialCharacters() async {
    isLoading = true;
    notifyListeners();

    try {
      final firstPage = await repository.getCharacters(1);
      characters = firstPage;
      error = null;
      notifyListeners();

      _fetchRemainingPagesInBackground(startPage: 2);
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }

    isLoading = false;
  }

  Future<void> _fetchRemainingPagesInBackground({int startPage = 2}) async {
    if (_isBackgroundLoading) return;
    _isBackgroundLoading = true;

    int page = startPage;

    while (true) {
      try {
        final newCharacters = await repository.getCharacters(page);
        if (newCharacters.isEmpty) break;

        characters.addAll(newCharacters);
        notifyListeners();
        page++;
      } catch (_) {
        break;
      }
    }

    _isBackgroundLoading = false;
  }
}
