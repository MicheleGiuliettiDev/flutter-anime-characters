import 'package:flutter/material.dart';
import 'package:flutter_anime_characters/model/anime_character.dart';

class AnimeCharacterWidget extends StatelessWidget {
  final AnimeCharacter character;

  const AnimeCharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.imageUri, height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Text(character.name),
                  const SizedBox(height: 10,),
                  Text(character.description, textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  Column(children: character.skills.map((e) => Text(e)).toList())
                ],
              ),
            )
          ]),
    );
  }
}
