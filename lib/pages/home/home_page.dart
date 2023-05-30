import 'package:diajar_api/api/api.dart';
import 'package:diajar_api/model/pokemon_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PokemonResponse>? pokemonResponse;

  @override
  void initState() {
    pokemonResponse = PokemonApi().fetchPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PokemonResponse>(
        future: PokemonApi().fetchPokemon(),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return Text('Ada Data');
            } else {
              return Text('Tidak ada data');
            }
          }
        },
      ),
    );
  }
}
