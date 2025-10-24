import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stats.model.g.dart';

@JsonSerializable()
class PokemonStats {
  const PokemonStats({
    required this.HP,
    required this.attack,
    required this.defense,
    required this.special_attack,
    required this.special_defense,
    required this.speed
  });

  final int HP;
  final int attack;
  final int defense;
  final int special_attack;
  final int special_defense;
  final int speed;

  factory PokemonStats.fromJson(Map<String, dynamic> json) => _$PokemonStatsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatsToJson(this);

  static PokemonStats mock() => PokemonStats(
      HP: 10, attack: 20, defense: 30, special_attack: 40, special_defense: 50, speed: 60);

}