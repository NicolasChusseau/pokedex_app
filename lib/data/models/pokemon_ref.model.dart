import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ref.model.g.dart';

@JsonSerializable()
class PokemonRef {
  const PokemonRef({
    required this.name,
    required this.pokedexId,
  });

  final String name;
  final int pokedexId;

  factory PokemonRef.fromJson(Map<String, dynamic> json) => _$PokemonRefFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonRefToJson(this);

  static PokemonRef mock([int index = 1]) => PokemonRef(
    name: 'Pokémon $index',
    pokedexId: index,
  );
}