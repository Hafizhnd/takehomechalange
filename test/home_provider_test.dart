import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:takehomechalange/domain/entities/character_entity.dart';
import 'package:takehomechalange/domain/repositories/character_repository.dart';
import 'package:takehomechalange/presentation/providers/home_provider.dart';
import 'home_provider_test.mocks.dart';

@GenerateMocks([CharacterRepository])
void main() {
  late MockCharacterRepository mockRepo;
  late HomeProvider provider;

  setUp(() {
    mockRepo = MockCharacterRepository();
    provider = HomeProvider(mockRepo);
  });

  final fakeCharacter = CharacterEntity(
    id: 1,
    name: "Rick Sanchez",
    species: "Human",
    gender: "Male",
    origin: "Earth",
    location: "Earth",
    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
  );

  test("Loads characters successfully", () async {
    when(mockRepo.getCharacters(1))
        .thenAnswer((_) async => [fakeCharacter]);

    await provider.fetchInitialCharacters();

    expect(provider.characters.isNotEmpty, true);
    expect(provider.error, null);
  });

  test("Handles API error", () async {
    when(mockRepo.getCharacters(1))
        .thenThrow(Exception("API Error"));

    await provider.fetchInitialCharacters();

    expect(provider.characters.isEmpty, true);
    expect(provider.error, isNotNull);
  });

  test("Handles empty list", () async {
    when(mockRepo.getCharacters(1))
        .thenAnswer((_) async => []);

    await provider.fetchInitialCharacters();

    expect(provider.characters.isEmpty, true);
    expect(provider.error, null);
  });
}