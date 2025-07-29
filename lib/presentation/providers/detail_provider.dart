import 'package:flutter/material.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/character_repository.dart';

class DetailProvider with ChangeNotifier {
  final CharacterRepository repository;
  DetailProvider(this.repository);

  CharacterEntity? character;
  bool isLoading = false;
  String? error;

  Future<void> fetchDetail(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      character = await repository.getCharacterDetail(id);
      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
