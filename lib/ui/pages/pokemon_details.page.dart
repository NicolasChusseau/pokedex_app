import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widget/pokemon_id.widget.dart';
import 'package:pokedex_app/ui/widget/pokemon_type_bubble.widget.dart';

import '../widget/pokemon_details_app_bar.widget.dart';
import '../widget/pokemon_evolution.widget.dart';
import '../widget/pokemon_stats.widget.dart';

class PokemonDetailsPage extends StatelessWidget {

  const PokemonDetailsPage({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.types.first.color,
      appBar: PokemonDetailsAppBarWidget(pokemon: pokemon),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          spacing: 20,
          children: <Widget>[
            Row(
              children: <Widget> [
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Spacer(),
                PokemonIdWidget(
                  id: pokemon.pokedexId,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget> [
                for (final type in pokemon.types) ...[
                  PokemonTypeBubbleWidget(type: type),
                  const SizedBox(width: 10)
                ]
              ],
            ),
            SizedBox(height: 20),
            PokemonStatsWidget(stats : pokemon.stats),
            SizedBox(height: 20),
            PokemonEvolutionWidget(evolutions: pokemon.evolutions)
          ],
        )
      )
    );
  }

}
