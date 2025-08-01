import '../../domain/entities/character_entity.dart';

class CharacterModel {
  final int id;
  final String name;
  final String species;
  final String gender;
  final String origin;
  final String location;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      gender: json['gender'],
      origin: json['origin']['name'],
      location: json['location']['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'species': species,
        'gender': gender,
        'origin': origin,
        'location': location,
        'image': image,
      };

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      species: map['species'],
      gender: map['gender'],
      origin: map['origin'],
      location: map['location'],
      image: map['image'],
    );
  }

  CharacterEntity toEntity() => CharacterEntity(
        id: id,
        name: name,
        species: species,
        gender: gender,
        origin: origin,
        location: location,
        image: image,
      );

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      species: entity.species,
      gender: entity.gender,
      origin: entity.origin,
      location: entity.location,
      image: entity.image,
    );
  }
}
