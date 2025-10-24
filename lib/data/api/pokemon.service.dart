import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

class PokemonService {

  static final String _baseUrl = 'https://pokebuildapi.fr/api/v1';

  static Future<List<Pokemon>> fetchPokemonList() async {
    final Uri url = Uri.parse('$_baseUrl/pokemon');
    final http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Pokemon list not available');
    }

    try {
      final List<dynamic> list = json.decode(response.body);
      List<Pokemon> res = list.map((dynamic model) => Pokemon.fromJson(model)).toList();
      // for each pokemon, reverse the types list to have the correct order
      for (final Pokemon p in res) {
        List<PokemonType> reversedPokemonType = p.types.reversed.toList();
        p.types.clear();
        p.types.addAll(reversedPokemonType);
      }
      return res;
    } catch (e) {
      throw Exception('Pokemon list not available');
    }
  }

}
