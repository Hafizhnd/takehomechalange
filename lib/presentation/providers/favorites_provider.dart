import 'package:flutter/material.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/character_repository.dart';

class FavoritesProvider with ChangeNotifier {
  final CharacterRepository repository;
  FavoritesProvider(this.repository);

  List<CharacterEntity> favorites = [];

  Future<void> loadFavorites() async {
    favorites = await repository.getFavorites();
    notifyListeners();
  }

  Future<void> addFavorite(CharacterEntity character) async {
    await repository.addFavorite(character);
    await loadFavorites();
  }

  Future<void> removeFavorite(int id) async {
    await repository.removeFavorite(id);
    await loadFavorites();
  }

  bool isFavorite(int id) {
    return favorites.any((c) => c.id == id);
  }
}
