import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widget/pokemon_id.widget.dart';
import 'package:pokedex_app/ui/widget/pokemon_type_bubble.widget.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: pokemon.types.first.color,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              pokemon.name,
              style: const TextStyle(
                color: Colors.white,
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
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Le widget [Flexible] permet de répartir
              // l'espace utilisé par son enfant.
              //
              // Total des flex suivant : 5 + 4 = 9
              // ListView prendra 5/9 (~55%) de l'espace disponible.
              // Stack/Image prendra 4/9 (~45%) de l'espace disponible.
              Flexible(
                flex: 5,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) => PokemonTypeBubbleWidget(
                    type: pokemon.types.elementAt(index),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                  itemCount: pokemon.types.length,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Image.network(pokemon.image),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}