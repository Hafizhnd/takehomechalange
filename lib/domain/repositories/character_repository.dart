import '../entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacters(int page);
  Future<CharacterEntity> getCharacterDetail(int id);
  Future<List<CharacterEntity>> searchCharacters(String query);

  Future<void> addFavorite(CharacterEntity character);
  Future<void> removeFavorite(int id);
  Future<List<CharacterEntity>> getFavorites();
}
