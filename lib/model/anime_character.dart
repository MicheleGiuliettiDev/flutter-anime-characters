import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'anime_character.g.dart';

@JsonSerializable()
class AnimeCharacter {
  String id;
  String name;
  String description;
  String imageUri;
  List<String> skills;

  AnimeCharacter(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUri,
      required this.skills});

  factory AnimeCharacter.fromJson(Map<String, dynamic> json) => _$AnimeCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeCharacterToJson(this);
}
