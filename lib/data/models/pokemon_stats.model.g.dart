// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stats.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStats _$PokemonStatsFromJson(Map<String, dynamic> json) => PokemonStats(
  HP: (json['HP'] as num).toInt(),
  attack: (json['attack'] as num).toInt(),
  defense: (json['defense'] as num).toInt(),
  special_attack: (json['special_attack'] as num).toInt(),
  special_defense: (json['special_defense'] as num).toInt(),
  speed: (json['speed'] as num).toInt(),
);

Map<String, dynamic> _$PokemonStatsToJson(PokemonStats instance) =>
    <String, dynamic>{
      'HP': instance.HP,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.special_attack,
      'special_defense': instance.special_defense,
      'speed': instance.speed,
    };
