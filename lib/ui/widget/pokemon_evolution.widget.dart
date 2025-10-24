import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_ref.model.dart';
import 'package:pokedex_app/ui/widget/pokemon_id.widget.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    super.key,
    required this.evolutions
  });

  final List<PokemonRef> evolutions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "Évolutions",
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.7),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        ),
        for (final evolution in evolutions) ...[
          Row(
            children: <Widget> [
              Text(
                evolution.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(width: 25),
              PokemonIdWidget(
                id: evolution.pokedexId,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ]
      ],
    );
    }
}
