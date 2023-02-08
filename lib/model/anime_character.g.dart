// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeCharacter _$AnimeCharacterFromJson(Map<String, dynamic> json) =>
    AnimeCharacter(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUri: json['imageUri'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AnimeCharacterToJson(AnimeCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUri': instance.imageUri,
      'skills': instance.skills,
    };
