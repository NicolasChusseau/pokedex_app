import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/data/models/pokemon_ref.model.dart';
import 'package:pokedex_app/data/models/pokemon_stats.model.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

part 'pokemon.model.g.dart';

@JsonSerializable()
class Pokemon {
  const Pokemon({
    required this.id,
    required this.pokedexId,
    required this.name,
    required this.image,
    required this.stats,
    required this.types,
    required this.generation,
    required this.evolutions,
  });

  final int id;
  final int pokedexId;
  final String name;
  final String image;
  final PokemonStats stats;
  @JsonKey(name: 'apiTypes')
  final List<PokemonType> types;
  @JsonKey(name: 'apiGeneration')
  final int generation;
  @JsonKey(name: 'apiEvolutions')
  final List<PokemonRef> evolutions;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  static List<Pokemon> mocks() => List<Pokemon>.generate(
    50,
        (int index) => mock(id: index + 1),
  );

  static Pokemon mock({
    int id = 1,
  }) =>
      Pokemon(
        id: id,
        pokedexId: id,
        name: 'Pokémon $id',
        image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites'
            '/pokemon/other/official-artwork/1.png',
        stats: PokemonStats.mock(),
        types: List<PokemonType>.generate(
          Random().nextInt(2) + 1,
              (_) => PokemonType.mock(),
        ),
        generation: Random().nextInt(8) + 1,
        evolutions: <PokemonRef>[
          PokemonRef.mock(id + 1),
        ],
      );
}