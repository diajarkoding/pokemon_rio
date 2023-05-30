import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diajar_api/model/pokemon_model.dart';

class PokemonApi {
  // Future<PokemonResponse> fetchPokemon() async {
  //   final Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
  //   final response = await http.get(url);
  //   final data = PokemonResponse.fromJson(jsonDecode(response.body));
  //   if (response.statusCode == 200) {
  //     return data;
  //   } else {
  //     throw Exception('Terjadi kesalahan');
  //   }
  // }

  Future<PokemonResponse> fetchPokemon() async {
    final Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    final response = await http.get(url);
    // final data = jsonDecode(response.body);
    // print(data);
    final data = PokemonResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      for (var poke in data.result) {
        print(poke.name);
      }
      return data;
    } else {
      throw Exception('Terjadi Kesalahan');
    }
  }
}
