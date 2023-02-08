import 'package:flutter/material.dart';
import 'package:flutter_anime_characters/controllers/anime_characters_controller.dart';
import 'package:flutter_anime_characters/widgets/anime_character_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/dashboard";

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _loadData() async {
    Provider.of<AnimeCharactersController>(context, listen: false)
        .getAnimeCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.lightBlue,
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text(AppLocalizations.of(context)!
                      .errorFetchingAnimeCharacters),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () => _loadData(),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.green),
                    height: double.infinity,
                    width: double.infinity,
                    child: Consumer<AnimeCharactersController>(
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: value.animeCharacters.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (context, index) => AnimeCharacterWidget(
                              character: value.animeCharacters[index]),
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
          },
          future: _loadData()),
    );
  }
}
