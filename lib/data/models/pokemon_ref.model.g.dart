// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ref.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonRef _$PokemonRefFromJson(Map<String, dynamic> json) => PokemonRef(
  name: json['name'] as String,
  pokedexId: (json['pokedexId'] as num).toInt(),
);

Map<String, dynamic> _$PokemonRefToJson(PokemonRef instance) =>
    <String, dynamic>{'name': instance.name, 'pokedexId': instance.pokedexId};
