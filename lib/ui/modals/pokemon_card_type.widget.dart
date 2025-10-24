import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

class PokemonCardTypeWidget extends StatelessWidget {
  const PokemonCardTypeWidget({
    super.key,
    required this.type,
  });

  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              type.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Image.network(type.image),
            ),
          ],
        ),
    );
  }
}
