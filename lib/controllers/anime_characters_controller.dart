import 'package:flutter/material.dart';

import 'package:flutter_anime_characters/model/anime_character.dart';
import 'package:flutter_anime_characters/services/anime_characters_service.dart';

class AnimeCharactersController extends ChangeNotifier {
  final AnimeCharactersService _animeCharactersService = AnimeCharactersService();

  List<AnimeCharacter> animeCharacters = [];

  Future<void> getAnimeCharacters() async {
    animeCharacters = await _animeCharactersService.getAnimeCharacters();

    notifyListeners();
  }
}