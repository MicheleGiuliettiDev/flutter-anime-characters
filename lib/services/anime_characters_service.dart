import 'dart:convert';

import 'package:flutter_anime_characters/configuration/urls.dart';
import 'package:flutter_anime_characters/model/anime_character.dart';
import 'package:http/http.dart' as http;

class AnimeCharactersService {
  Future<List<AnimeCharacter>> getAnimeCharacters() async {
    final uri = Uri.parse(animeCharactersApi);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      return result.map<AnimeCharacter>((x) => AnimeCharacter.fromJson(x)).toList(); 
    } else {
      throw Exception("Error fetching anime characters");
    }
  }
}