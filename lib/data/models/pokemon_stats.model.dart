class PokemonStats {
  const PokemonStats({
    required this.HP,
    required this.attack,
    required this.defence,
    required this.special_attack,
    required this.special_defence,
    required this.speed
  });

  final int HP;
  final int attack;
  final int defence;
  final int special_attack;
  final int special_defence;
  final int speed;

  static PokemonStats mock() => PokemonStats(
      HP: 10, attack: 20, defence: 30, special_attack: 40, special_defence: 50, speed: 60);

}