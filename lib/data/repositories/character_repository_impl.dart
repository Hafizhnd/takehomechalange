import 'package:takehomechalange/data/models/character_model.dart';

import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final RemoteDataSource remote;
  final LocalDataSource local;

  CharacterRepositoryImpl({required this.remote, required this.local});

  @override
  Future<List<CharacterEntity>> getCharacters(int page) async {
    final res = await remote.getCharacters(page);
    return res.map((e) => e.toEntity()).toList();
  }

  @override
  Future<CharacterEntity> getCharacterDetail(int id) async {
    final res = await remote.getCharacterDetail(id);
    return res.toEntity();
  }

  @override
  Future<List<CharacterEntity>> searchCharacters(String query) async {
    final res = await remote.searchCharacters(query);
    return res.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addFavorite(CharacterEntity character) async {
    final model = CharacterModel.fromEntity(character);
    await local.addFavorite(model);
  }

  @override
  Future<void> removeFavorite(int id) async {
    await local.removeFavorite(id);
  }

  @override
  Future<List<CharacterEntity>> getFavorites() async {
    final res = await local.getFavorites(); 
    return res.map((model) => model.toEntity()).toList(); 
  }
}
