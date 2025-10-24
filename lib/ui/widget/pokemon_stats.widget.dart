import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_stats.model.dart';
import 'package:pokedex_app/ui/widget/pokemon_stat.widget.dart';

class PokemonStatsWidget extends StatelessWidget {
  const PokemonStatsWidget({
    super.key,
    required this.stats
  });

  final PokemonStats stats;

@override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: <Widget> [
        Text(
            "Statistiques",
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.7),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        ),
        PokemonStatWidget(name: "PV", stat: stats.HP, color: Colors.green),
        PokemonStatWidget(name: "Attaque", stat: stats.attack, color: Colors.red),
        PokemonStatWidget(name: "Défense", stat: stats.defense, color: Colors.blue),
        PokemonStatWidget(name: "Atq. spé", stat: stats.special_attack, color: Colors.red),
        PokemonStatWidget(name: "Déf. spé", stat: stats.special_defense, color: Colors.blue),
        PokemonStatWidget(name: "Vitesse", stat: stats.speed, color: Colors.orange),
      ],
    );
  }
}
