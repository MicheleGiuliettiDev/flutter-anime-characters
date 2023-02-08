import 'package:flutter/material.dart';
import 'package:flutter_anime_characters/model/anime_character.dart';

class CharacterDetailArgs {
  final AnimeCharacter character;

  CharacterDetailArgs({required this.character});
}

class CharacterDetailScreen extends StatelessWidget {
  static const String routeName = '/character-detail';

  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterDetailArgs args =
        ModalRoute.of(context)?.settings.arguments as CharacterDetailArgs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(args.character.imageUri, height: 200),
                const SizedBox(height: 30,),
                Text(args.character.name),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  args.character.description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Skills", style: TextStyle(fontWeight: FontWeight.bold)),
                Column(
                    children:
                        args.character.skills.map((e) => Text(e)).toList())
              ],
            )),
      ),
    );
  }
}
